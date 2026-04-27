#!/usr/bin/env python3
"""
literature crawl CLI for microscopic-mobile-anyons.

SQLite is the source of truth; references.bib and SURVEY.md are generated views.

The DB lives at literature/db/papers.sqlite (gitignored). Schema is in
literature/db/schema.sql. Both views are committed.

Subcommands (stubs raise NotImplementedError until their owning beads task lands):
    init                       Create the database from schema.sql               [Lit-H1]
    status                     Quick DB stats                                    [Lit-H1]
    seed                       Insert/update a paper from a JSON blob            [Lit-H1]
    add <arxiv|doi>            Fetch metadata, insert paper                      [Lit-T1]
    fetch-cites <id>           Pull bidirectional citations                      [Lit-T2]
    pdf <id>                   Download PDF (arXiv -> headed Playwright)         [Lit-T3]
    md <id>                    Convert PDF -> markdown via marker                [Lit-T4]
    gscholar <query>           Headed-Playwright fallback search                 [Lit-T5]
    export bib|survey          Regenerate references.bib / SURVEY.md             [Lit-T6]
    gaps                       Audit: missing PDFs / unreviewed / stub-only      [Lit-T6]
"""

from __future__ import annotations

import argparse
import json
import sqlite3
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
DB_DIR = REPO_ROOT / "literature" / "db"
DB_PATH = DB_DIR / "papers.sqlite"
SCHEMA_PATH = DB_DIR / "schema.sql"


def connect() -> sqlite3.Connection:
    """Open the DB. Caller is responsible for committing."""
    if not DB_PATH.exists():
        sys.exit(
            f"DB not initialised at {DB_PATH.relative_to(REPO_ROOT)}.\n"
            f"Run: python scripts/lit.py init"
        )
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")
    return conn


# ---------- init ----------

def cmd_init(args: argparse.Namespace) -> None:
    DB_DIR.mkdir(parents=True, exist_ok=True)
    if DB_PATH.exists() and not args.force:
        print(f"DB already exists at {DB_PATH.relative_to(REPO_ROOT)}")
        print("Pass --force to recreate (destroys existing data).")
        return
    if DB_PATH.exists():
        DB_PATH.unlink()
    conn = sqlite3.connect(DB_PATH)
    schema = SCHEMA_PATH.read_text()
    conn.executescript(schema)
    conn.commit()
    conn.close()
    print(f"Initialised {DB_PATH.relative_to(REPO_ROOT)}")


# ---------- status ----------

def cmd_status(_args: argparse.Namespace) -> None:
    conn = connect()
    cur = conn.cursor()

    rows = cur.execute(
        "SELECT status, COUNT(*) AS n FROM papers GROUP BY status ORDER BY status"
    ).fetchall()
    total = sum(r["n"] for r in rows) or 0
    print(f"papers: {total}")
    for r in rows:
        print(f"  {r['status']:>15s}  {r['n']}")

    tier_rows = cur.execute(
        "SELECT tier, COUNT(*) AS n FROM papers WHERE tier IS NOT NULL "
        "GROUP BY tier ORDER BY tier"
    ).fetchall()
    if tier_rows:
        print("by tier:")
        for r in tier_rows:
            print(f"  T{r['tier']}  {r['n']}")

    n_seeds = cur.execute("SELECT COUNT(*) FROM seeds").fetchone()[0]
    n_cites = cur.execute("SELECT COUNT(*) FROM citations").fetchone()[0]
    n_authors = cur.execute("SELECT COUNT(*) FROM authors").fetchone()[0]
    print(f"seeds: {n_seeds}   citations: {n_cites}   authors: {n_authors}")
    conn.close()


# ---------- seed ----------

