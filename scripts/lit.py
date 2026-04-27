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
import re
import sqlite3
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
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


# ---------- HTTP helpers ----------

USER_AGENT = (
    "microscopic-mobile-anyons-lit/0.1 "
    "(https://github.com/tobiasosborne/microscopic-mobile-anyons; "
    "tobias.osborne@itp.uni-hannover.de)"
)
S2_BASE = "https://api.semanticscholar.org/graph/v1"
OPENALEX_BASE = "https://api.openalex.org"
ARXIV_API = "http://export.arxiv.org/api/query"

# Conservative pacing for unauthenticated S2 (100 req / 5min).
S2_SLEEP = 1.2


def _http_get_json(url: str, timeout: float = 30.0,
                   retries: int = 3) -> dict | None:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT,
                                               "Accept": "application/json"})
    backoff = 2.0
    for attempt in range(retries):
        try:
            with urllib.request.urlopen(req, timeout=timeout) as resp:
                return json.loads(resp.read().decode("utf-8"))
        except urllib.error.HTTPError as e:
            if e.code == 429 and attempt < retries - 1:
                # rate-limited
                time.sleep(backoff)
                backoff *= 2
                continue
            if e.code == 404:
                return None
            print(f"  HTTP {e.code} for {url}", file=sys.stderr)
            return None
        except (urllib.error.URLError, TimeoutError) as e:
            if attempt < retries - 1:
                time.sleep(backoff)
                backoff *= 2
                continue
            print(f"  net error for {url}: {e}", file=sys.stderr)
            return None
    return None


def _http_get_text(url: str, timeout: float = 30.0) -> str | None:
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as resp:
            return resp.read().decode("utf-8")
    except (urllib.error.HTTPError, urllib.error.URLError, TimeoutError) as e:
        print(f"  fetch failed {url}: {e}", file=sys.stderr)
        return None


# ---------- identifier parsing ----------

ARXIV_ID_RE = re.compile(
    r"^(?:arXiv:|arxiv:)?"
    r"(?P<id>(?:[a-z\-]+(?:\.[A-Z]{2})?/\d{7})|(?:\d{4}\.\d{4,5}))"
    r"(?:v\d+)?$"
)
DOI_RE = re.compile(r"^(?:doi:|https?://(?:dx\.)?doi\.org/)?(?P<id>10\.\d{4,9}/.+)$",
                    re.IGNORECASE)


def parse_ident(ident: str) -> tuple[str, str]:
    """Parse 'arXiv:1234.5678' or '10.1103/...' -> ('arxiv'|'doi', clean_id)."""
    s = ident.strip()
    m = ARXIV_ID_RE.match(s)
    if m:
        return "arxiv", m.group("id")
    m = DOI_RE.match(s)
    if m:
        return "doi", m.group("id")
    raise ValueError(f"could not parse identifier: {ident!r}")


# ---------- Semantic Scholar ----------

S2_FIELDS = (
    "paperId,externalIds,title,abstract,year,venue,publicationVenue,"
    "authors.authorId,authors.name,authors.externalIds"
)


def s2_lookup(kind: str, ident: str) -> dict | None:
    """Fetch a paper record from S2 by arXiv id or DOI."""
    if kind == "arxiv":
        key = f"arXiv:{ident}"
    elif kind == "doi":
        key = f"DOI:{ident}"
    else:
        raise ValueError(kind)
    url = f"{S2_BASE}/paper/{urllib.parse.quote(key, safe=':/.')}?fields={S2_FIELDS}"
    return _http_get_json(url)


# ---------- OpenAlex ----------

def openalex_lookup(kind: str, ident: str) -> dict | None:
    """Fetch a paper from OpenAlex by DOI or arXiv id."""
    if kind == "doi":
        url = f"{OPENALEX_BASE}/works/doi:{urllib.parse.quote(ident, safe='/.-_')}"
        return _http_get_json(url)
    if kind == "arxiv":
        # OpenAlex has no first-class arXiv-id filter. Search and take any
        # hit whose landing-page URL contains the arXiv id.
        url = (f"{OPENALEX_BASE}/works?search={urllib.parse.quote(ident)}"
               "&per_page=5")
        data = _http_get_json(url)
        if data and data.get("results"):
            for hit in data["results"]:
                for loc in (hit.get("locations") or []):
                    landing = loc.get("landing_page_url") or ""
                    if ident in landing:
                        return hit
        return None
    return None


