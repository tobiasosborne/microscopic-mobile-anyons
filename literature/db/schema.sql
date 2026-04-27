-- Literature database for microscopic-mobile-anyons.
-- SQLite is the source of truth; references.bib and SURVEY.md are generated views.

PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS papers (
    id            INTEGER PRIMARY KEY,
    arxiv_id      TEXT UNIQUE,                  -- e.g. "1608.04927" or "cond-mat/0612341"
    doi           TEXT UNIQUE,
    title         TEXT NOT NULL,
    year          INTEGER,
    venue         TEXT,
    authors_str   TEXT,                         -- denormalised for display
    abstract      TEXT,
    pdf_path      TEXT,                         -- relative to repo root
    md_path       TEXT,
    status        TEXT NOT NULL DEFAULT 'stub', -- stub|metadata_only|have_pdf|reviewed|excluded
    tier          INTEGER,                      -- 1..5 (1 = directly defines var-N anyon Fock)
    notes         TEXT,
    s2_paper_id   TEXT UNIQUE,
    openalex_id   TEXT UNIQUE,
    inspire_id    TEXT,
    bib_key       TEXT UNIQUE,                  -- canonical BibTeX key
    added_at      TEXT NOT NULL DEFAULT (datetime('now')),
    updated_at    TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS authors (
    id     INTEGER PRIMARY KEY,
    last   TEXT NOT NULL,
    first  TEXT,
    orcid  TEXT UNIQUE,
    UNIQUE (last, first)
);

CREATE TABLE IF NOT EXISTS paper_authors (
    paper_id  INTEGER NOT NULL REFERENCES papers(id) ON DELETE CASCADE,
    author_id INTEGER NOT NULL REFERENCES authors(id) ON DELETE CASCADE,
    position  INTEGER NOT NULL,                 -- 1-based author order
    PRIMARY KEY (paper_id, author_id)
);

CREATE TABLE IF NOT EXISTS citations (
    src_paper_id INTEGER NOT NULL REFERENCES papers(id) ON DELETE CASCADE,
    dst_paper_id INTEGER NOT NULL REFERENCES papers(id) ON DELETE CASCADE,
    source       TEXT    NOT NULL,              -- s2|openalex|inspire|arxiv|gs|manual
    fetched_at   TEXT    NOT NULL DEFAULT (datetime('now')),
    PRIMARY KEY (src_paper_id, dst_paper_id, source),
    CHECK (src_paper_id != dst_paper_id)
);

CREATE TABLE IF NOT EXISTS seeds (
    paper_id  INTEGER PRIMARY KEY REFERENCES papers(id) ON DELETE CASCADE,
    reason    TEXT NOT NULL,
    added_at  TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS crawl_log (
    id        INTEGER PRIMARY KEY,
    ts        TEXT NOT NULL DEFAULT (datetime('now')),
    source    TEXT NOT NULL,                    -- s2|openalex|arxiv|gs|inspire
    query     TEXT NOT NULL,
    n_found   INTEGER,
    n_new     INTEGER,
    notes     TEXT
);

CREATE TABLE IF NOT EXISTS file_provenance (
    id                INTEGER PRIMARY KEY,
    paper_id          INTEGER REFERENCES papers(id) ON DELETE CASCADE,
    original_filename TEXT NOT NULL,
    canonical_path    TEXT NOT NULL,
    file_kind         TEXT NOT NULL,            -- pdf|md|jpeg
    sha256            TEXT,
    moved_at          TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE INDEX IF NOT EXISTS idx_papers_status    ON papers(status);
CREATE INDEX IF NOT EXISTS idx_papers_tier      ON papers(tier);
CREATE INDEX IF NOT EXISTS idx_papers_arxiv     ON papers(arxiv_id);
CREATE INDEX IF NOT EXISTS idx_papers_doi       ON papers(doi);
CREATE INDEX IF NOT EXISTS idx_citations_src    ON citations(src_paper_id);
CREATE INDEX IF NOT EXISTS idx_citations_dst    ON citations(dst_paper_id);
CREATE INDEX IF NOT EXISTS idx_citations_source ON citations(source);

-- Bumps updated_at on any papers row mutation.
CREATE TRIGGER IF NOT EXISTS papers_updated
AFTER UPDATE ON papers
FOR EACH ROW
WHEN NEW.updated_at = OLD.updated_at
BEGIN
    UPDATE papers SET updated_at = datetime('now') WHERE id = NEW.id;
END;
