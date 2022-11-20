#! /usr/bin/env python3
import sys

number = int(sys.argv[1])

line_list = []
count = 0
for line in sys.stdin:
    line = line.strip().replace(' ', '').lower()
    count += 1
    if line not in line_list:
        line_list.append(line)
        if len(line_list) == number:
            print(f"{number} distinct lines seen after {count} lines read.")
            sys.exit()
print(f"End of input reached after {count} lines read - {number} different lines not seen.")

