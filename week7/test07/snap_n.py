#! /usr/bin/env python3
import sys

number = sys.argv[1]
line_count = []
for line in sys.stdin:
    line_count.append(line)
    if line_count.count(line) == int(number):
        print(f"Snap: {line}", end="")
        sys.exit()

