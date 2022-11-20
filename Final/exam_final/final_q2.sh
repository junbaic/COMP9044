#! /bin/dash
grep -E "\|M$" | cut -d"|" -f3 | cut -d"," -f1 | sort | uniq | sort

