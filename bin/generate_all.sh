#!/bin/bash
if ! test "$1"; then
  echo "Donner le fichier csv"
  exit 1
fi

dossier="res/"

#vide le dossie pour bien tout regenerer
rm -r $dossier/*

dossier_print_feuilles="res/impression/feuilles"
dossier_print_transparents="res/impression/transparents"

mkdir -p $dossier_print_feuilles $dossier_print_transparents

suffixe_feuille="carte_feuille.pdf"
suffixe_transparent="carte_transparent.pdf"

i=1
sed 1d $1 | while IFS=';' read -r nom couleur_feuille couleur_transparent ligne1 ligne2 ligne3 ligne4
do
  color_line=$(expr $(expr $i % 8) + 1)
  echo $color_line
  couleur1=$(head -n $color_line couleurs.csv | tail -n 1 | cut -d ';' -f 1)
  couleur2=$(head -n $color_line couleurs.csv | tail -n 1 | cut -d ';' -f 2)
  echo $couleur1
  echo $couleur2

  line=$(printf "%03d" $i)

  bash bin/generate.sh "$line" "$nom" "$couleur1" "$couleur2" "$ligne1" "$ligne2" "$ligne3" "$ligne4"

  if (($i % 2 == 0)); then

    j=$((i - 1))

    previous=$(printf "%03d" $j)
    premiere_feuille=$(find "$dossier" | grep "$previous" | grep "$suffixe_feuille")
    deuxieme_feuille=$(find "$dossier" | grep "$line" | grep "$suffixe_feuille")
    premier_transparent=$(find "$dossier" | grep "$previous" | grep "$suffixe_transparent")
    deuxieme_transparent=$(find "$dossier" | grep "$line" | grep "$suffixe_transparent")

     #verifier que celui d'avant et le sien ont bien été générer sinon ne fait pas la combinaison
     if [  -n "$premiere_feuille" ] && [  -n "$deuxieme_feuille" ] && [  -n "$premier_transparent" ] && [  -n "deuxieme_transparent" ]; then
	bash bin/combine_pdf.sh $premiere_feuille $deuxieme_feuille $dossier_print_feuilles/$previous\_$line.pdf
	bash bin/combine_pdf.sh $premier_transparent $deuxieme_transparent $dossier_print_transparents/$previous\_$line.pdf
     fi
   fi

  ((i++))
done

pdftk $dossier_print_feuilles/*.pdf cat output $dossier_print_feuilles/feuilles.pdf
pdftk $dossier_print_transparents/*.pdf cat output $dossier_print_feuilles/transparents.pdf
