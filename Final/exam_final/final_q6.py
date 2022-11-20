#!/usr/bin/env python3
import sys


def main():
    if len(sys.argv) != 3:
        return
    with open(sys.argv[1], 'r') as fp1:
        lines1 = fp1.readlines()
    with open(sys.argv[2], 'r') as fp2:
        lines2 = fp2.readlines()
    if len(lines1) != len(lines2):
        print(
            f'Not mirrored: different number of lines: {len(lines1)} versus {len(lines2)}')
        return
    for i in range(len(lines1)):
        if lines1[i] != lines2[len(lines1) - 1 - i]:
            print(f'Not mirrored: line {i+1} different')
            return
    print('Mirrored')


main()
