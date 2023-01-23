curl -s $1 | grep ";" | grep -v "^;" | awk -F ';' '{
if(length($1) == 0) { print "Il manque le prénom (Lignes complètes : " $0 ")" }
else if(length($2) > 0) { print "Il manque une colonne (Lignes complètes : " $0 ")" }
else if(length($3) > 0) { print "Il manque une colonne (Lignes complètes : " $0 ")" }
else if(length($4) > 32) { print "Ligne n°1 trop longue " length($4) " : " $4 " (Lignes complètes : " $0 ")" }
else if(length($5) > 32) { print "Ligne n°2 trop longue " length($5) " : " $5 " (Lignes complètes : " $0 ")" }
else if(length($6) > 32) { print "Ligne n°3 trop longue " length($6) " : " $6 " (Lignes complètes : " $0 ")" }
else if(length($7) > 32) { print "Ligne n°4 trop longue " length($7) " : " $7 " (Lignes complètes : " $0 ")" }
else if(length($8) > 0) { print "Trop de lignes (Lignes complètes : " $0 ")" }
else if(length($9) > 0) { print "Trop de lignes (Lignes complètes : " $0 ")" }
}'
