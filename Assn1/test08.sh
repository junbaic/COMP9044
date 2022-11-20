#!/bin/dash

# ==============================================================================
# test08.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

echo "aa" >a
echo "ba" >b
echo "ca" >c
./tigger-add a b 
echo 4 >>a 
echo 5 >>b 
echo 6 >>c 
echo line >d 
./tigger-add c d
./tigger-rm a 
./tigger-rm b 
echo 89 >b
./tigger-rm --cached a
./tigger-rm --cached d
./tigger-rm --cached c
./tigger-rm --cached b
./tigger-add b 
./tigger-rm --force a
./tigger-rm --force d
./tigger-rm --force c
./tigger-rm --force b