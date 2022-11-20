#!/bin/dash

cut -d'|' -f4 | grep -e '3711' | wc -l
