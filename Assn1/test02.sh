#!/bin/dash

# ==============================================================================
# test02.sh
#
# Written by: Jun Bai
# ==============================================================================
rm -rf .tigger
./tigger-init
# initialized the file

echo line1 >a
./tigger-add a
./tigger-commit -m commit 0
echo line2 >>a
./tigger-commit -a -m commit-1
touch b
./tigger-add b
./tigger-commit -a -m commit-2
