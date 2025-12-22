#!/bin/bash
# tex/figures/build.sh
# Compiles all .tex files in src/ to PDF and SVG outputs
#
# Outputs:
#   - tex/figures/out/*.pdf  - For LaTeX \includegraphics
#   - tex/figures/out/*.svg  - For markdown embedding
#
# Usage: ./tex/figures/build.sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/src"
OUT_DIR="$SCRIPT_DIR/out"

mkdir -p "$OUT_DIR"

echo "Building figures from $SRC_DIR..."

for texfile in "$SRC_DIR"/*.tex; do
    [ -e "$texfile" ] || continue

    filename=$(basename -- "$texfile")
    name="${filename%.*}"

    echo "Processing $name..."

    # 1. Compile to PDF
    pdflatex -output-directory="$OUT_DIR" -interaction=nonstopmode "$texfile" > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "  -> Generated $OUT_DIR/$name.pdf"

        # 2. Convert PDF to SVG (for markdown docs)
        if command -v pdftocairo &> /dev/null; then
            pdftocairo -svg "$OUT_DIR/$name.pdf" "$OUT_DIR/$name.svg"
            echo "  -> Generated $OUT_DIR/$name.svg"
        else
            echo "  -> Warning: pdftocairo not found, skipping SVG generation"
        fi

        # Cleanup aux files (keep PDF and SVG)
        rm -f "$OUT_DIR/$name.aux" "$OUT_DIR/$name.log"
    else
        echo "  -> Error compiling $filename"
        cat "$OUT_DIR/$name.log" 2>/dev/null | tail -20
    fi
done

echo ""
echo "Done. Outputs in $OUT_DIR/"
echo "  - PDF files: use \\includegraphics{figures/out/$name} in LaTeX"
echo "  - SVG files: use ![desc](tex/figures/out/$name.svg) in markdown"
