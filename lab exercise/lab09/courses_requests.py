#! /usr/bin/env python3
import sys
import requests
import re
import bs4 as BeautifulSoup

code = sys.argv[1]
link = f"http://www.timetable.unsw.edu.au/2022/{code}KENS.html"
r = requests.get(link, auth=('user', 'pass'))
webpage = r.text
soup = BeautifulSoup.BeautifulSoup(webpage, "html.parser")
result_dict = {}
for link in soup.find_all('a'):
    result = re.sub(r'.*=\"', '', str(link))
    result = re.sub(r'\.html\">', ' ', result)
    result = re.sub(r'</a>', '', result)
    result1 = result.split()
    if len(result1) >= 2:
        if result1[0] != result1[1]:
            if code in result:
                result_dict[result1[0]] = ' '.join(result1[1:])
for key, value in sorted(result_dict.items(), key=lambda x: x[0]):
    print(key, value) 
