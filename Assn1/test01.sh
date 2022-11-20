#!/bin/dash

# ==============================================================================
# test01.sh
#
# Written by: Jun Bai
# ==============================================================================

rm -rf .tigger
./tigger-init
# initialized the file
echo line1 >a
echo line2 >b
# touch two files
./tigger-add a
./tigger-add b
ls .tigger/index
echo line3 >c
echo line4 >d
./tigger-add c d
ls .tigger/index
echo line5 >>f
echo line6 >>g
./tigger-add f g
ls .tigger/index
# add them to .tigger/index


