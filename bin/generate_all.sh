#!/bin/bash
if ! test "$1"; then
    echo "Donner le fichier csv";
    exit 1;
fi

dossier="res/"
dossier_print_feuilles="res/impression/feuilles"
dossier_print_transparents="res/impression/transparents"

mkdir -p $dossier_print_feuilles $dossier_print_transparents

suffixe_feuille="carte_feuille.pdf"
suffixe_transparent="carte_transparent.pdf"

i=1
sed 1d $1 | while IFS=';' read -r nom couleur_feuille couleur_transparent ligne1 ligne2 ligne3 ligne4
do
   line=$(printf "%03d" $i)
   bash bin/generate.sh "$line" "$nom" "$couleur_feuille" "$couleur_transparent" "$ligne1" "$ligne2" "$ligne3" "$ligne4"

   if (($i%2==0)); then

     j=$((i - 1))

     previous=$(printf "%03d" $j)
     premiere_feuille=$(find "$dossier" | grep "$previous" | grep "$suffixe_feuille")
     deuxieme_feuille=$(find "$dossier" | grep "$line" | grep "$suffixe_feuille")
     premier_transparent=$(find "$dossier" | grep "$previous" | grep "$suffixe_transparent")
     deuxieme_transparent=$(find "$dossier" | grep "$line" | grep "$suffixe_transparent")

     #verifier que celui d'avant et le sien ont bien été générer sinon ne fait pas la combinaison
     if [  -n "$premiere_feuille" ] && [  -n "$deuxieme_feuille" ] && [  -n "$premier_transparent" ] && [  -n "deuxieme_transparent" ]; then
	bash bin/combine_pdf.sh $premiere_feuille $deuxieme_feuille $dossier_print_feuilles/$previous\_$line
	bash bin/combine_pdf.sh $premier_transparent $deuxieme_transparent $dossier_print_transparents/$previous\_$line
     fi
   fi

   ((i++))
done
