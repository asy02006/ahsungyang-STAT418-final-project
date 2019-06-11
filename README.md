# Final Project for STAT418 Course

This is a Github repository for the Final Project of STAT 418 course. The final project is to find a relationship between the sentiment of New York Times articles on Apple Inc. and its share price returns. To find the relationship, two different approaches were used. First, I attempted to fit the NLTK Naive Bayes Classifier directly to the articles tagged with the corresponding share price returns (after converting them into a binary response - positive / negative return). Second, I used the existing text analysis packages to get sentiment/polarity scores of articles and used the scores to fit logistics regression and xgboost models. 

## Final Project Report
Please refer to the **Final_Project_Report** for detailed explanation of the project.

## 1. Codes
The Codes directory contains Jupyter Notebook and R Markdown files for downloading data, assessing sentiment scores, fitting the Naive Bayes Classifier, and running logistics regression and xgboost on the sentiment scores 

## 2. Api
The Api directory is for a Flask API that returns positive or negative classification (share price return) for an input of texts using the NLTK Naive Bayes Classifier fitted to the articles and corresponding share price returns. Due to the memory allocation problem, it's not currently hosted on Amazon EC2 instance. Please download the directory to run the API.

## 3. Shiny
The Shiny directory is for creataing a Shiny application that displays plots of historical sentiment scores of articles on Apple Inc. and the number of articles issued. It's currently running at  `https://ahsung-yang.shinyapps.io/sentiment/`.

## 4. Presentation
The diretory contains the final presentation in pdf.
