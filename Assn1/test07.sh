#!/bin/dash

# ==============================================================================
# test07.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

echo line1 >a
echo line3 >b
./tigger-add a b 
echo 4 >>a 
echo 5 >>b 
echo 6 >>c 
echo line >d 
./tigger-add c d
./tigger-rm a 
./tigger-rm b 
rm a
./tigger-rm --cached a
./tigger-rm --cached d
./tigger-rm --cached c
./tigger-rm --cached b
