#! /usr/bin/env python3
import subprocess
import sys

course_code = sys.argv[1]
subprocess.run(
    f"""curl --location --silent http://www.timetable.unsw.edu.au/2022/{course_code}KENS.html | grep -E "{course_code}
    [0-9]+.html\\">" | grep -E -v ">{course_code}[0-9]+" | sed -e "s/.*=\\"//g" | sed -e "s/\\.html\\">/ /g" | 
    sed -e "s/<\\/a><\\/td>//g" | sort | uniq  """, shell=True)
