#!/bin/dash

file=$1
first=$(cat $file | sort -n |head -n 1)
last=$(cat $file | sort -n |tail -n 1)
sum=$((first + last))
except=$((sum * (last - first +1)/2))

number=0
while read line
do
  number=$((number+line))
done < $file

result=$((except-number))
if test $result -eq 0
then
    exit 1
else
    echo $result
fi
