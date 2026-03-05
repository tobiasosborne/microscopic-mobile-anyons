#!/usr/bin/env python3
"""Literature review tools for mobile anyons project.

Usage:
    python scripts/litreview.py search "itinerant anyons fusion category"
    python scripts/litreview.py fetch 2301.12345
    python scripts/litreview.py extract literature/pdfs/somepaper.pdf
    python scripts/litreview.py verify-ref literature/pdfs/somepaper.pdf "Theorem 3.1"
    python scripts/litreview.py scholar-cite "Poilblanc 2013 itinerant anyons"
    python scripts/litreview.py bib literature/pdfs/somepaper.pdf
"""

import sys, os, json, time, re, urllib.request, urllib.parse
from pathlib import Path
from xml.etree import ElementTree as ET

PDF_DIR = Path("literature/pdfs")
PDF_DIR.mkdir(parents=True, exist_ok=True)

# ---------------------------------------------------------------------------
# arXiv search
# ---------------------------------------------------------------------------
def arxiv_search(query: str, max_results: int = 20):
    """Search arXiv API. Returns list of {id, title, authors, year, abstract, pdf_url}."""
    # Use AND between terms
    terms = query.split()
    q = "+AND+".join(f"all:{urllib.parse.quote(t)}" for t in terms)
    url = f"https://export.arxiv.org/api/query?search_query={q}&max_results={max_results}&sortBy=relevance"

    req = urllib.request.Request(url, headers={"User-Agent": "MobileAnyonsLitReview/1.0"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        xml = resp.read()

    ns = {"a": "http://www.w3.org/2005/Atom"}
    tree = ET.fromstring(xml)
    results = []
    for entry in tree.findall(".//a:entry", ns):
        arxiv_id = entry.find("a:id", ns).text.split("/abs/")[-1]
        title = " ".join(entry.find("a:title", ns).text.split())
        authors = [a.find("a:name", ns).text for a in entry.findall("a:author", ns)]
        published = entry.find("a:published", ns).text[:4]
        abstract = " ".join(entry.find("a:summary", ns).text.split())
        pdf_url = f"https://arxiv.org/pdf/{arxiv_id}"
        results.append({
            "id": arxiv_id, "title": title, "authors": authors,
            "year": published, "abstract": abstract[:300], "pdf_url": pdf_url,
        })
    return results


def semantic_scholar_search(query: str, max_results: int = 20, api_key: str = None):
    """Search Semantic Scholar API."""
    params = urllib.parse.urlencode({
        "query": query, "limit": max_results,
        "fields": "title,year,authors,externalIds,abstract,citationCount",
    })
    url = f"https://api.semanticscholar.org/graph/v1/paper/search?{params}"
    headers = {"User-Agent": "MobileAnyonsLitReview/1.0"}
    if api_key:
        headers["x-api-key"] = api_key

    req = urllib.request.Request(url, headers=headers)
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            data = json.loads(resp.read())
    except urllib.error.HTTPError as e:
        if e.code == 429:
            print("Semantic Scholar rate limited. Get API key: https://www.semanticscholar.org/product/api#api-key-form", file=sys.stderr)
            return []
        raise

    results = []
    for paper in data.get("data", []):
        ext = paper.get("externalIds", {})
        results.append({
            "id": ext.get("ArXiv", ext.get("DOI", paper.get("paperId", ""))),
            "title": paper.get("title", ""),
            "authors": [a["name"] for a in paper.get("authors", [])],
            "year": str(paper.get("year", "")),
            "abstract": (paper.get("abstract") or "")[:300],
            "citations": paper.get("citationCount", 0),
        })
    return results


# ---------------------------------------------------------------------------
# PDF download
# ---------------------------------------------------------------------------
def fetch_arxiv_pdf(arxiv_id: str, dest: Path = None) -> Path:
    """Download PDF from arXiv. Returns path to saved file."""
    # Clean ID
    arxiv_id = arxiv_id.replace("https://arxiv.org/abs/", "").replace("https://arxiv.org/pdf/", "")
    arxiv_id = arxiv_id.rstrip(".pdf")

    if dest is None:
        safe_name = arxiv_id.replace("/", "_").replace(".", "_")
        dest = PDF_DIR / f"{safe_name}.pdf"

    if dest.exists():
        print(f"Already have: {dest}")
        return dest

    url = f"https://arxiv.org/pdf/{arxiv_id}"
    print(f"Downloading {url} -> {dest}")
    req = urllib.request.Request(url, headers={"User-Agent": "MobileAnyonsLitReview/1.0"})
    with urllib.request.urlopen(req, timeout=60) as resp:
        dest.write_bytes(resp.read())

    time.sleep(3)  # Be nice to arXiv
    return dest


# ---------------------------------------------------------------------------
# PDF text extraction
# ---------------------------------------------------------------------------
def extract_text(pdf_path: str, pages: str = None) -> str:
    """Extract text from PDF using pymupdf. pages='1-5' for range."""
    import pymupdf
    doc = pymupdf.open(pdf_path)

    if pages:
        if "-" in pages:
            start, end = map(int, pages.split("-"))
            page_range = range(start - 1, min(end, len(doc)))
        else:
            page_range = [int(pages) - 1]
    else:
        page_range = range(len(doc))

    text = []
    for i in page_range:
        if i < len(doc):
            text.append(f"--- Page {i+1} ---\n{doc[i].get_text()}")

    return "\n".join(text)


def extract_metadata(pdf_path: str) -> dict:
    """Extract metadata from PDF."""
    import pymupdf
    doc = pymupdf.open(pdf_path)
    meta = doc.metadata
    return {
        "title": meta.get("title", ""),
        "author": meta.get("author", ""),
        "subject": meta.get("subject", ""),
        "pages": len(doc),
        "file": pdf_path,
    }


# ---------------------------------------------------------------------------
# Reference verification
# ---------------------------------------------------------------------------
def verify_ref(pdf_path: str, search_term: str) -> list:
    """Search for a term in a PDF. Returns list of (page, context) matches."""
    text = extract_text(pdf_path)
    matches = []
    for i, page_text in enumerate(text.split("--- Page ")):
        if not page_text.strip():
            continue
        lines = page_text.split("\n")
        page_num = lines[0].split(" ---")[0] if lines else "?"
        for j, line in enumerate(lines):
            if search_term.lower() in line.lower():
                # Get surrounding context
                start = max(0, j - 2)
                end = min(len(lines), j + 3)
                context = "\n".join(lines[start:end])
                matches.append({"page": page_num, "context": context})
    return matches


# ---------------------------------------------------------------------------
# Google Scholar via Playwright
# ---------------------------------------------------------------------------
def scholar_search_playwright(query: str, max_results: int = 10):
    """Search Google Scholar using Playwright (avoids bot detection).

    Requires: npx playwright install chromium
    """
    import subprocess

    js_code = f"""
    const {{ chromium }} = require('playwright');
    (async () => {{
        const browser = await chromium.launch({{ headless: true }});
        const page = await browser.newPage();
        await page.goto('https://scholar.google.com/scholar?q={urllib.parse.quote(query)}&num={max_results}');
        await page.waitForSelector('.gs_r', {{ timeout: 10000 }});

        const results = await page.$$eval('.gs_r.gs_or', items => items.map(item => {{
            const titleEl = item.querySelector('.gs_rt a');
            const snippetEl = item.querySelector('.gs_rs');
            const metaEl = item.querySelector('.gs_a');
            const citeEl = item.querySelector('.gs_fl a');
            return {{
                title: titleEl ? titleEl.textContent : '',
                url: titleEl ? titleEl.href : '',
                snippet: snippetEl ? snippetEl.textContent : '',
                meta: metaEl ? metaEl.textContent : '',
                cited_by: citeEl ? citeEl.textContent : '',
            }};
        }}));

        console.log(JSON.stringify(results));
        await browser.close();
    }})();
    """

    result = subprocess.run(
        ["node", "-e", js_code],
        capture_output=True, text=True, timeout=30,
    )

    if result.returncode != 0:
        print(f"Playwright error: {result.stderr}", file=sys.stderr)
        return []

    return json.loads(result.stdout)


# ---------------------------------------------------------------------------
# BibTeX generation from PDF
# ---------------------------------------------------------------------------
def generate_bib_entry(pdf_path: str) -> str:
    """Try to generate a BibTeX entry from PDF metadata + first page text."""
    meta = extract_metadata(pdf_path)
    first_page = extract_text(pdf_path, pages="1")

    # Try to find arXiv ID
    arxiv_match = re.search(r'(\d{4}\.\d{4,5})', first_page)
    arxiv_id = arxiv_match.group(1) if arxiv_match else ""

    # Try to find DOI
    doi_match = re.search(r'(10\.\d{4,}/\S+)', first_page)
    doi = doi_match.group(1).rstrip(".,;)") if doi_match else ""

    title = meta.get("title", "Unknown")
    author = meta.get("author", "Unknown")

    key = Path(pdf_path).stem

    lines = [f"@article{{{key},"]
    if title: lines.append(f"  title = {{{title}}},")
    if author: lines.append(f"  author = {{{author}}},")
    if arxiv_id: lines.append(f"  eprint = {{{arxiv_id}}},")
    if doi: lines.append(f"  doi = {{{doi}}},")
    lines.append(f"  file = {{{pdf_path}}},")
    lines.append("}")

    return "\n".join(lines)


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------
def main():
    if len(sys.argv) < 2:
        print(__doc__)
        sys.exit(1)

    cmd = sys.argv[1]

    if cmd == "search":
        query = " ".join(sys.argv[2:])
        print(f"=== arXiv results for: {query} ===\n")
        for r in arxiv_search(query):
            authors = r["authors"][0] + (" et al." if len(r["authors"]) > 1 else "")
            print(f"  {r['year']} | {authors} | {r['title'][:80]}")
            print(f"         {r['id']}")

        print(f"\n=== Semantic Scholar results ===\n")
        for r in semantic_scholar_search(query):
            authors = r["authors"][0] + (" et al." if len(r["authors"]) > 1 else "")
            print(f"  {r['year']} | {authors} | {r['title'][:80]} [cited:{r.get('citations',0)}]")
            print(f"         {r['id']}")

    elif cmd == "fetch":
        arxiv_id = sys.argv[2]
        path = fetch_arxiv_pdf(arxiv_id)
        print(f"Saved to: {path}")

    elif cmd == "extract":
        pdf_path = sys.argv[2]
        pages = sys.argv[3] if len(sys.argv) > 3 else None
        print(extract_text(pdf_path, pages))

    elif cmd == "verify-ref":
        pdf_path = sys.argv[2]
        term = " ".join(sys.argv[3:])
        matches = verify_ref(pdf_path, term)
        if matches:
            for m in matches:
                print(f"Page {m['page']}:\n{m['context']}\n---")
        else:
            print(f"NOT FOUND: '{term}' in {pdf_path}")

    elif cmd == "scholar-cite":
        query = " ".join(sys.argv[2:])
        results = scholar_search_playwright(query)
        for r in results:
            print(f"  {r['title'][:80]}")
            print(f"  {r['meta']}")
            print(f"  {r['cited_by']}")
            print()

    elif cmd == "bib":
        pdf_path = sys.argv[2]
        print(generate_bib_entry(pdf_path))

    elif cmd == "meta":
        pdf_path = sys.argv[2]
        meta = extract_metadata(pdf_path)
        for k, v in meta.items():
            print(f"  {k}: {v}")

    else:
        print(f"Unknown command: {cmd}")
        print(__doc__)
        sys.exit(1)


if __name__ == "__main__":
    main()
