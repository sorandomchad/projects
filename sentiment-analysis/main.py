# Chad Callender
# CMPS 5443
# Program 1 - Sentiment Analysis

# This program takes a set of 25 articles scraped from a news
# website and returns the label positive, negative, or neutral
# for each article using spaCy's sentiment analysis module

# Positive and negative words
# ;   Minqing Hu and Bing Liu. "Mining and Summarizing Customer Reviews." 
# ;       Proceedings of the ACM SIGKDD International Conference on Knowledge 
# ;       Discovery and Data Mining (KDD-2004), Aug 22-25, 2004, Seattle, 
# ;       Washington, USA, 
# ;   Bing Liu, Minqing Hu and Junsheng Cheng. "Opinion Observer: Analyzing 
# ;       and Comparing Opinions on the Web." Proceedings of the 14th 
# ;       International World Wide Web conference (WWW-2005), May 10-14, 
# ;       2005, Chiba, Japan.

import eng_spacysentiment           # spaCy's sentiment analysis module
import pandas as pd

nlp = eng_spacysentiment.load()     # loading english model

# loading articles into a list for parsing
articles = []
with open ("ap_articles.txt") as file:
    for line in file:
        articles.append(line.strip())
        
# articles[1]
# Counts for how many articles were labeled positive, negative, and neutral
pos_count = 0
neg_count = 0
neu_count = 0

# running spaCy's sentiment analysis on each article in the corpus  
for article in articles:
    doc = nlp(article)

    # sorts each sentiment calculation to show the class (pos, neg, neu) with the highest class
    sorted_sentiment = dict(sorted(doc.cats.items(), key=lambda item: item[1], reverse=True))

    if list(sorted_sentiment.keys())[0] == 'positive':
        pos_count += 1
    elif list(sorted_sentiment.keys())[0] == 'negative':
        neg_count += 1
    else:
        neu_count += 1

    print(sorted_sentiment)

print("positives:", pos_count)
print("negatives:", neg_count)
print("neutrals:", neu_count)

###############################################################################################
# Here, I tried to do a sentiment analysis by comparing it with a word list

# loading postitve and negative words into lists
# will be used to determine if a word in an article is positive or negative
positive_words = []
with open ("positive_words.txt", encoding = "ISO-8859-1") as file:
    for line in file:
        positive_words.append(line.strip())

negative_words = []
with open ("negative_words.txt", encoding = "ISO-8859-1") as file:
    for line in file:
        negative_words.append(line.strip())


# creating a dataframe for all positive words in the corpus
positive_df = pd.DataFrame(columns=['Word', 'Count', 'Article', 'Class'])
for article in articles:
    count = 0
    article_no = articles.index(article)
    article = article.split()               # splitting the article into tokens (words)
    
    for token in article:
        token = token.lower()
        # only add to df if the word is classified as positive
        if token in positive_words:
            count += 1
            if not ((positive_df['Word'] == token) & (positive_df['Article'] == article_no)).any():
                # add word to df if not already there for the particular article,
                # initialize with a count of 1,
                # and note which article it came from
                positive_df.loc[len(positive_df.index)] = [token, 1, article_no, 'pos']
            else:
                # if token exists for the current article then simply increment count
                positive_df.loc[(positive_df['Word'] == token) & (positive_df['Article'] == article_no), ['Count']] += 1

    print(count)


# do the same as above for the negative words
negative_df = pd.DataFrame(columns=['Word', 'Count', 'Article', 'Class'])
for article in articles:
    count = 0
    article_no = articles.index(article)
    article = article.split()
    
    for token in article:
        token = token.lower()
        if token in negative_words:
            count += 1
            if not ((negative_df['Word'] == token) & (negative_df['Article'] == article_no)).any():
                negative_df.loc[len(negative_df.index)] = [token, 1, article_no, 'neg']
            else:
                negative_df.loc[(negative_df['Word'] == token) & (negative_df['Article'] == article_no), ['Count']] += 1

    print(count)


# concatentate the two dataframes
df = pd.concat([positive_df, negative_df], ignore_index=True)
print(df)
