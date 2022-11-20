#!/usr/bin/env python3

import sys

first_number = int(sys.argv[1])
second_number = int(sys.argv[2])
filename = str(sys.argv[3])
new_file = open(f'{filename}', 'w')

for i in range(first_number, second_number + 1):
    print(i, file=new_file)

new_file.close()
