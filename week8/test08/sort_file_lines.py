#! /usr/bin/env python3
import sys

filename = sys.argv[1]
order_list = []
dict1 = {}
with open(filename, 'r') as fp:
    for line in fp:
        dict1[line] = len(line)
for key, value in sorted(dict1.items(), key=lambda x: (x[1],x[0])):
    print(key, end='')
