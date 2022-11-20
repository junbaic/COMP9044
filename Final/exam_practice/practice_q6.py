#! /usr/bin/env python3

import sys
import re

for line in sys.stdin:
    line = line.strip()
    new_line = re.sub(r"([a-zA-Z]+), ([a-zA-Z]+)",r"\2 \1",line)
    print(new_line)