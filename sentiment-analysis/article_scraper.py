# Sentiment Analysis web scraper

# This is a simple program that takes a file with links and grabs the
# relevant text contained within the webpage
from bs4 import BeautifulSoup as soup
import requests
import re
import sys

# cnn_urls = []
links_file = sys.argv[1]            # a file with a list of links will be provided as the first arg in the cmd
links = []

with open(links_file) as file:
    for line in file:
        links.append(line.strip())

# for url in cnn_urls:
#     print(url)
articles_file = sys.argv[2]

with open(articles_file, "w") as outfile:
    for link in links:
        # make a html request to get webpage
        page = requests.get(link)
        bsobj = soup(page.content, 'lxml')

        # add the article's title
        # title = bsobj.findAll("h1", {'class':'page-title'})[0].text.strip()
        # outfile.write(title + " ")

        # content of the article
        for news in bsobj.findAll('div',{'class':'article-body'}):
            # the div class changes based on the webpage as follows:
            # cnn: article__content
            # fox: article-body
            # ap: RichTextStoryBody RichTextBody
            article = news.text.strip()
            article = re.sub(r"\s{2,}", " ", article)
            outfile.write(article)
    
        outfile.write("\n")