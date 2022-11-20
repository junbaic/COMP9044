#!/usr/bin/env python3

import sys
from collections import defaultdict

filename = sys.argv[1:]

dic1 = defaultdict(list)
for file in filename:
    with open(file, 'r') as fp:
        for line in fp:
            line = line.strip().split()
            date = line[0]
            number = int(line[1])
            whale_name = ' '.join(line[2:]).lower().rstrip('s')
            dic1[whale_name].append(number)
dic1 = sorted(dic1.items(), key=lambda x: x[0])
for index in range(len(dic1)):
    print(f"{dic1[index][0]} observations: {len(dic1[index][1])} pods, {sum(dic1[index][1])} individuals")