def cmd_seed(args: argparse.Namespace) -> None:
    """Insert/upsert a paper from a JSON blob on stdin or in --file.

    Schema: {"arxiv_id": "...", "doi": "...", "title": "...", "year": 2016,
             "venue": "...", "authors_str": "...", "abstract": "...",
             "tier": 1, "status": "have_pdf", "pdf_path": "...",
             "is_seed": true, "seed_reason": "..."}
    """
    if args.file:
        blob = json.loads(Path(args.file).read_text())
    else:
        blob = json.loads(sys.stdin.read())
    if isinstance(blob, dict):
        records = [blob]
    elif isinstance(blob, list):
        records = blob
    else:
        sys.exit("seed: expected JSON object or array")

    conn = connect()
    cur = conn.cursor()
    inserted = 0
    updated = 0
    for rec in records:
        if "title" not in rec:
            sys.exit(f"seed: missing title in record {rec!r}")
        cols = [
            "arxiv_id", "doi", "title", "year", "venue", "authors_str",
            "abstract", "pdf_path", "md_path", "status", "tier", "notes",
            "s2_paper_id", "openalex_id", "inspire_id", "bib_key",
        ]
        values = {c: rec.get(c) for c in cols}

        # Match priority: arxiv_id -> doi -> bib_key -> exact title+year.
        existing = None
        if values["arxiv_id"]:
            existing = cur.execute(
                "SELECT id FROM papers WHERE arxiv_id = ?", (values["arxiv_id"],)
            ).fetchone()
        if not existing and values["doi"]:
            existing = cur.execute(
                "SELECT id FROM papers WHERE doi = ?", (values["doi"],)
            ).fetchone()
        if not existing and values["bib_key"]:
            existing = cur.execute(
                "SELECT id FROM papers WHERE bib_key = ?", (values["bib_key"],)
            ).fetchone()
        if not existing and values["title"] and values["year"]:
            existing = cur.execute(
                "SELECT id FROM papers WHERE title = ? AND year = ?",
                (values["title"], values["year"]),
            ).fetchone()

        if existing:
            paper_id = existing["id"]
            sets = []
            params = []
            for c in cols:
                if values[c] is not None:
                    sets.append(f"{c} = ?")
                    params.append(values[c])
            if sets:
                params.append(paper_id)
                cur.execute(
                    f"UPDATE papers SET {', '.join(sets)} WHERE id = ?", params
                )
                updated += 1
        else:
            placeholders = ", ".join("?" for _ in cols)
            cur.execute(
                f"INSERT INTO papers ({', '.join(cols)}) VALUES ({placeholders})",
                [values[c] for c in cols],
            )
            paper_id = cur.lastrowid
            inserted += 1

        if rec.get("is_seed"):
            cur.execute(
                "INSERT OR REPLACE INTO seeds (paper_id, reason) VALUES (?, ?)",
                (paper_id, rec.get("seed_reason", "manual")),
            )

    conn.commit()
    conn.close()
    print(f"seeded: {inserted} inserted, {updated} updated")


# ---------- stubs ----------

def _not_yet(task_id: str):
    def _impl(_args: argparse.Namespace) -> None:
        raise NotImplementedError(f"see beads issue {task_id}")
    return _impl


# ---------- export bib / survey (v0; T6 will expand) ----------

TIER_NAMES = {
    1: "Tier 1 — directly defines variable-N anyon Hilbert space "
       "from a fusion category",
    2: "Tier 2 — dense anyonic chain ancestry",
    3: "Tier 3 — categorical / mathematical foundations",
    4: "Tier 4 — numerical methods for anyonic systems",
    5: "Tier 5 — adjacent / abelian / triage",
}


def _entry_kind(rec: sqlite3.Row) -> str:
    venue = (rec["venue"] or "").lower()
    if "thesis" in venue:
        return "phdthesis"
    if "lecture" in venue or "notes" in venue:
        return "misc"
    if "monograph" in venue or "ams" in venue or "book" in venue:
        return "book"
    return "article"


