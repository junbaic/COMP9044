#! /usr/bin/env python3
import sys, re

dic1 = {}
for lines in sys.stdin:
    number_list = []
    numbers = re.findall(r'-?\d*\.?\d+', lines)
    for number in numbers:
        number_list.append(float(number))
        max_number = max(number_list)
        dic1[lines] = max_number
for key, value in dic1.items():
    if value == max(dic1.values()):
        print(key, end='')

