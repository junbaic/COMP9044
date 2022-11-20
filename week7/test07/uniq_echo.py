#! /usr/bin/env python3

import sys

a = []
for str1 in sys.argv[1:]:
    if str1 not in a:
        a.append(str1)
print(' '.join(a))
