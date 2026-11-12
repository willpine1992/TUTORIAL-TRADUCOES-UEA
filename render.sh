#!/bin/zsh
# uso: zsh render.sh [tag]  -> gera o PDF a partir do index.html e prévias em prev/
D=${0:A:h}; cd $D
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new --disable-gpu --no-pdf-header-footer --virtual-time-budget=20000 --run-all-compositor-stages-before-draw --print-to-pdf="$D/Tutorial_Traducoes_Site_PROPESP_UEA.pdf" "file://$D/index.html" 2>/dev/null
pdfinfo Tutorial_Traducoes_Site_PROPESP_UEA.pdf | grep -E "Pages|File size"
rm -rf prev; mkdir -p prev; pdftoppm -r ${1:-40} -png Tutorial_Traducoes_Site_PROPESP_UEA.pdf prev/p
