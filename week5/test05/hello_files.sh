#!/bin/dash


number=1

while test $number -le $1
do
  touch hello$number.txt
  echo "hello $2" > hello$number.txt
  number=$((number+1))
done
