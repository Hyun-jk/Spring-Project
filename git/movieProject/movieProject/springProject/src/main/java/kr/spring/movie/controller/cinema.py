import urllib.request as ur
from bs4 import BeautifulSoup as bs
import sys
import io
sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')

url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EB%B0%95%EC%8A%A4%EC%98%A4%ED%94%BC%EC%8A%A4"

#뷰티풀수프로 자료형 변환하기
soup = bs(ur.urlopen(url).read(),'html.parser')

div = soup.find('div',class_="mflick")
items = div.find_all('div',class_="item")

count = 0
for item in items:
    count += 1
    title = item.find('div',class_="title_box")
    print(item.img['src'], title.strong.string, title.span.string, sep='^')
