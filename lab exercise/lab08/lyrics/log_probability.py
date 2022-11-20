#! /usr/bin/env python3
import glob
import re
import sys
from collections import defaultdict
from math import log

# artist_pro{key=artist,value=[frequency1,frequency2...]}
artist_pro = defaultdict(list)
for single_word in sys.argv[1:]:
    for file in glob.glob("lyrics/*.txt"):
        with open(file, 'r') as fp:
            total_words = 0
            Word = single_word.capitalize()
            occur_time = 0
            for lines in fp:
                number = re.findall(r'[a-zA-Z]+', lines)
                total_words += len(number)
                line = re.findall(r'[a-zA-Z]+', lines)
                occur_time += line.count(single_word)
                if Word != single_word:
                    occur_time += line.count(Word)
                if single_word.upper() != Word:
                    occur_time += line.count(single_word.upper())
                
            # frequency = (int(occur_time) + 1) / int(total_words)
        filename = []
        for string in file:
            filename.append(string)
        not_real_filename = ''.join(filename[7:-4])
        real_filename = not_real_filename.replace('_', ' ')
        artist_pro[real_filename].append((int(occur_time) + 1) / int(total_words))
        # artist_pro[real_filename].append(frequency)

for key, value in artist_pro.items():
    temp_list = []
    for index in range(len(value)):
        temp_list.append(log(value[index]))
    total = sum(temp_list)
    artist_pro[key].append(total)

sort_dic = sorted(artist_pro.items(), key=lambda x: x[0])
for item in sort_dic:
    print(f'{item[1][-1]:10.5f} {item[0]}')


