#!/bin/bash
calc(){ awk "BEGIN { print $* }"; }

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


while read Inputs
do
    a=`echo "$Inputs" | wc -w`
    b=`echo "$Inputs" | grep -o -i $SearchWord | wc -l`
    echo "$a"
    echo "$b"
    c=`calc $b/$a`
    echo "$Inputs $c" >> Output.txt
done



exec < $terminal




