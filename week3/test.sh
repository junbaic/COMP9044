#!/bin/sh

number=$1
string=$2

if test $# != 2
then
    echo "Usage: $0 <number of lines> <string>" >&2
fi

if test "$1" -ge 0
then
    :
else
    echo "Usage: $0 <number of lines> <string>" >&2
fi

a=0
while test $a -lt $1
do
    echo "$2"
    a=$((a+1))
done	
 