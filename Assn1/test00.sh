#!/bin/dash

# ==============================================================================
# test00.sh
#
# Written by: Jun Bai
# ==============================================================================

./tigger-init
# this should print "Initialized empty tigger repository in .tigger"
./tigger-init
# this should print "tigger-int: error: .tigger already exists"
./tigger-init
# this should print "tigger-int: error: .tigger already exists"
ls -d .tigger
# this should print ".tigger"


