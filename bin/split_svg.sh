#!/bin/bash
persona=$(basename $1 | sed 's/\..*//')

tr -d '\n' < $1 | sed 's/  */ /g' | sed 's|> *</path>|/>|g' | sed 's|<|\n<|g' | sed 's/<path/\n<path/g' | sed 's|/>|/>\n|g'  | grep '[a-z]' > svg"/persona.svg"
cat svg"/persona.svg" | grep path | awk '{print $0}' > "tmp/"$persona".svg"
nb=$(wc -l "tmp/"$persona".svg" | sed 's/ .*/ \/ 2/' | bc)
cat "tmp/"$persona".svg" | awk -F ',' '{if ( $2 * 1 <= 220 ) print $0 }' | awk -F ' ' '{if ( $3 * 1 <= 256 ) print $0 }' | sed 's/strke="[^"]*"/stroke="red"/' | grep -n path | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > "tmp/"$persona"1_1.svg"
cat "tmp/"$persona".svg" | awk -F ',' '{if ( $2 * 1 <= 220 ) print $0 }' | awk -F ' ' '{if ( $3 * 1 > 256 ) print $0 }' | sed 's/strke="[^"]*"/stroke="green"/' | grep -n path | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > "tmp/"$persona"1_2.svg"
cat "tmp/"$persona".svg" | awk -F ',' '{if ( $2 * 1 > 220 ) print $0 }' | awk -F ' ' '{if ( $3 * 1 <= 256 ) print $0 }' | sed 's/strke="[^"]*"/stroke="blue"/' | grep -n path | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > "tmp/"$persona"1_3.svg"
cat "tmp/"$persona".svg" | awk -F ',' '{if ( $2 * 1 > 220 ) print $0 }' | awk -F ' ' '{if ( $3 * 1 > 256 ) print $0 }' | sed 's/strke="[^"]*"/stroke="orange"/' | grep -n path | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > "tmp/"$persona"1_4.svg"

cat "tmp/"$persona"1_1.svg" "tmp/"$persona"1_4.svg" | sed 's/^[0-9]*://' | grep -n path | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > "tmp/"$persona"1.svg"
cat "tmp/"$persona"1_2.svg" "tmp/"$persona"1_3.svg" | sed 's/^[0-9]*://' | grep -n path | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > "tmp/"$persona"2.svg"

cat svg/decoration.svg | grep path | awk '{print int(rand() * 1000)":"$0}' > tmp/decoration.svg

