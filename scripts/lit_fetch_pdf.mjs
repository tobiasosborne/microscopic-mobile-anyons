#!/usr/bin/env node
// Headed-Playwright fallback for paywalled PDFs on TIB VPN.
// Usage: node scripts/lit_fetch_pdf.mjs <url> <out_path>
//
// Pattern adapted from FQHE/scripts/fetch_aps_papers.mjs.
// Launches a persistent profile so Cloudflare / publisher login only need
// to be solved once per session.
//
// 1. Make sure TIB VPN is active.
// 2. Run with the publisher landing-page URL (e.g. doi.org/...).
// 3. Solve any Cloudflare / paywall challenge in the opened browser.
// 4. The script auto-detects when the page is past the challenge and
//    fetches the resolved PDF URL via page.request.get + body() + base64.

import { chromium } from "playwright";
import { writeFileSync, existsSync, mkdirSync } from "fs";
import { dirname, resolve } from "path";

const PROFILE_DIR = resolve(
  process.env.HOME ?? "/tmp",
  ".cache",
  "lit-playwright-profile",
);

const [, , URL_ARG, OUT_ARG, PDF_URL_ARG] = process.argv;

if (!URL_ARG || !OUT_ARG) {
  console.error(
    "usage: node scripts/lit_fetch_pdf.mjs <url> <out_path> [<pdf_url>]\n" +
      "  <url>      landing page (DOI URL or publisher abstract page)\n" +
      "  <out_path> where to save the PDF (relative to repo root)\n" +
      "  <pdf_url>  optional: direct PDF URL on the publisher (preferred)\n",
  );
  process.exit(2);
}

const REPO_ROOT = resolve(import.meta.dirname, "..");
const out = resolve(REPO_ROOT, OUT_ARG);
mkdirSync(dirname(out), { recursive: true });

if (existsSync(out)) {
  console.error(`out path already exists: ${out}`);
  process.exit(0);
}

async function waitPastCloudflare(page, timeoutMs = 180000) {
  console.error(
    "Waiting up to 3 minutes for any Cloudflare / publisher challenge...",
  );
  console.error(">>> Solve the challenge in the opened browser window <<<");
  try {
    await page.waitForFunction(
      () => {
        if (document.querySelector('meta[name="citation_title"]')) return true;
        if (document.querySelector("h1.article-title")) return true;
        if (document.querySelector(".citation_volume")) return true;
        if ((document.title ?? "").length > 5 &&
            !/just a moment/i.test(document.title) &&
            !/checking/i.test(document.title)) return true;
        return false;
      },
      { timeout: timeoutMs },
    );
    return true;
  } catch (_) {
    return false;
  }
}

const ctx = await chromium.launchPersistentContext(PROFILE_DIR, {
  headless: false,
  viewport: { width: 1280, height: 900 },
});
const page = await ctx.pages()[0] ?? await ctx.newPage();

console.error(`navigating to ${URL_ARG}`);
await page.goto(URL_ARG, { waitUntil: "domcontentloaded", timeout: 60000 });

const ok = await waitPastCloudflare(page);
if (!ok) {
  console.error("timed out waiting for challenge");
  await ctx.close();
  process.exit(1);
}

// Resolve the PDF URL.
let pdfUrl = PDF_URL_ARG;
if (!pdfUrl) {
  // Heuristic: look for citation_pdf_url meta or direct .pdf links.
  pdfUrl = await page.evaluate(() => {
    const m = document.querySelector('meta[name="citation_pdf_url"]');
    if (m) return m.getAttribute("content");
    const a = [...document.querySelectorAll("a")].find((x) =>
      /\.pdf(\?|$)/i.test(x.href),
    );
    return a ? a.href : null;
  });
}

if (!pdfUrl) {
  console.error("could not find PDF URL on the page");
  console.error("retry with explicit pdf_url as 3rd argument");
  await ctx.close();
  process.exit(1);
}

console.error(`fetching ${pdfUrl}`);
const resp = await page.request.get(pdfUrl, { timeout: 60000 });
if (resp.status() !== 200) {
  console.error(`HTTP ${resp.status()} for ${pdfUrl}`);
  await ctx.close();
  process.exit(1);
}
const body = await resp.body();
if (!body.toString("utf8", 0, 4).startsWith("%PDF")) {
  console.error(`first bytes are not %PDF: ${body.toString("utf8", 0, 16)}`);
  await ctx.close();
  process.exit(1);
}

writeFileSync(out, body);
console.error(`saved ${out} (${body.length} bytes)`);
await ctx.close();
process.exit(0);
