#! /usr/bin/env python3
import sys
import statistics

list_number = []
for number in sys.argv[1:]:
    list_number.append(int(number))

set_number = set(list_number)
mean_index = (len(list_number) // 2) + 1
product = list_number[0]
mean = sum(list_number)/len(list_number)
mode_count = {}
for item in list_number[1:]:
    product = product * item
for item1 in list_number:
    mode_count[item1] = list_number.count(item1)
mode_count = sorted(mode_count.items(), key=lambda x: x[1], reverse=True)
mode = mode_count[0][0]

print(f"count={len(list_number)}")
print(f"unique={len(set_number)}")
print(f"minimum={min(list_number)}")
print(f"maximum={max(list_number)}")
print(f"mean={statistics.mean(list_number)}")
print(f"median={sorted(list_number)[int(mean_index)-1]}")
print(f"mode={mode}")
print(f"sum={sum(list_number)}")
print(f"product={product}")

