#!/bin/dash


if test -e $3
then
    rm -rf $2
fi

number=$1
while test $number -le $2
do
  echo $number >> $3
  number=$((number+1))
done 



  
