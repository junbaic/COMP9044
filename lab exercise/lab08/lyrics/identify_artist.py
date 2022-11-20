#! /usr/bin/env python3
import glob
import re
import sys
from collections import defaultdict
from math import log

for song_file in sys.argv[1:]:
    with open(song_file, 'r') as song_fp:
        all_words_list = []
        for line in song_fp:
            all_words = re.findall(r'[a-zA-Z]+', line)
            for every_words in all_words:
                all_words_list.append(every_words.lower())
        artist_pro = defaultdict(list)
        new_dic = {}
        for single_word in all_words_list:
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
                filename = []
                for string in file:
                    filename.append(string)
                not_real_filename = ''.join(filename[7:-4])
                real_filename = not_real_filename.replace('_', ' ')
                artist_pro[real_filename].append(round((int(occur_time) + 1) / int(total_words), 9))
                new_dic[real_filename] = 0

        for key, value in artist_pro.items():
            temp_list = []
            for index in range(len(value)):
                temp_list.append(log(value[index]))
            total = sum(temp_list)
            new_dic[key] = round(total, 1)

        sort_dic = sorted(new_dic.items(), key=lambda x: x[1])
        #print(sort_dic)
        print(f'{song_file} most resembles the work of {sort_dic[-1][0]} (log-probability={sort_dic[-1][1]})')
