#!/bin/bash

tr -d '\n' < svg/nicolas.svg | sed 's/  */ /g' | sed 's|> *</path>|/>|g' > svg/persona.svg
cat  svg/persona.svg | sed 's|<|\n<|g' | sed 's/<path/\n<path/g' | sed 's|/>|/>\n|g'  | grep '[a-z]' | sort -t ',' -k4,4 -n > tmp/persona1.svg
head -n 5000  tmp/persona1.svg | awk -F ' ' '{if ( $6 * 1 <= 250 ) print $0 }' | sed 's/strke="[^"]*"/stroke="red"/' > tmp/persona1_1.svg
head -n 5000  tmp/persona1.svg | awk -F ' ' '{if ( $6 * 1 > 250 ) print $0 }' | sed 's/strke="[^"]*"/stroke="green"/'> tmp/persona1_2.svg
tail -n +5000 tmp/persona1.svg | awk -F ' ' '{if ( $6 * 1 <= 250 ) print $0 }' | sed 's/strke="[^"]*"/stroke="blue"/'> tmp/persona1_3.svg
tail -n +5000 tmp/persona1.svg | awk -F ' ' '{if ( $6 * 1 > 250 ) print $0 }' | sed 's/strke="[^"]*"/stroke="orange"/'> tmp/persona1_4.svg

cat tmp/persona1_1.svg tmp/persona1_4.svg | grep -n path | sort -n | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > tmp/persona1.svg
cat tmp/persona1_2.svg tmp/persona1_3.svg | grep -n path | sort -n | awk -F ':' '{printf "%05d:%s\n", int(rand()*10000), $2;}' > tmp/persona2.svg

cat svg/decoration.svg | grep path | awk '{print int(rand() * 1000)":"$0}' > tmp/decoration.svg

#echo '<g name="red">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > res/persona1.svg
cat tmp/persona1.svg | grep [0-4][0-4][02468]: | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="red"/' >> res/persona1.svg
cat tmp/decoration.svg | grep [012]:  | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="red"/' >> res/persona1.svg
echo "</svg>" >> res/persona1.svg
#echo '</g>'
#echo '<g name="green">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > res/persona2.svg
cat tmp/persona2.svg | grep [0-4][5-9][02468]: | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="green"/' >> res/persona2.svg
cat tmp/decoration.svg | grep [34]:  | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="green"/' >> res/persona2.svg
echo "</svg>" >> res/persona2.svg
#echo '</g>'
#echo '<g name="blue">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > res/persona3.svg
cat tmp/persona1.svg | grep [5-9][0-4][13579]: | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="blue"/' >> res/persona3.svg
cat tmp/decoration.svg | grep [567]:  | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="blue"/' >> res/persona3.svg
echo "</svg>" >> res/persona3.svg
#echo '</g>'
#echo '<g name="orange">'
echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > res/persona4.svg
cat tmp/persona2.svg | grep [5-9][5-9][13579]: | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="orange"/' >> res/persona4.svg
cat tmp/decoration.svg | grep [89]:  | sed 's/^[0-9]*://' | sed 's/stroke="[^"]*"/stroke="orange"/' >> res/persona4.svg
echo "</svg>" >> res/persona4.svg
#echo '</g>'

echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > res/tmp_persona1.svg
cat tmp/persona1.svg  | sed 's/^[0-9]*://' >> res/tmp_persona1.svg
echo "</svg>" >> res/tmp_persona1.svg

echo '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 506 512" width="506" height="512">' > res/tmp_persona2.svg
cat tmp/persona2.svg  | sed 's/^[0-9]*://' >> res/tmp_persona2.svg
echo "</svg>" >> res/tmp_persona2.svg
