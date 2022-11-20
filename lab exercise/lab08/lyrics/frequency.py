#! /usr/bin/env python3
import glob
import re
import sys

like_word = sys.argv[1]
print_dic = {}
for file in glob.glob("lyrics/*.txt"):
    with open(file, 'r') as fp:
        total_words = 0
        Word = like_word.capitalize()
        occur_time = 0
        for lines in fp:
            number = re.findall(r'[a-zA-Z]+', lines)
            total_words += len(number)
            line = re.findall(r'[a-zA-Z]+', lines)
            occur_time += line.count(like_word)
            occur_time += line.count(Word)
        frequency = int(occur_time) / int(total_words)
    filename = []
    for string in file:
        filename.append(string)
    not_real_filename = ''.join(filename[7:-4])
    real_filename = not_real_filename.replace('_', ' ')
    print_dic[real_filename] = f"{occur_time:4}/{total_words:6} = {frequency:.9f}"

sort_dic = sorted(print_dic.items(), key=lambda x: x[0])
for item in sort_dic:
    print(f'{item[1]} {item[0]}')
