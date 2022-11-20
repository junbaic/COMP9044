#!/bin/dash

number=0
if test -e "$1"
then
  new_file=.$1.$number
fi

while test -e ".$1.$number"
do
    number=$((number+1))
    new_file=.$1.$number
done

cp "$1" "$new_file"
echo "Backup of '$1' saved as '$new_file'"

