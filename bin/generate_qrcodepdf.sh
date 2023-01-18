#pour générer le pdf du verso avec le qrcode
inkscape svg/qr_code.svg --export-area-page --batch-process -d 600 --export-type=pdf
bash bin/combine_pdf.sh svg/qr_code.pdf svg/qr_code.pdf qr_code.pdf