def _bib_entry(rec: sqlite3.Row) -> str:
    key = rec["bib_key"] or (rec["arxiv_id"] or rec["doi"] or f"paper{rec['id']}")
    fields = []
    if rec["authors_str"]:
        fields.append(("author", rec["authors_str"]))
    if rec["title"]:
        fields.append(("title", rec["title"]))
    if rec["year"]:
        fields.append(("year", str(rec["year"])))
    if rec["venue"]:
        fields.append(("journal", rec["venue"]))
    if rec["doi"]:
        fields.append(("doi", rec["doi"]))
    if rec["arxiv_id"]:
        fields.append(("eprint", rec["arxiv_id"]))
        fields.append(("archivePrefix", "arXiv"))
    if rec["notes"]:
        fields.append(("note", rec["notes"]))
    body = ",\n  ".join(f"{k} = {{{v}}}" for k, v in fields)
    return f"@{_entry_kind(rec)}{{{key},\n  {body}\n}}"


def cmd_export(args: argparse.Namespace) -> None:
    conn = connect()
    cur = conn.cursor()

    if args.kind in ("bib", "all"):
        rows = cur.execute(
            "SELECT * FROM papers ORDER BY year, authors_str"
        ).fetchall()
        out = REPO_ROOT / "literature" / "references.bib"
        with out.open("w") as f:
            f.write("% Generated from literature/db/papers.sqlite\n")
            f.write("% Edit the DB; do not hand-edit this file.\n\n")
            for r in rows:
                f.write(_bib_entry(r) + "\n\n")
        print(f"wrote {out.relative_to(REPO_ROOT)}  ({len(rows)} entries)")

    if args.kind in ("survey", "all"):
        out = REPO_ROOT / "literature" / "SURVEY.md"
        rows = cur.execute(
            "SELECT * FROM papers ORDER BY tier, year, authors_str"
        ).fetchall()
        seed_ids = {
            r["paper_id"]
            for r in cur.execute("SELECT paper_id FROM seeds").fetchall()
        }
        with out.open("w") as f:
            f.write("# Literature Survey — Mobile Anyons from Fusion Categories\n\n")
            f.write("> Generated from `literature/db/papers.sqlite`. ")
            f.write("Edit the DB, not this file.\n\n")

            f.write("## Anchor seeds\n\n")
            f.write("| arXiv/DOI | Authors | Year | Title | Reason |\n")
            f.write("|-----------|---------|------|-------|--------|\n")
            seeds = cur.execute(
                "SELECT p.*, s.reason FROM papers p JOIN seeds s ON s.paper_id = p.id "
                "ORDER BY p.year"
            ).fetchall()
            for r in seeds:
                ident = r["arxiv_id"] or r["doi"] or "—"
                f.write(
                    f"| {ident} | {r['authors_str'] or ''} | {r['year'] or ''} | "
                    f"{r['title']} | {r['reason']} |\n"
                )
            f.write("\n")

            for tier in (1, 2, 3, 4, 5):
                tier_rows = [r for r in rows if r["tier"] == tier]
                if not tier_rows:
                    continue
                f.write(f"## {TIER_NAMES[tier]}\n\n")
                for r in tier_rows:
                    seed_marker = " 🔑" if r["id"] in seed_ids else ""
                    tag = r["bib_key"] or f"paper{r['id']}"
                    authors = r["authors_str"] or "?"
                    year = r["year"] or "????"
                    f.write(f"### [{tag}] {authors} ({year}) — {r['title']}{seed_marker}\n\n")
                    if r["arxiv_id"]:
                        f.write(f"- **arXiv**: {r['arxiv_id']}\n")
                    if r["doi"]:
                        f.write(f"- **DOI**: {r['doi']}\n")
                    if r["venue"]:
                        f.write(f"- **Venue**: {r['venue']}\n")
                    f.write(f"- **PDF status**: {r['status']}")
                    if r["pdf_path"]:
                        f.write(f" (`{r['pdf_path']}`)")
                    f.write("\n")
                    if r["notes"]:
                        f.write(f"- **Notes**: {r['notes']}\n")
                    f.write("\n")

            f.write(
                "\n---\n\nReporting standard borrowed from "
                "`Bennett.jl/docs/literature/SURVEY.md` and "
                "`Sturm.jl/docs/literature/REPORTING_STANDARD.md`. "
                "Tier definitions are in this file's section headers.\n"
            )
        print(f"wrote {out.relative_to(REPO_ROOT)}  ({len(rows)} papers)")

    conn.close()


