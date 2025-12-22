# Figures for Documentation

Figure sources have been consolidated in `tex/figures/` (the canonical location for LaTeX project figures).

## Location

- **Sources**: `tex/figures/src/*.tex` - TikZ/LaTeX figure sources
- **Outputs**: `tex/figures/out/` - Compiled PDF and SVG files
- **Build script**: `tex/figures/build.sh`

## Usage

### In Markdown documentation

```markdown
![F-move diagram](../tex/figures/out/f_move.svg)
```

### In LaTeX

```latex
\includegraphics{figures/out/f_move}
```

## Building figures

```bash
./tex/figures/build.sh
```

This generates both PDF (for LaTeX) and SVG (for markdown) outputs.

## Available figures

| Figure | Description |
|--------|-------------|
| `f_move` | F-move (associator) diagram |
| `r_move` | R-move (braiding) diagram |
| `pentagon` | Pentagon equation |
| `hexagon` | Hexagon equation |
