cd res
inkscape carte_bleu.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=carte_bleu.pdf
inkscape carte_rouge.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=carte_rouge.pdf
pdftk carte_bleu.pdf carte_rouge.pdf cat output cartes.pdf
cd ..