#! /usr/bin/env python3

from sys import argv
from re import search
from math import log, floor

assert len(argv) == 4, f"Usage: {argv[0]} <min> <max> <regex>"

min, max, regex = argv[1], argv[2], argv[3]

assert len(regex) <= 80, "regex too large";

padding = floor(log(int(max) + 1, 10)) + 1

for i in range(int(min), int(max) + 1):
    unary = '1' * i
    print(f"{i:{padding}} = {unary} unary -", "composite" if search(regex, unary) else "prime")
