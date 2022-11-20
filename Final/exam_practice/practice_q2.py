#! /usr/bin/env python3

import sys
import re

result_list = []
for lines in sys.stdin:
    lines = lines.strip()
    result = re.search(r"\|3711/[0-9]\|[M|F]$",lines)
    if result:
       result_list.append(lines)
print(len(result_list))
