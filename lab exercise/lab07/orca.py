#!/usr/bin/env python3

import sys

filename = sys.argv[1:]
counts = 0
for file in filename:
    with open(file, 'r') as fp:
        for line in fp:
            line = line.strip().split()
            if line[2] == 'Orca':
                counts += int(line[1])
print(f"{counts} Orcas reported")
