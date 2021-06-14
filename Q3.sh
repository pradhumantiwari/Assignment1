#!/bin/bash


Paragraph="$1"

echo "Words that start with ‘s’ and is not follow by ‘a’"
grep -E -ow '\bs[b-zB-Z]\w*' $Paragraph
grep -E -ow '\bs' $Paragraph
echo "Word starts with ‘w’ and is followed by ‘h’"
list2=`cat $Paragraph | grep -E -ow '\bwh\w*'`
echo "$list2"
echo "Word starts with ‘t’ and is followed by ‘h’"
list3=`cat $Paragraph | grep -E -ow '\bth\w*'`
echo "$list3"
echo "Word starts with ‘a’ and is not followed by ‘n’"
grep -E -ow '\ba[a-mo-zA-MO-Z]\w*' $Paragraph
grep -E -ow '\ba' $Paragraph
