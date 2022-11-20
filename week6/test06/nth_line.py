#!/usr/bin/env python3
import sys

number = int(sys.argv[1])
filename = sys.argv[2]

f = open(filename, 'r')
lines = f.readlines()

if number <= len(lines):
    print(lines[number - 1], end='')
else:
    pass

f.close()
