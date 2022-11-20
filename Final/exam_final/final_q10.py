#! /usr/bin/env python3
import sys

for line in sys.stdin:
    words = line.split()
    result = []
    for word in words:
        origin = word
        word = word.strip().lower()
        if word == '':
            continue
        dic = dict()
        for string in word:
            dic[string] = dic.get(string, 0) + 1
        val = None
        valid = True
        for key, value in dic.items():
            if val is None:
                val = value
            if value != val:
                valid = False
        if valid:
            result.append(origin)
    print(' '.join(result))
