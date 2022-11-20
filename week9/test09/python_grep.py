#! /usr/bin/env python3
import sys, re

regex = sys.argv[1]
filename = sys.argv[2]

with open(filename, 'r') as fp:
    for line in fp:
        line = line.strip()
        match = re.search(f'{regex}', line)
        if match:
            print(line)