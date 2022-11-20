#! /usr/bin/env python3
import re
import sys

word = sys.argv[1]
Word = word.capitalize()
occur_time = 0

for lines in sys.stdin:
    # words_list = re.findall(rf'{word}', lines)
    # occur_time += len(words_list)
    # Words_list = re.findall(rf'{Word}', lines)
    # occur_time += len(Words_list)
    line = re.findall(r'[a-zA-Z]+', lines)
    occur_time += line.count(word)
    if Word != word:
        occur_time += line.count(Word)
    if word.upper() != Word:
        occur_time += line.count(word.upper())
print(f'{word} occurred {occur_time} times')
