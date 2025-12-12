#!/bin/bash
# docs/figures/build.sh
# Compiles all .tex files in src/ to .svg in out/

SRC_DIR="$(dirname "$0")/src"
OUT_DIR="$(dirname "$0")/out"

mkdir -p "$OUT_DIR"

echo "Building figures..."

for texfile in "$SRC_DIR"/*.tex; do
    [ -e "$texfile" ] || continue
    
    filename=$(basename -- "$texfile")
    name="${filename%.*}"
    
    echo "Processing $name..."
    
    # 1. Compile to PDF (output to OUT_DIR directly to keep src clean)
    pdflatex -output-directory="$OUT_DIR" -interaction=nonstopmode "$texfile" > /dev/null
    
    if [ $? -eq 0 ]; then
        # 2. Convert PDF to SVG
        pdftocairo -svg "$OUT_DIR/$name.pdf" "$OUT_DIR/$name.svg"
        echo "  -> Generated $OUT_DIR/$name.svg"
        
        # Cleanup aux files
        rm "$OUT_DIR/$name.aux" "$OUT_DIR/$name.log" "$OUT_DIR/$name.pdf"
    else
        echo "  -> Error compiling $filename. Check $OUT_DIR/$name.log"
    fi
done

echo "Done."
