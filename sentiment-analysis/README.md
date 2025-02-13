# Mainstream Media Sentiment Analysis
In this project, we will be gauging mainstream media opinion on immigration in the United States.

## Data
The dataset consists of 75 news articles on the topic of immigration scraped from three news outlet websites with different reoprted biases using Python's BeautifulSoup. Of the 75 articles:
  * 25 are from The Associated Press
  * 25 are from Fox News
  * 25 are from CNN

These files are loaded with each line representing an article.

## Files

| Filename | Description |
| :-----------: | -------- |
| main.py | The main function where sentiment analysis is applied |
| article.py | Helper function to scrape articles and write them to a file  |
| ap_articles.txt | Associated Press articles scraped from their website |
| cnn_articles.txt | CNN articles scraped from their website |
| fox_articles2.txt | Fox News articles scraped from their website |
| SentimentAnalysis_presentation_Callender.pdf | PowerPoint presentation with results and insights |


## Model
We will use spaCy's english sentiment model to classify articles as positive, negative, and neutral.

## Libraries
To run the code locally, you will need Python 3.7+ and the following libraries:
  * BeautifulSoup
  * bs4
  * requests
  * re
  * sys
  * pandas
  * eng_spacysentiment
