#! /usr/bin/env python3

import sys

# ord(str)
# chr(int)
number = int(sys.argv[1])
number = number % 26
for lines in sys.stdin:
    lines = lines.strip()
    new_lines = ''
    for string in lines:
        int_string = int(ord(string))
        if 65 <= int_string <= 90:
            int_new_string = int_string + number
            if int_new_string >= 91:
                new_string = chr(int_new_string - 90 + 64)
            elif int_new_string <= 64:
                new_string = chr(int_new_string + 90 - 64)
            else:
                new_string = chr(int_new_string)
            new_lines += new_string
        elif 97 <= int_string <= 122:
            int_new_string = int_string + number
            if int_new_string >= 123:
                new_string = chr(int_new_string - 122 + 96)
            elif int_new_string <= 96:
                new_string = chr(int_new_string + 122 - 96)
            else:
                new_string = chr(int_new_string)
            new_lines += new_string
        else:
            new_lines += string
    print(new_lines)

