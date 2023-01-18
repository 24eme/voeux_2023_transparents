#!/bin/bash
mkdir -p res/combine/feuilles res/combine/transparents
i=1
sed 1d $1 | while IFS=';' read -r nom couleur_feuille couleur_transparent ligne1 ligne2 ligne3 ligne4
do
   line=$(printf "%03d" $i)
   bash bin/generate.sh "$line" "$nom" "$couleur_feuille" "$couleur_transparent" "$ligne1" "$ligne2" "$ligne3" "$ligne4"
   if (($i%2==0)); then
     j=$((i - 1))
     previous=$(printf "%03d" $j)
     premiere_feuille=$(find res/ | grep "$previous" | grep "carte_feuille.pdf")
     deuxieme_feuille=$(find res/ | grep "$line" | grep "carte_feuille.pdf")
     premier_transparent=$(find res/ | grep "$previous" | grep "carte_transparent.pdf")
     deuxieme_transparent=$(find res/ | grep "$line" | grep "carte_transparent.pdf")
     bash bin/combine_pdf.sh $premiere_feuille $deuxieme_feuille res/combine/feuilles/$previous\_$line
     bash bin/combine_pdf.sh $premier_transparent $deuxieme_transparent res/combine/transparents/$previous\_$line
   fi
   ((i++))
done
