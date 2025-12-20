# Project Tidy Review — 2025-12-20

## Summary

Audit of project structure against `tech_specs.md` specifications and cleanup of orphaned/misplaced files.

---

## Actions Taken

### 1. Consolidated `latex/` into `tex/` (per tech_specs.md §11)

**Issue:** Project had both `latex/` and `tex/` directories. Spec requires `tex/` only.

**Resolution:**
- Moved all `.tex` section files from `latex/` to `tex/sections/`
- Moved `paper.tex` to `tex/main.tex` (renamed per spec)
- Moved `paper.pdf` to `tex/`
- Deleted `latex/` directory and build artifacts (`.aux`, `.log`, `.out`, `.toc`)
- Updated `tex/main.tex` with correct `\input{sections/...}` paths
- Updated `tex/README.md` to reflect main.tex existence

### 2. Removed orphaned `symbols.md`

**Issue:** Both `symbols.md` and `symbols.yaml` existed. Per tech_specs.md §3, symbols go in `symbols.yaml` only.

**Resolution:** Deleted `symbols.md` (it even stated symbols.yaml was authoritative).

### 3. Removed empty `out/` directory

**Issue:** Empty directory in gitignore, no purpose.

**Resolution:** Deleted `out/`.

### 4. Removed orphaned `issues.json`

**Issue:** 91KB legacy file from old beads export format. Current beads uses `.beads/issues.jsonl`.

**Resolution:** Deleted `issues.json`.

---

## Actions Still Needed

### High Priority

1. **Add physical units to symbols.yaml** (existing beads issue `microscopic-mobile-anyons-br9`)
   - Many symbols lack units field

2. **Fix Definition 4.1.1 inconsistency** (existing beads issue `microscopic-mobile-anyons-tbd`)
   - Conflict between site indices and physical positions

3. **Add Table of Contents to README.md** (existing beads issue `microscopic-mobile-anyons-jnt`)
   - Link to all docs/ and src/julia/ files

### Medium Priority

4. **Verify LaTeX builds successfully**
   - Run `pdflatex tex/main.tex` to confirm path changes work
   - May need to regenerate paper.pdf

5. **Review `docs/figures/` vs `tex/figures/`**
   - `docs/figures/src/` contains `.tex` figure sources
   - `tex/figures/` is empty (placeholder)
   - Consider consolidating or clarifying purpose

6. **Check for stale Julia code**
   - `src/julia/Manifest.toml` may be outdated
   - Nested Manifest.toml in src/julia/ vs root

### Low Priority

7. **Consider removing `history/` if no longer needed**
   - Only contains one file from Dec 10
   - Per AGENTS.md, this is optional for ephemeral AI planning docs

8. **Add `_overview.md` to `notes/` directory**
   - Per tech_specs.md §8, directories should have overview files

---

## Files Changed

| Action | Path |
|--------|------|
| Deleted | `latex/` (entire directory) |
| Deleted | `symbols.md` |
| Deleted | `out/` |
| Deleted | `issues.json` |
| Created | `tex/main.tex` (from latex/paper.tex) |
| Created | `tex/sections/*.tex` (from latex/*.tex) |
| Moved | `paper.pdf` → `tex/paper.pdf` |
| Modified | `tex/README.md` |

---

## Verification Checklist

- [x] `latex/` removed, content in `tex/`
- [x] `symbols.md` removed (symbols.yaml authoritative)
- [x] `issues.json` removed (beads uses .beads/)
- [x] `out/` removed (empty)
- [x] `tex/main.tex` paths updated
- [ ] LaTeX compiles successfully (manual verification needed)
- [ ] Beads issues reviewed and updated

---

*Generated: 2025-12-20*
