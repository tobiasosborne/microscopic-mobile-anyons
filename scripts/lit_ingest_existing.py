#!/usr/bin/env python3
"""
One-shot: rename existing literature/pdfs/, dedup, and seed papers + provenance.

Reads literature/db/seed_existing_pdfs.json. For each entry:
  - action == "delete-duplicate-of": delete the file, record provenance
    pointing at the canonical paper.
  - otherwise: rename to {canonical_slug}.pdf, upsert paper into DB, record
    file_provenance.

Closes Lit-H3 (rename/dedup) and Lit-H4 (ingest).
"""

from __future__ import annotations

import hashlib
import json
import sqlite3
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
PDFS_DIR = REPO_ROOT / "literature" / "pdfs"
DB_PATH = REPO_ROOT / "literature" / "db" / "papers.sqlite"
MANIFEST = REPO_ROOT / "literature" / "db" / "seed_existing_pdfs.json"


def slug_to_filename(slug: str) -> str:
    # Replace forward slashes (cond-mat/0506438 -> cond-mat_0506438)
    return slug.replace("/", "_") + ".pdf"


def sha256_of(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def upsert_paper(conn: sqlite3.Connection, rec: dict) -> int:
    """Insert a paper row (or update if matched by arxiv_id/doi/bib_key)."""
    cur = conn.cursor()
    cols = [
        "arxiv_id", "doi", "title", "year", "venue", "authors_str",
        "abstract", "pdf_path", "md_path", "status", "tier", "notes",
        "bib_key",
    ]
    values = {c: rec.get(c) for c in cols}
    values["status"] = "have_pdf"
    values["pdf_path"] = rec["pdf_path_rel"]

    existing = None
    for key in ("arxiv_id", "doi", "bib_key"):
        v = values.get(key)
        if v:
            row = cur.execute(
                f"SELECT id FROM papers WHERE {key} = ?", (v,)
            ).fetchone()
            if row:
                existing = row["id"]
                break

    if existing is not None:
        sets, params = [], []
        for c in cols:
            if values[c] is not None:
                sets.append(f"{c} = ?")
                params.append(values[c])
        params.append(existing)
        cur.execute(
            f"UPDATE papers SET {', '.join(sets)} WHERE id = ?", params
        )
        return existing

    placeholders = ", ".join("?" for _ in cols)
    cur.execute(
        f"INSERT INTO papers ({', '.join(cols)}) VALUES ({placeholders})",
        [values[c] for c in cols],
    )
    return cur.lastrowid


def main() -> int:
    if not DB_PATH.exists():
        sys.exit("DB not initialised. Run: python scripts/lit.py init")

    manifest = json.loads(MANIFEST.read_text())

    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    conn.execute("PRAGMA foreign_keys = ON")

    # First pass: keep + rename. Track slug -> paper_id for dedup resolution.
    slug_to_pid: dict[str, int] = {}
    kept = 0
    for rec in manifest:
        if rec.get("action") == "delete-duplicate-of":
            continue
        slug = rec["canonical_slug"]
        original = PDFS_DIR / rec["original_filename"]
        if not original.exists():
            print(f"  WARN: missing source {rec['original_filename']!r}",
                  file=sys.stderr)
            continue

        target = PDFS_DIR / slug_to_filename(slug)
        if original != target:
            if target.exists():
                print(
                    f"  WARN: target {target.name!r} already exists; "
                    f"leaving {original.name!r} in place",
                    file=sys.stderr,
                )
                continue
            original.rename(target)

        sha = sha256_of(target)
        rec["pdf_path_rel"] = str(target.relative_to(REPO_ROOT))
        paper_id = upsert_paper(conn, rec)
        slug_to_pid[slug] = paper_id

        conn.execute(
            "INSERT INTO file_provenance "
            "(paper_id, original_filename, canonical_path, file_kind, sha256) "
            "VALUES (?, ?, ?, 'pdf', ?)",
            (paper_id, rec["original_filename"], rec["pdf_path_rel"], sha),
        )

        if rec.get("is_seed"):
            conn.execute(
                "INSERT OR REPLACE INTO seeds (paper_id, reason) VALUES (?, ?)",
                (paper_id, rec.get("seed_reason", "manual")),
            )
        kept += 1
        print(f"  kept   {target.name}  (id={paper_id})")

    # Second pass: deletions. Need slug_to_pid populated.
    deleted = 0
    for rec in manifest:
        if rec.get("action") != "delete-duplicate-of":
            continue
        original = PDFS_DIR / rec["original_filename"]
        dup_slug = rec["duplicate_of_slug"]
        canonical_pid = slug_to_pid.get(dup_slug)

        if not original.exists():
            print(f"  WARN: dup file already gone: {rec['original_filename']}",
                  file=sys.stderr)
            continue

        sha = sha256_of(original)
        conn.execute(
            "INSERT INTO file_provenance "
            "(paper_id, original_filename, canonical_path, file_kind, sha256) "
            "VALUES (?, ?, ?, 'pdf', ?)",
            (canonical_pid, rec["original_filename"], "<deleted-duplicate>", sha),
        )
        original.unlink()
        deleted += 1
        print(f"  delete {rec['original_filename']}  -> dup of {dup_slug}")

    conn.commit()
    conn.close()
    print(f"\nkept {kept}, deleted {deleted}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
