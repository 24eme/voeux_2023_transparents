cd res
inkscape dessin_assoc_planche1.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=dessin_assoc_planche1.pdf
inkscape dessin_assoc_planche2.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=dessin_assoc_planche2.pdf
inkscape dessin_assoc_planche3.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=dessin_assoc_planche3.pdf
inkscape dessin_assoc_planche4.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=dessin_assoc_planche4.pdf
pdftk dessin_assoc_planche1.pdf dessin_assoc_planche2.pdf dessin_assoc_planche3.pdf dessin_assoc_planche4.pdf cat output dessin_assoc_planche_transp.pdf
inkscape dessin_assoc_planchegray.svg --export-area-page --batch-process -d 600 --export-type=pdf --export-filename=dessin_assoc_planchegray.pdf
cd ..