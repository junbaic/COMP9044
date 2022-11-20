import subprocess
import sys
# for i in range(1, len(sys.argv)):
#     if i > 1:
#         print(' ', end='')
#     print(sys.argv[i], end='')
# print()

# line_count = 0
#
# for line in sys.stdin:
#     line_count+=1
# print(line_count,"lines")

text = "hello world"
subprocess.run(["tr", "a-z", "A-Z"], input=text, text=True)