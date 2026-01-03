# CLAUDE.md — Instructions for Claude Code

This file is read automatically by Claude Code. See AGENTS.md for full documentation.

---

## Critical Constraints

### 1. First Quantisation Only

**DO NOT use creation/annihilation operators.** We work exclusively in first quantisation. Creation/annihilation operators are a red herring and will lead to incorrect formulations.

- Fock space is a direct sum of n-particle spaces
- Operators act on these spaces directly
- No second quantisation formalism
- **NEVER** write sections about creation/annihilation operators or second quantisation

### 2. Normalisation Care

Extra care must be taken with normalisations of diagrams and morphisms. Always state normalisation conventions explicitly.

### 3. Multiplicity Handling

All definitions must work for both multiplicity-free ($N_{ab}^c \in \{0, 1\}$) and general case ($N_{ab}^c \geq 0$).

### 4. Basis Independence

Work basis-independent where possible.

---

## TikZ Diagrams (MANDATORY)

**ALWAYS use project macros from `tex/tikz_styles.tex`** for all diagrams. Writing inline TikZ from scratch is **FORBIDDEN**.

### Why This Matters
- Ensures visual consistency across the paper
- Prevents duplicated effort
- Makes diagrams maintainable
- Follows project conventions

### Available Macros

**Fusion trees:**
- `\fuselefttree{a}{b}{e}{c}{d}` — Left-associated tree $((a \otimes b)_e \otimes c) \to d$
- `\fuserighttree{a}{b}{e}{c}{d}` — Right-associated tree
- `\trivalentvertex{a}{b}{c}` — Single trivalent vertex

**F-moves:**
- `\Fmoveequation{a}{b}{c}{d}{e}{f}` — Full F-move equation
- `\Ftreeleft{a}{b}{c}{d}{e}{mu}{nu}` — Left tree with multiplicities
- `\Ftreeright{a}{b}{c}{d}{f}{mu}{nu}` — Right tree with multiplicities

**Braiding:**
- `\braidingover{X}{Y}`, `\braidingunder{X}{Y}` — Labeled crossings
- `\braidcompact`, `\braidcompactinv` — Compact for Hamiltonians
- `\Htwobraid`, `\Htwobraidinv` — 2-local braid terms

**2-local Hamiltonians:**
- `\Htwoidentity`, `\Htwoswap`, `\Htwocupcap`, `\HtwoH`
- `\Htwofusion{e}` — Fusion-splitting with channel label
- `\Htwohopright`, `\Htwohopleft` — Hopping terms

**Trivalent categories:**
- `\trivloop`, `\trivbigon`, `\trivtriangle`, `\trivsquare`
- `\Cfourone` through `\Cfourfour` — C_4 basis diagrams

### Reference
See `tex/tikz_test.tex` for complete examples of all macros.

---

## Notation

- Use $\mathrm{Mor}(A, B)$ for morphisms (not $\mathrm{Hom}$)
- $\mathbb{N} = \{1, 2, 3, \ldots\}$ (excludes zero)
- $\mathbb{Z}_{\ge 0} = \{0, 1, 2, \ldots\}$ (includes zero)

---

## Issue Tracking (Beads)

Use `bd` CLI for all task tracking. Key commands:
```bash
bd ready              # Find unblocked work
bd create "Title" --type=task --priority=2
bd update <id> --status=in_progress
bd close <id>
bd sync               # Sync with git
```

---

## Session Close Protocol

Before ending a session, you MUST:
1. `git status` — check changes
2. `git add <files>` — stage changes
3. `bd sync` — sync beads
4. `git commit -m "..."` — commit
5. `bd sync` — sync any new beads changes
6. `git push` — push to remote

**Work is NOT complete until pushed.**

---

## Common Pitfalls

1. Using creation/annihilation operators (FORBIDDEN)
2. Writing second quantisation content (FORBIDDEN)
3. Inline TikZ instead of project macros
4. Assuming multiplicity-free without stating it
5. Inconsistent diagram normalisations
6. Results without Claim/Conjecture/Theorem labels

---

See AGENTS.md for complete documentation.
