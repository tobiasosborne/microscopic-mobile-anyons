# Figures Workflow

This directory contains the source code and build artifacts for diagrams used in the documentation.

## Directory Structure

- `src/`: LaTeX/TikZ source files (`.tex`).
- `out/`: Generated SVG files (`.svg`).
- `build.sh`: Script to compile sources to SVGs.

## How to Add/Update Figures

1.  Add or edit a `.tex` file in `src/`. Use the `standalone` class.
2.  Run the build script from the project root:
    ```bash
    ./docs/figures/build.sh
    ```
3.  Embed the resulting SVG in markdown:
    ```markdown
    ![Description](figures/out/filename.svg)
    ```

## Requirements

- `pdflatex` (TeX Live)
- `pdftocairo` (poppler-utils)
