#!/bin/bash


IFS=$'\n' array=($(cat stopwords.txt))
for i in $(seq ${#array[*]}); do
    [[ ${array[$i-1]} = $name ]] && echo "${array[$i]}"
done

for i in "${array[@]}"
do
    sed -i -e "s/\<$i\>\s*//g" a.txt 
done

read SearchWord

terminal=`tty`


exec < a.txt

count=0

while read Inputs
do
    grep -o -i $SearchWord  "$Inputs"
done



exec < $terminal


