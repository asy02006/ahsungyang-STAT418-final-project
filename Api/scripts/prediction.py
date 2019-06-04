#!/usr/bin/env python3

import csv
import numpy as np
import pandas as pd

# Naive Bayes Classifier
from textblob import TextBlob
from textblob.classifiers import NaiveBayesClassifier

with open('scripts/news_data.csv') as csvfile:
    
    readCSV = csv.reader(csvfile)
    
    dates = []
    abstracts = []
    headlines = []
    snippets = []
    paragraphs = []
    
    for row in readCSV:
        abstract = row[0]
        date = row[1]
        headline = row[4]
        paragraph = row[8]
        snippet = row[9]
        
        dates.append(date)
        abstracts.append(abstract)
        headlines.append(headline)
        snippets.append(snippet)
        paragraphs.append(paragraph)

news = {'date': dates, 'abstract': abstracts, 'headline': headlines, 'snippet': snippets, 'paragraph': paragraphs}
news_df = pd.DataFrame(news)
news_df = news_df.iloc[1:len(news_df['abstract']),]

# Group the data frame by date and get the aggregate articles per day
#news_df_grouped = news_df.groupby('date')['abstract'].sum()
news_df_grouped = news_df.groupby('date').agg({'abstract':'sum', 'headline':'sum', 'snippet':'sum', 'paragraph':'sum'})
news_df_grouped = pd.DataFrame(news_df_grouped.reset_index())

shareprice_df = pd.read_csv('scripts/share_price_data.csv').iloc[:, [1,2,3,4,5,6,7]]

# Use Adjusted Close Price
close_price = shareprice_df.iloc[:, [0,5]]

# Covert the close price to np.array to get log differences
np_price = np.array(close_price.iloc[:,[1]])
log_diff_price = np.diff(np.log(np_price).reshape(1,len(np_price))).reshape(len(np_price)-1, 1)

# Create the binary response variable
binary_response = ['pos' if i > 0 else 'neg' for i in log_diff_price]

# Create the data frame of share price returns (log differences)
log_diff = close_price.iloc[1:len(np_price),[0]]
log_diff.insert(1, 'log_diff_price', log_diff_price)
log_diff.insert(2, 'binary_response', binary_response)
log_diff.rename(columns={'Date':'date', 'log_diff_price':'log_diff', 'binary_response':'binary_response'}, inplace=True)

news_sp = pd.merge(log_diff, news_df_grouped, on = 'date', how='inner')


df_list = [(news_sp.values[i,3], news_sp.values[i,2]) for i in range(len(news_sp))]
train = df_list[0:700]
test = df_list[701:len(df_list)+1]

cl = NaiveBayesClassifier(train)

def predict(dict_values):
    y_pred = cl.classify(dict_values['text'])
    return y_pred
