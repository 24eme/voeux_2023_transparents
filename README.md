Télécharger les polices du dossier polices/ sur votre ordinateur

Pour générer pour tous:

   bash bin/generate_all.sh voeux.csv

Les pdfs à imprimer se trouvent dans le dossier res/impression

Pour générer pour une personne : 

  bash bin/generate.sh numero_ligne nom bleu1 orange ligne1 ligne2 ligne3 ligne 4

bleu1 pour la couleur de la feuille de papier, orange pour le transparent

On peut utiliser toute couleur reconnues par SVG (#RRGGBB, gray, ....) mais également 4 couleurs prédéfinies par Nicolas

Les SVG des deux couleurs se trouvent alors dans res/

Les fichiers 'cartes_superposees' permette d'avoir une évaluation du résultat.

Les originaux sont dans svg/

Pour combiner les pdfs :

Installer psutils