#echo '<g name="red">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > "res/"$persona"1.svg"
cat "tmp/"$persona"1_1.svg" | awk '{if (NR % 5 == 0) print $0}' | sed 's/^[0-9]*://' > "tmp/"$persona"1.path.svg"
cat "tmp/"$persona"1_1.svg" "tmp/"$persona"1_2.svg" "tmp/"$persona"1_3.svg" "tmp/"$persona"1_4.svg" | awk -F ':' '{if (int(rand()*10000) % 100 == 0) print $0;}' | sed 's/^[0-9]*://' >> "tmp/"$persona"1.path.svg"
#cat tmp/decoration.svg | grep [012]:  | sed 's/^[0-9]*://' >> "tmp/"$persona"1.path.svg"
cat "tmp/"$persona"1.path.svg" | awk '{if ( NR % 4 == 2) print $0 }' | sed 's/stroke="[^"]*"/stroke="blue"/' >> "res/"$persona"1.svg"
cat "tmp/"$persona"1.path.svg" | awk '{if ( NR % 4 == 3) print $0 }' | sed 's/stroke="[^"]*"/stroke="maroon"/' >> "res/"$persona"1.svg"
cat "tmp/"$persona"1.path.svg" | awk '{if ( NR % 4 == 0) print $0 }' | sed 's/stroke="[^"]*"/stroke="red"/' >> "res/"$persona"1.svg"
cat "tmp/"$persona"1.path.svg" | awk '{if ( NR % 4 == 1) print $0 }' | sed 's/stroke="[^"]*"/stroke="green"/' >> "res/"$persona"1.svg"
#cat "tmp/"$persona"1.path.svg" | sed 's/stroke="[^"]*"/stroke="red"/' >> "res/"$persona"1.svg"
echo "</svg>" >> "res/"$persona"1.svg"
#echo '</g>'
#echo '<g name="green">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > "res/"$persona"2.svg"
cat "tmp/"$persona"1_2.svg" | awk '{if (NR % 5 == 0) print $0}' | sed 's/^[0-9]*://' > "tmp/"$persona"2.path.svg"
cat "tmp/"$persona"1_1.svg" "tmp/"$persona"1_2.svg" "tmp/"$persona"1_3.svg" "tmp/"$persona"1_4.svg" | awk -F ':' '{if (int(rand()*10000) % 100 == 0) print $0;}' | sed 's/^[0-9]*://' >> "tmp/"$persona"2.path.svg"
#cat tmp/decoration.svg | grep [34]:  | sed 's/^[0-9]*://' >> "tmp/"$persona"2.path.svg"
cat "tmp/"$persona"2.path.svg" | awk '{if ( NR % 4 == 2) print $0 }' | sed 's/stroke="[^"]*"/stroke="blue"/' >> "res/"$persona"2.svg"
cat "tmp/"$persona"2.path.svg" | awk '{if ( NR % 4 == 3) print $0 }' | sed 's/stroke="[^"]*"/stroke="maroon"/' >> "res/"$persona"2.svg"
cat "tmp/"$persona"2.path.svg" | awk '{if ( NR % 4 == 0) print $0 }' | sed 's/stroke="[^"]*"/stroke="red"/' >> "res/"$persona"2.svg"
cat "tmp/"$persona"2.path.svg" | awk '{if ( NR % 4 == 1) print $0 }' | sed 's/stroke="[^"]*"/stroke="green"/' >> "res/"$persona"2.svg"
#cat "tmp/"$persona"2.path.svg" | sed 's/stroke="[^"]*"/stroke="green"/' >> "res/"$persona"2.svg"
echo "</svg>" >> "res/"$persona"2.svg"
#echo '</g>'
#echo '<g name="blue">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > "res/"$persona"3.svg"
cat "tmp/"$persona"1_3.svg" | awk '{if (NR % 5 == 0) print $0}' | sed 's/^[0-9]*://' > "tmp/"$persona"3.path.svg"
cat "tmp/"$persona"1_1.svg" "tmp/"$persona"1_2.svg" "tmp/"$persona"1_3.svg" "tmp/"$persona"1_4.svg" | awk -F ':' '{if (int(rand()*10000) % 100 == 0) print $0;}' | sed 's/^[0-9]*://' >> "tmp/"$persona"3.path.svg"
#cat tmp/decoration.svg | grep [567]:  | sed 's/^[0-9]*://' >> "tmp/"$persona"3.path.svg"
cat "tmp/"$persona"3.path.svg" | awk '{if ( NR % 4 == 2) print $0 }' | sed 's/stroke="[^"]*"/stroke="blue"/' >> "res/"$persona"3.svg"
cat "tmp/"$persona"3.path.svg" | awk '{if ( NR % 4 == 3) print $0 }' | sed 's/stroke="[^"]*"/stroke="maroon"/' >> "res/"$persona"3.svg"
cat "tmp/"$persona"3.path.svg" | awk '{if ( NR % 4 == 0) print $0 }' | sed 's/stroke="[^"]*"/stroke="red"/' >> "res/"$persona"3.svg"
cat "tmp/"$persona"3.path.svg" | awk '{if ( NR % 4 == 1) print $0 }' | sed 's/stroke="[^"]*"/stroke="green"/' >> "res/"$persona"3.svg"
#cat "tmp/"$persona"3.path.svg" | sed 's/stroke="[^"]*"/stroke="blue"/' >> "res/"$persona"3.svg"
echo "</svg>" >> "res/"$persona"3.svg"
#echo '</g>'
#echo '<g name="orange">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > "res/"$persona"4.svg"
cat "tmp/"$persona"1_4.svg" | awk '{if (NR % 5 == 0) print $0}' | sed 's/^[0-9]*://' > "tmp/"$persona"4.path.svg"
cat "tmp/"$persona"1_1.svg" "tmp/"$persona"1_2.svg" "tmp/"$persona"1_3.svg" "tmp/"$persona"1_4.svg" | awk -F ':' '{if (int(rand()*10000) % 100 == 0) print $0;}' | sed 's/^[0-9]*://' >> "tmp/"$persona"4.path.svg"
#cat tmp/decoration.svg | grep [89]:  | sed 's/^[0-9]*://' >> "tmp/"$persona"4.path.svg"
cat "tmp/"$persona"4.path.svg" | awk '{if ( NR % 4 == 2) print $0 }' | sed 's/stroke="[^"]*"/stroke="blue"/' >> "res/"$persona"4.svg"
cat "tmp/"$persona"4.path.svg" | awk '{if ( NR % 4 == 3) print $0 }' | sed 's/stroke="[^"]*"/stroke="maroon"/' >> "res/"$persona"4.svg"
cat "tmp/"$persona"4.path.svg" | awk '{if ( NR % 4 == 0) print $0 }' | sed 's/stroke="[^"]*"/stroke="red"/' >> "res/"$persona"4.svg"
cat "tmp/"$persona"4.path.svg" | awk '{if ( NR % 4 == 1) print $0 }' | sed 's/stroke="[^"]*"/stroke="green"/' >> "res/"$persona"4.svg"
#cat "tmp/"$persona"4.path.svg" | sed 's/stroke="[^"]*"/stroke="maroon"/' >> "res/"$persona"4.svg"
echo "</svg>" >> "res/"$persona"4.svg"
#echo '</g>'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > "res/"$persona"0.svg"
cat "tmp/"$persona"1_1.svg" | awk '{if (NR % 5 == 1) print $0}' | sed 's/^[0-9]*://' > "tmp/"$persona"0.path.svg"
cat "tmp/"$persona"1_2.svg" | awk '{if (NR % 5 == 1) print $0}' | sed 's/^[0-9]*://' >> "tmp/"$persona"0.path.svg"
cat "tmp/"$persona"1_3.svg" | awk '{if (NR % 5 == 1) print $0}' | sed 's/^[0-9]*://' >> "tmp/"$persona"0.path.svg"
cat "tmp/"$persona"1_4.svg" | awk '{if (NR % 5 == 1) print $0}' | sed 's/^[0-9]*://' >> "tmp/"$persona"0.path.svg"
cat "tmp/"$persona"0.path.svg" | awk '{if ( int(rand()*100) % 5 == 0) print $0 }'| sed 's/stroke="[^"]*"/stroke="#999"/' >> "res/"$persona"0.svg"
echo "</svg>" >> "res/"$persona"0.svg"


