#! /usr/bin/env python3
import re
import sys

all_list = []
for lines in sys.stdin:
    lines = lines.strip()
    all_list.append(lines)
for item in all_list:
    match = re.search(r"^#(\d+)$",item)
    if match:
        number = int(match.group(1))
        item = all_list[number-1]
    print(item)

