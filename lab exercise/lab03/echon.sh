#!/bin/bash

if test $# -le 0
then
    echo "Usage: ./echon.sh <number of lines> <string>" 1>&2
    exit 1
elif test $# -gt 2
then 
    echo "Usage: ./echon.sh <number of lines> <string>" 1>&2
    exit 1
fi

number=$1
string=$2

if test $(echo $number | bc) != $number
then 
    echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
    exit 1

fi 

if test $number -lt 0 
then 
    echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
    exit 1
fi

lines=0
while [ $lines -lt $number ] 
do
    echo $string
    lines=$(($lines + 1))
done
exit 0
