#!/bin/bash

for FILE in *
	do
	  lines=$(wc -l <"$FILE")
	if [ $lines -lt 10 ]
	then
	  small="$small $FILE"
	elif [ $lines -lt 100 ]
        then
	  medium="$medium $FILE"
	else
	  large="$large $FILE"
	fi
done

echo "Small files:$small"
echo "Medium-sized files:$medium"
echo "Large files:$large"

exit 0
