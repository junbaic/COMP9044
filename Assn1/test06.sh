#!/bin/dash

# ==============================================================================
# test06.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

echo 1 >a
echo 4 >b
echo 8 >c
./tigger-add a b c
echo 4 >>a 
echo 5 >>b 
echo 6 >>c 
echo line >d 
./tigger-add c d
./tigger-rm a 
./tigger-rm b 
./tigger-rm c
./tigger-rm d 
./tigger-rm e
