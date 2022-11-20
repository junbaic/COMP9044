#!/bin/dash
cut -d"|" -f2,3|sort -k1|uniq|cut -d"|" -f2|cut -d"," -f2|sed -e "s/^ //"|cut -d" " -f1|sort
