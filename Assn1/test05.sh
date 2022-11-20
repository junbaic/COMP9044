#!/bin/dash

# ==============================================================================
# test05.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

./tigger-commit -a -m "0 commit: 3" 
./tigger-add  
echo "whatsup" > a 
seq 1 18 > b 
./tigger-add a b 
./tigger-commit -m "1 commit: 2"  
echo abcd> d 
./tigger-add d 
./tigger-commit -a -m "2 commit: 1" 
./tigger-log 
./tigger-rm a 
seq 1 7> c 
./tigger-add c 
./tigger-commit -m "3 commit: 0" 
./tigger-log 