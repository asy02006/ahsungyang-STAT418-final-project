# Code Files for the Project

The directory contains files for codes used for running the analysis. 

## 1. Article Data Download 
- *Please use the personal API-Key to run the script*
- It's a Jupyter Notebook used for downloading New York Times articles on Apple Inc. issued from January 1, 2014 to April 30, 2019 from the New York Times Article Search API
- The articles are filtered by using the query ("Apple") as well as the organization field ("Apple Inc")
- **parse_articles(articles):** A function to extract necessary information from the downloaded article and combine each article as a list
- **get_articles(begindate, enddate, query, org, apikey):** A function to send a request to download articles from the API
    - beingdate / enddate: a string of start and end dates in the format of "yyyymmdd"
    - query: a string of keyword to search
    - org: a string of an organization name to be searched in the organization field 
    - apikey: a string of the personal API key issued by the New York Times API
- The script includes codes for assessing polarity and subjectivity scores of abstracts, headlines, snippets and paragraphs of the articles by using the TextBlob package
- Also, it includes codes for downloading daily share prices on Apple Inc. by using the yahoo_historical package
- Both data sets are then exported to the csv files

## 2. TextBlob - Naive Bayes Classifier 
- It's a Jupyter Notebook to fit the NLTK Naive Bayes Classifier to the article data
- The classifier was fitted to the data by using the existing function in TextBlob package
- The script also downloads daily share prices of Apple Inc., take the log difference on the share prices, and convert them into a binary response (positive or negative return)
- **nbc(text='abstract'):** A function to fit the Naive Bayes Classifier to the text data 
    - text: specify which text data to be used ('abstract', 'headline', 'snippet', 'paragraph')
    - *classifer.show_informative_features(x):* will return the top x most informative features (i.e. words) and its ratio of occurrence in positive and negative labels
    - *classifier.classify(text):* will return prediction for the direction of the share price (pos/neg) given the input of texts

## 3. Final_Project_Model
- it's a R markdown that performs additional analyses
- The script uses the sentimentr package to get polarity scores 
- The script includes codes for running logistics regression between polarity scores and the share price returns (in a binary format)
- It also has codes for fitting xgboost to the data and returning the accuracy rate of classification

