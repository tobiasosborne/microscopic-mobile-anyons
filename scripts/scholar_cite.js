// Google Scholar citation search via Playwright
// Usage: node scripts/scholar_cite.js "paper title or search query"
// Outputs JSON array of citing papers

const { chromium } = require('playwright');

async function searchScholar(query, maxResults = 20) {
    const browser = await chromium.launch({ headless: true });
    const context = await browser.newContext({
        userAgent: 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    });
    const page = await context.newPage();

    try {
        const url = `https://scholar.google.com/scholar?q=${encodeURIComponent(query)}&num=${maxResults}`;
        await page.goto(url, { waitUntil: 'networkidle', timeout: 30000 });

        // Check for CAPTCHA
        const captcha = await page.$('#gs_captcha_f');
        if (captcha) {
            console.error(JSON.stringify({ error: 'CAPTCHA detected. Try again later or use a different IP.' }));
            await browser.close();
            return;
        }

        // Wait for results
        await page.waitForSelector('.gs_r', { timeout: 10000 }).catch(() => null);

        const results = await page.$$eval('.gs_r.gs_or.gs_scl', items => items.map(item => {
            const titleEl = item.querySelector('.gs_rt a') || item.querySelector('.gs_rt');
            const snippetEl = item.querySelector('.gs_rs');
            const metaEl = item.querySelector('.gs_a');
            const citeLinkEl = item.querySelector('.gs_fl a[href*="cites"]');

            return {
                title: titleEl ? titleEl.textContent.replace(/^\[.*?\]\s*/, '') : '',
                url: titleEl && titleEl.href ? titleEl.href : '',
                snippet: snippetEl ? snippetEl.textContent.substring(0, 200) : '',
                meta: metaEl ? metaEl.textContent : '',
                cited_by: citeLinkEl ? citeLinkEl.textContent.replace(/\D/g, '') : '0',
                cite_url: citeLinkEl ? citeLinkEl.href : '',
            };
        }));

        console.log(JSON.stringify(results, null, 2));
    } catch (err) {
        console.error(JSON.stringify({ error: err.message }));
    } finally {
        await browser.close();
    }
}

async function getCitingPapers(citeUrl, maxResults = 20) {
    const browser = await chromium.launch({ headless: true });
    const context = await browser.newContext({
        userAgent: 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    });
    const page = await context.newPage();

    try {
        await page.goto(citeUrl + `&num=${maxResults}`, { waitUntil: 'networkidle', timeout: 30000 });

        const captcha = await page.$('#gs_captcha_f');
        if (captcha) {
            console.error(JSON.stringify({ error: 'CAPTCHA on citation page' }));
            await browser.close();
            return;
        }

        await page.waitForSelector('.gs_r', { timeout: 10000 }).catch(() => null);

        const results = await page.$$eval('.gs_r.gs_or.gs_scl', items => items.map(item => {
            const titleEl = item.querySelector('.gs_rt a') || item.querySelector('.gs_rt');
            const metaEl = item.querySelector('.gs_a');
            return {
                title: titleEl ? titleEl.textContent.replace(/^\[.*?\]\s*/, '') : '',
                url: titleEl && titleEl.href ? titleEl.href : '',
                meta: metaEl ? metaEl.textContent : '',
            };
        }));

        console.log(JSON.stringify(results, null, 2));
    } catch (err) {
        console.error(JSON.stringify({ error: err.message }));
    } finally {
        await browser.close();
    }
}

// CLI
const args = process.argv.slice(2);
const mode = args[0];

if (mode === 'search') {
    searchScholar(args.slice(1).join(' '));
} else if (mode === 'cite-url') {
    getCitingPapers(args[1]);
} else {
    // Default: search
    searchScholar(args.join(' '));
}
