#!/bin/dash
grep -E 'COMP(2041|9044)'|cut -d"|" -f3|cut -d"," -f2|sed -e "s/^ //"|cut -d" " -f1|sort|uniq -c|sort|tail -n 1|sed -e "s/^ *//"|cut -d" " -f2
