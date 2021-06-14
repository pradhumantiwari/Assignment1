 #!/bin/bash
fname=Input
if [ -z "$fname" ]
then
    exit
fi

terminal=`tty`

exec < $fname

CYear=$(date '+%Y')
CMonth=$(date '+%m')
CDate=$(date '+%d')

read Name
echo "$Name" >> Output
read DOB
BDate=`echo "$DOB" | cut -c1-2`
BMonth=`echo "$DOB" | cut -c4-5`
BYear=`echo "$DOB" | cut -c7-10`
Age=$(($CYear-$BYear))

if [ "$CMonth" -lt "$BMonth" ]
then
    Age=$(($Age-1))
fi
if [ "$CMonth" -eq "$BMonth" ]
then
    if [ "$CDate" -lt "$BDate" ]
    then
        Age=$(($Age-1))
    fi
fi

echo "$Age" >> Output

exec < $terminal
