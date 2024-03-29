#!/bin/bash
# =========================================================
echo "${a}b"
# 显示文本内容以及行数
cat -n
# 显示non-printing characters
cat -A
# squeeze consecutive blank lies into single blank line
cat -S
# =========================================================
# 忽略大小写
grep -i
# 排除/忽略(显示不包含的)
grep -v
# 显示匹配的行数
grep -c
# 完整匹配单词
grep -w
# 匹配非regex
grep -F
# 匹配regex
grep -E
# =========================================================
# 统计字符数(包括换行符)
wc -c
# 统计字数(由空格字符区分开的最大字符串)
wc -w
# 统计行数(实则统计换行符的数量)
wc -l
wc a.txt - words characters a.txt >lines
# =========================================================
tr sourceChars destChars < a.txt
tr 'A-Z' 'a-z' <a.txt # A-Z -> a-z
# 将sourceChars中没出现的字符全部替换掉
tr -c
# 删除所有相邻重复的字符
tr -s
# 删除所有的sourceChars
tr -d
# =========================================================
head -n 3 a.txt
tail -n 3 a.txt
# =========================================================
# 打印第n列
cut -f1  # 打印第一列
cut -f1-3 # 打印1-3列
cut -f1,3 # 打印第一和第三列
cut -f1- # 打印第一列之后的所有
cut -f
# 打印第n个字符   cut -c3
cut -c
# 以xxx为分割   cut -d'-'  以-分割
cut -d
# =========================================================
# 倒序
sort -r
# 数字序
sort -n
# 字典序
sort -d
# 以字符c为分割成几列，默认为space
sort -tc
# 对第n行排序
sort -kn
# =========================================================
# uniq 是删除相邻的重复项,所以需要先sort再uniq
# 去重后打印重复的次数
uniq -c
# 只打印重复的行
uniq -d
# 只打印出现一次的lines
uniq -u
# =========================================================
# =========================================================
# =========================================================
