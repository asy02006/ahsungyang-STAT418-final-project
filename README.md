# Final Project for STAT418 Course

This is a Github repository for the Final Project of STAT 418 course. The final project is to find a relationship between the **sentiment of New York Times articles on Apple Inc. and its share price returns.** For the project, two different approaches were applied. First, I attempted to fit the NLTK Naive Bayes Classifier directly to the articles tagged with the corresponding share price returns (after converting them into a binary response - positive / negative return). Second, I used the existing text analysis packages to get sentiment/polarity scores of articles and used the scores to fit logistics regression and xgboost models. 

Please refer to the the _**Final_Project_Report**_ for further description of the project. 

A few directories were created for the project, and brief descriptions are as follows:

## 1. Codes
The Codes directory contains Jupyter Notebooks and R Markdown file for downloading data, assessing sentiment scores, fitting the Naive Bayes Classifier, and running logistics regression and xgboost on the sentiment scores 

## 2. Api
The Api directory is for a Flask API that returns a positive or negative classification (share price return) for an input of texts using the NLTK Naive Bayes Classifier fitted to the articles and corresponding share price returns. Due to the memory allocation problem, it's not currently hosted on Amazon EC2 instance. Please download the directory to run the API.

## 3. Shiny
The Shiny directory is for creataing a Shiny application that displays plots of historical sentiment scores of articles on Apple Inc. and the number of articles issued. It's currently running at  `https://ahsung-yang.shinyapps.io/sentiment/`.

## 4. Presentation
The diretory contains the final presentation in pdf.
