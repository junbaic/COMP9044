#!/bin/dash

# ==============================================================================
# test03.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

./tigger-init 
./tigger-commit -m 'commit 0' 
touch a b c d e f g h i j k
seq 1 5 > a 
seq 7 1 > c 
eq 4 2 > b 
./tigger-add a b h i  
seq 9 10 > a 
seq 10 11 > d 
./tigger-add a b 
./tigger-log 
rm d
rm f  
/tigger-rm h 
/tigger-rm i 
rm g
rm j 
/tigger-commit -m 'commit 2' 

