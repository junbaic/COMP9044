#!/bin/dash
cut -d"|" -f2|sort|uniq -c|sed -e "s/^ *//"|sort -k1n|grep -E "^2"|sed -e 's/^2 //'|sort
