#! /usr/bin/env python3
import sys

name_list = []
for line in sys.stdin:
    line = line.split('|')
    if line[4].strip() == 'M':
        name = line[2].strip()
        name = name.split(',')[0].strip()
        if name not in name_list:
            name_list.append(name)

for name in sorted(name_list):
    print(name)
