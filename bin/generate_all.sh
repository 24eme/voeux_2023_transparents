echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_bleu.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_bleu.svg
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_bleu.svg
tr -d '\n' < svg/mosaic_bleu.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_bleu.svg
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_bleu.svg
tr -d '\n' < svg/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_bleu.svg
echo '</svg>' >> res/carte_bleu.svg
sed -i 's/#000000/#0000ff/g' res/carte_bleu.svg

echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_rouge.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_rouge.svg
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_rouge.svg
tr -d '\n' < svg/mosaic_rouge.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_rouge.svg
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_rouge.svg
tr -d '\n' < svg/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_rouge.svg
echo '</svg>' >> res/carte_rouge.svg
sed -i 's/#000000/#ff0000/g' res/carte_rouge.svg

bash bin/generatepdf.sh