head -n 1 "res/"$persona"1.svg" > "res/"$persona".red".svg
grep -vh green "res/"$persona""[1234]".svg" | grep -v blue | grep -v maroon | grep -v svg   >> "res/"$persona".red".svg
echo "</svg>"  >> "res/"$persona".red".svg
head -n 1 "res/"$persona"1.svg" > "res/"$persona".green".svg
grep -vh red "res/"$persona""[1234]".svg" | grep -v blue | grep -v maroon | grep -v svg   >> "res/"$persona".green".svg
echo "</svg>"  >> "res/"$persona".green".svg
head -n 1 "res/"$persona"1.svg" > "res/"$persona".blue".svg
grep -vh green "res/"$persona""[1234]".svg" | grep -v red | grep -v maroon | grep -v svg   >> "res/"$persona".blue".svg
echo "</svg>"  >> "res/"$persona".blue".svg
head -n 1 "res/"$persona"1.svg" > "res/"$persona".maroon".svg
grep -vh green "res/"$persona""[1234]".svg" | grep -v blue | grep -v red | grep -v svg   >> "res/"$persona".maroon".svg
echo "</svg>"  >> "res/"$persona".maroon".svg

head -n 1 "res/"$persona"1.svg" > "res/"$persona".global".svg
cat "res/"$persona""[01234]".svg"   >> "res/"$persona".global".svg
echo "</svg>"  >> "res/"$persona".global".svg

head -n 1 "res/"$persona"1.svg" > "res/"$persona.svg
cat  "tmp/"$persona".svg" >> "res/"$persona.svg
echo "</svg>"  >> "res/"$persona.svg


rm -f res/persona.svg  res/persona0.svg res/persona1.svg res/persona2.svg res/persona3.svg res/persona4.svg res/persona.red.svg res/persona.green.svg res/persona.blue.svg res/persona.maroon.svg res/persona.global.svg
ln -s $persona".svg" res/persona.svg
ln -s $persona"0.svg" res/persona0.svg
ln -s $persona"1.svg" res/persona1.svg
ln -s $persona"2.svg" res/persona2.svg
ln -s $persona"3.svg" res/persona3.svg
ln -s $persona"4.svg" res/persona4.svg
ln -s $persona".red".svg res/persona.red.svg
ln -s $persona".green".svg res/persona.green.svg
ln -s $persona".blue".svg res/persona.blue.svg
ln -s $persona".maroon".svg res/persona.maroon.svg
ln -s $persona".global".svg res/persona.global.svg