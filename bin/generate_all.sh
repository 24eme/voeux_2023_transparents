#!/bin/bash
line=1
sed 1d $1 | while IFS=';' read -r nom couleur_feuille couleur_transparent ligne1 ligne2 ligne3 ligne4
do
   line=$(printf "%03d" $line)
   bash bin/generate.sh "$line" "$nom" "$couleur_feuille" "$couleur_transparent" "$ligne1" "$ligne2" "$ligne3" "$ligne4"
   ((line++))
done

