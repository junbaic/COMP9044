#! /usr/bin/env python3
import sys

vowel_list = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']
list1 = []
for word in sys.argv[1:]:
    for index in range(len(word) - 2):
        if (word[index] in vowel_list) and (word[index + 1] in vowel_list) and (word[index + 2] in vowel_list):
            list1.append(word)
            break

print(' '.join(list1))
