#!/bin/dash


number=0

while test -e ".snapshot.$number"
do
  number=$(($number+1))
done

mkdir ".snapshot.$number"

cpfile=.snapshot.$number

for file in *
do
  if test $file != snapshot-save.sh
  then
      if test $file != snapshot-load.sh
         then
             cp $file $cpfile
      fi
   fi
done
  
echo "Creating snapshot $number"
