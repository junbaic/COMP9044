#!/bin/dash

# ==============================================================================
# test09.sh
#
# Written by: Jun Bai
# ==============================================================================

rm -rf .tigger
./tigger-init
# initialized the file
touch a
touch b
./tigger-add a 
./tigger-add b
./tigger-commmit -m "1 commit"
rm b 
./tigger-coomit -m "2 commit"
./tigger-add b
touch c 
./tigger-add c 
./tigger-commit -m "3 commit"
./tigger-rm b 
./tigger-rm a 
./tigger-commit -m "4 commit"
./tigger-rm --force a
./tigger-rm --force c