def cmd_gaps(_args: argparse.Namespace) -> None:
    conn = connect()
    cur = conn.cursor()
    print("=== papers without PDF ===")
    for r in cur.execute(
        "SELECT id, arxiv_id, doi, title FROM papers "
        "WHERE pdf_path IS NULL ORDER BY year DESC"
    ):
        ident = r["arxiv_id"] or r["doi"] or "—"
        print(f"  {ident:25s}  {r['title'][:80]}")
    print()
    print("=== papers without tier (need triage) ===")
    for r in cur.execute(
        "SELECT id, arxiv_id, title FROM papers WHERE tier IS NULL"
    ):
        print(f"  {r['arxiv_id'] or '—':25s}  {r['title'][:80]}")
    print()
    print("=== stub papers (no metadata yet) ===")
    for r in cur.execute(
        "SELECT id, arxiv_id, title FROM papers WHERE status = 'stub'"
    ):
        print(f"  {r['arxiv_id'] or '—':25s}  {r['title'][:80]}")
    conn.close()


# ---------- argparse ----------

def build_parser() -> argparse.ArgumentParser:
    p = argparse.ArgumentParser(
        prog="lit",
        description="Literature crawl CLI (microscopic-mobile-anyons).",
    )
    sub = p.add_subparsers(dest="cmd", required=True)

    p_init = sub.add_parser("init", help="Create the database")
    p_init.add_argument("--force", action="store_true",
                        help="Drop and recreate the DB")
    p_init.set_defaults(func=cmd_init)

    p_status = sub.add_parser("status", help="Quick DB stats")
    p_status.set_defaults(func=cmd_status)

    p_seed = sub.add_parser("seed", help="Upsert a paper from JSON")
    p_seed.add_argument("--file", help="Read JSON from file instead of stdin")
    p_seed.set_defaults(func=cmd_seed)

    p_add = sub.add_parser("add", help="Fetch metadata for arXiv/DOI [T1]")
    p_add.add_argument("ident", help="arXiv id or DOI")
    p_add.set_defaults(func=_not_yet("ma-957"))

    p_cites = sub.add_parser("fetch-cites", help="Pull citations [T2]")
    p_cites.add_argument("ident")
    p_cites.add_argument("--source", choices=["s2", "openalex", "both"],
                         default="both")
    p_cites.add_argument("--direction",
                         choices=["forward", "backward", "both"], default="both")
    p_cites.set_defaults(func=_not_yet("ma-vwq"))

    p_pdf = sub.add_parser("pdf", help="Download PDF [T3]")
    p_pdf.add_argument("ident")
    p_pdf.set_defaults(func=_not_yet("ma-o7h"))

    p_md = sub.add_parser("md", help="Convert PDF -> markdown [T4]")
    p_md.add_argument("ident")
    p_md.set_defaults(func=_not_yet("ma-ah9"))

    p_gs = sub.add_parser("gscholar", help="Headed Playwright fallback [T5]")
    p_gs.add_argument("query", nargs="+")
    p_gs.set_defaults(func=_not_yet("ma-7k0"))

    p_exp = sub.add_parser("export", help="Regenerate references.bib / SURVEY.md")
    p_exp.add_argument("kind", choices=["bib", "survey", "all"])
    p_exp.set_defaults(func=cmd_export)

    p_gaps = sub.add_parser("gaps", help="Audit DB for unfinished work")
    p_gaps.set_defaults(func=cmd_gaps)

    return p


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)
    try:
        args.func(args)
    except NotImplementedError as e:
        print(f"not yet implemented: {e}", file=sys.stderr)
        return 2
    return 0


if __name__ == "__main__":
    sys.exit(main())