def _openalex_to_s2_shape(work: dict) -> dict:
    """Coerce an OpenAlex work into the S2-shaped record _upsert_paper_from_s2 expects."""
    ext: dict[str, str] = {}
    ids = work.get("ids") or {}
    if ids.get("doi"):
        # OpenAlex returns "https://doi.org/10.x/y"; strip prefix.
        d = ids["doi"]
        ext["DOI"] = d.split("doi.org/")[-1] if "doi.org/" in d else d
    arxiv_id = None
    for loc in (work.get("locations") or []):
        src = loc.get("source") or {}
        if (src.get("display_name") or "").lower() == "arxiv":
            landing = loc.get("landing_page_url") or ""
            m = re.search(r"abs/([\w\-/.]+)", landing)
            if m:
                arxiv_id = m.group(1)
                break
    if arxiv_id:
        ext["ArXiv"] = arxiv_id

    venue = ((work.get("primary_location") or {}).get("source") or {}).get(
        "display_name"
    )
    authors = []
    for a in work.get("authorships") or []:
        au = a.get("author") or {}
        name = au.get("display_name")
        if not name:
            continue
        rec = {"name": name}
        oa_id = au.get("orcid")
        if oa_id:
            rec["externalIds"] = {"ORCID": oa_id.split("/")[-1]}
        authors.append(rec)

    abstract = None
    if work.get("abstract_inverted_index"):
        # OpenAlex stores abstracts in inverted-index form. Flatten.
        idx = work["abstract_inverted_index"]
        positions = {}
        for word, locs in idx.items():
            for p in locs:
                positions[p] = word
        abstract = " ".join(positions[k] for k in sorted(positions))

    return {
        "paperId": None,
        "externalIds": ext,
        "title": work.get("title"),
        "abstract": abstract,
        "year": work.get("publication_year"),
        "venue": venue,
        "authors": authors,
    }


# ---------- arXiv ----------

ATOM_NS = {"a": "http://www.w3.org/2005/Atom",
           "arxiv": "http://arxiv.org/schemas/atom"}


def arxiv_lookup(arxiv_id: str) -> dict | None:
    """Fetch title/authors/year/abstract from the arXiv API."""
    url = f"{ARXIV_API}?id_list={urllib.parse.quote(arxiv_id)}"
    text = _http_get_text(url)
    if not text:
        return None
    try:
        root = ET.fromstring(text)
    except ET.ParseError:
        return None
    entry = root.find("a:entry", ATOM_NS)
    if entry is None:
        return None
    title = (entry.findtext("a:title", default="", namespaces=ATOM_NS) or "").strip()
    abstract = (entry.findtext("a:summary", default="",
                               namespaces=ATOM_NS) or "").strip()
    pub = (entry.findtext("a:published", default="",
                          namespaces=ATOM_NS) or "").strip()
    year = int(pub[:4]) if pub[:4].isdigit() else None
    authors = []
    for a in entry.findall("a:author", ATOM_NS):
        n = a.findtext("a:name", default="", namespaces=ATOM_NS)
        if n:
            authors.append(n.strip())
    cat = entry.find("arxiv:primary_category", ATOM_NS)
    primary_cat = cat.attrib.get("term") if cat is not None else None
    return {
        "title": " ".join(title.split()),
        "abstract": " ".join(abstract.split()),
        "year": year,
        "authors": authors,
        "primary_category": primary_cat,
    }


# ---------- DB helpers ----------

def _author_lastname(name: str) -> tuple[str, str | None]:
    name = name.strip()
    if "," in name:
        last, first = name.split(",", 1)
        return last.strip(), first.strip() or None
    parts = name.split()
    if len(parts) == 1:
        return parts[0], None
    return parts[-1], " ".join(parts[:-1])


def _ensure_author(conn: sqlite3.Connection, name: str,
                   orcid: str | None) -> int:
    last, first = _author_lastname(name)
    cur = conn.cursor()
    if orcid:
        row = cur.execute("SELECT id FROM authors WHERE orcid = ?",
                          (orcid,)).fetchone()
        if row:
            return row["id"]
    row = cur.execute(
        "SELECT id FROM authors WHERE last = ? AND COALESCE(first,'') = COALESCE(?, '')",
        (last, first),
    ).fetchone()
    if row:
        return row["id"]
    cur.execute(
        "INSERT INTO authors (last, first, orcid) VALUES (?, ?, ?)",
        (last, first, orcid),
    )
    return cur.lastrowid


