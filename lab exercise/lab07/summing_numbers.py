#!/usr/bin/env python3

import sys, re

filename = sys.argv[1:]
count = 0
for file in filename:
    with open(file, 'r') as fp:
        for line in fp:
            number_list = re.findall(r'\d+', line)
            for number in number_list:
                if number:
                    count += int(number)
print(count)
