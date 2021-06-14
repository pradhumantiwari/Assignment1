 #!/bin/bash
fname=$1
if [ -z "$fname" ]
then
    exit
fi

terminal=`tty`

exec < $fname


while read Inputs
do
    Inputs=`echo "$Inputs" | sed 's/./#/5g'`
    echo "$Inputs"
done

exec < $terminal