def _upsert_paper_from_s2(conn: sqlite3.Connection, s2: dict) -> int:
    """Create/update a paper row from an S2 record."""
    cur = conn.cursor()
    ext = s2.get("externalIds") or {}
    arxiv = ext.get("ArXiv")
    doi = ext.get("DOI")
    s2id = s2.get("paperId")

    # Match priority: s2_paper_id -> arxiv_id -> doi.
    existing = None
    if s2id:
        existing = cur.execute(
            "SELECT id FROM papers WHERE s2_paper_id = ?", (s2id,)
        ).fetchone()
    if not existing and arxiv:
        existing = cur.execute(
            "SELECT id FROM papers WHERE arxiv_id = ?", (arxiv,)
        ).fetchone()
    if not existing and doi:
        existing = cur.execute(
            "SELECT id FROM papers WHERE doi = ?", (doi,)
        ).fetchone()

    venue = (
        s2.get("publicationVenue", {}).get("name") if s2.get("publicationVenue")
        else s2.get("venue")
    )
    authors = s2.get("authors") or []
    authors_str = ", ".join(a["name"] for a in authors if a.get("name"))

    fields = {
        "arxiv_id": arxiv,
        "doi": doi,
        "title": s2.get("title"),
        "year": s2.get("year"),
        "venue": venue,
        "authors_str": authors_str or None,
        "abstract": s2.get("abstract"),
        "s2_paper_id": s2id,
    }

    if existing:
        paper_id = existing["id"]
        sets, params = [], []
        for k, v in fields.items():
            if v is not None:
                sets.append(f"{k} = COALESCE(?, {k})")
                params.append(v)
        if sets:
            params.append(paper_id)
            cur.execute(f"UPDATE papers SET {', '.join(sets)} WHERE id = ?",
                        params)
    else:
        if not fields["title"]:
            raise RuntimeError("S2 record missing title")
        cols = list(fields.keys()) + ["status"]
        vals = list(fields.values()) + ["metadata_only"]
        ph = ", ".join("?" for _ in cols)
        cur.execute(
            f"INSERT INTO papers ({', '.join(cols)}) VALUES ({ph})", vals
        )
        paper_id = cur.lastrowid

    # Authors: refresh paper_authors mapping.
    cur.execute("DELETE FROM paper_authors WHERE paper_id = ?", (paper_id,))
    for pos, a in enumerate(authors, start=1):
        if not a.get("name"):
            continue
        orcid = (a.get("externalIds") or {}).get("ORCID")
        author_id = _ensure_author(conn, a["name"], orcid)
        cur.execute(
            "INSERT INTO paper_authors (paper_id, author_id, position) "
            "VALUES (?, ?, ?)",
            (paper_id, author_id, pos),
        )

    return paper_id


# ---------- cmd_add ----------

def cmd_add(args: argparse.Namespace) -> None:
    kind, ident = parse_ident(args.ident)
    print(f"add: {kind}={ident}")

    conn = connect()
    cur = conn.cursor()

    # Existing row (if any) by the supplied identifier.
    if kind == "arxiv":
        existing = cur.execute(
            "SELECT id FROM papers WHERE arxiv_id = ?", (ident,)
        ).fetchone()
    else:
        existing = cur.execute(
            "SELECT id FROM papers WHERE doi = ?", (ident,)
        ).fetchone()
    paper_id = existing["id"] if existing else None
    if paper_id:
        print(f"  already in DB as id={paper_id}; will enrich")

    # Try S2 first (richer record), fall back to OpenAlex.
    s2 = s2_lookup(kind, ident)
    time.sleep(S2_SLEEP)

    if s2:
        try:
            paper_id = _upsert_paper_from_s2(conn, s2)
            conn.commit()
            print(f"  S2 ok: paperId={s2.get('paperId')}  -> id={paper_id}")
        except RuntimeError as e:
            print(f"  S2 record incomplete: {e}", file=sys.stderr)
    else:
        print("  S2 miss; trying OpenAlex")
        oa = openalex_lookup(kind, ident)
        if oa:
            try:
                shape = _openalex_to_s2_shape(oa)
                paper_id = _upsert_paper_from_s2(conn, shape)
                # Record the OpenAlex id separately.
                oaid = (oa.get("ids") or {}).get("openalex")
                if oaid:
                    conn.execute(
                        "UPDATE papers SET openalex_id = ? WHERE id = ?",
                        (oaid, paper_id),
                    )
                conn.commit()
                print(f"  OpenAlex ok: id={paper_id}")
            except RuntimeError as e:
                print(f"  OpenAlex record incomplete: {e}", file=sys.stderr)
        else:
            print("  OpenAlex miss")

    # arXiv enrichment (works even if S2/OpenAlex gave us less).
    if kind == "arxiv":
        ax = arxiv_lookup(ident)
        if ax:
            if paper_id is None:
                cur.execute(
                    "INSERT INTO papers (arxiv_id, title, year, authors_str, "
                    "abstract, status) VALUES (?, ?, ?, ?, ?, 'metadata_only')",
                    (ident, ax["title"], ax["year"],
                     ", ".join(ax["authors"]) or None, ax["abstract"]),
                )
                paper_id = cur.lastrowid
                print(f"  arXiv-only insert: id={paper_id}")
            else:
                # arXiv title is authoritative for arXiv-id-keyed papers
                # (S2 sometimes returns titles with leftover LaTeX noise).
                cur.execute(
                    "UPDATE papers SET "
                    "abstract = COALESCE(abstract, ?), "
                    "title = COALESCE(?, title), "
                    "year = COALESCE(year, ?) "
                    "WHERE id = ?",
                    (ax["abstract"], ax["title"], ax["year"], paper_id),
                )
                print(f"  arXiv enriched: id={paper_id}")
            conn.commit()

    if paper_id is None:
        print("  could not find paper anywhere; nothing inserted",
              file=sys.stderr)
        sys.exit(2)

    conn.close()


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

    p_add = sub.add_parser("add", help="Fetch metadata for arXiv/DOI")
    p_add.add_argument("ident", help="arXiv id or DOI")
    p_add.set_defaults(func=cmd_add)

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
