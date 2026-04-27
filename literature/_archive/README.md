# Archived literature documents

These three files were the literature record before the Lit-H/T/C/S
beads-tracked crawl on 2026-04-27. They are kept here for traceability but are
**superseded** by:

- `literature/SURVEY.md` — generated from `literature/db/papers.sqlite` (the
  canonical record). Run `python scripts/lit.py export survey` to regenerate.
- `literature/references.bib` — generated likewise; `python scripts/lit.py
  export bib`.

## What's here

| file | what it was |
|------|-------------|
| `catalog.md` | tier-grouped paper list with hand-tracked PDF/review status; ~50 entries; partial |
| `overview.md` | annotated bibliography snippet; promised a `references.bib` that never existed |
| `review.md` | executive-summary write-up of ~16 papers with gap analysis |

The new SQLite-backed pipeline reproduces (and goes beyond) all of these via
the `lit` CLI. Tier classifications and reviewer notes from `review.md` were
folded into the `papers.notes` column during ingestion (see
`literature/db/seed_existing_pdfs.json` for the manifest).
