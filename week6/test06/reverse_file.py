#!/usr/bin/env python3
import sys

source_file = sys.argv[1]
reverse_file = sys.argv[2]

file = open(source_file, 'r')
newfile = open(reverse_file, 'w')
lines = file.readlines()[::-1]

for i in range(0, len(lines)):
    print(lines[i], file=newfile,end='')

file.close()
newfile.close()
