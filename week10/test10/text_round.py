#! /usr/bin/env python3
import sys
import re


def sub(index, line):
    result = re.sub(number1[index], number2[index], line)
    if index == 0:
        print(result)
        return
    index = index - 1
    return sub(index, result)


all_list = []
for lines in sys.stdin:
    lines = lines.strip()
    number1 = re.findall(r"\d+\.?\d*", lines)
    number2 = []
    for index in range(len(number1)):
        number2.append(str(round(float(number1[index]))))
    if len(number1) >=1:
        sub(len(number1) - 1, lines)
    else:
        print(lines)
