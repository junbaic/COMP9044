#! /usr/bin/env python3
import sys


if len(sys.argv) == 3:
    number = int(sys.argv[1])
    line_list = []
    with open(sys.argv[2],'r') as file:
        for line in file:
            if len(line) <= number:
                line_list.append(line)
                continue
            words = line.rstrip('\n').split(' ')
            string = ''
            for word in words:
                if string != '':
                    if len(string) + len(word) + 1 >= number:
                        line_list.append(string + '\n')
                        string = word
                    else:
                        string = string + ' ' + word
                else:
                    if len(word) >= number:
                        line_list.append(word + '\n')
                        string = ''
                    else:
                        string = word
            if string != '':
                line_list.append(string + '\n')
file = open(sys.argv[2], 'w', encoding="utf-8")
file.writelines(line_list)
file.close()
