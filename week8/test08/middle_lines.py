#! /usr/bin/env python3
import sys

filename = sys.argv[1]
with open(filename, 'r') as fp:
    line_list = fp.readlines()
    number = int(len(line_list))
    if number > 0:
        if number % 2 == 1:
            print(line_list[int((number - 1) / 2)], end='')
        if number % 2 == 0:
            print(line_list[int((number / 2) - 1)], end='')
            print(line_list[int(number / 2)], end='')
