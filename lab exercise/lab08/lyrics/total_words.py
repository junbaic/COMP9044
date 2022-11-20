#! /usr/bin/env python3
import re
import sys

words = 0
for lines in sys.stdin:
    number = re.findall(r'[a-zA-Z]+', lines)
    words += len(number)
print(f'{words} words')

