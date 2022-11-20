#!/bin/dash

# ==============================================================================
# test04.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

 seq 1 7 > a 
 ./tigger-commit -a -m "commit 0" 
 ./tigger-branch 111 
 ./tigger-branch branch1 
 ./tigger-checkout branch1 
 seq 8 37 > b 
 echo "hello girl" >> a 
 ./tigger-add a b 
 ./tigger-commit -m "commit 1" 
 ./tigger-checkout branch1 
 echo csafsf > c 
 echo COMP9044 > d 
 ./tigger-add c d 
 ./tigger-rm d 
 ./tigger-commit -a "commit 2" 
 ./tigger-log 
 ./tigger-show 0:a 
 ./tigger-show 0:b 
 ./tigger-show 0:d 
 ./tigger-log  