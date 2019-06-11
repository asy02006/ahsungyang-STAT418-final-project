# Shiny App on Sentiment Scores 

**The app is currently running at** `https://ahsung-yang.shinyapps.io/sentiment/`

*(Please ignore docker files in the directory and use the app by clicking the above link instead.)*

This is a directory to create a Shiny app that shows plots of (1) historical sentiment (i.e. polarity) scores of New York Times articles on Apple Inc and (2) the number of articles issued (on a daily, weekly or monthly basis) from January 1, 2014 to April 30, 2019. It uses three different existing sentiment analysis packages to plot the historical sentiment scores of the articles. The application allows the user to choose: 

**1. Sentiment Analyzer:** PatternAnalyzer, Naive Bayes Analyzer, Sentimentr  
**2. Type of text data:** Abstract, Headline, Snippet, Paragraph  
**3. Frequency of data:** Daily, Weekly, Monthly (for weekly or monthly frequency, the sentiment score is the average of daily scores in the corresponding period)  

## **Description of Packages/Analyzer**

### 1. Python / Textblob / PatternAnalyzer (default)
- Sentiment analyzer that uses the same implementation as the pattern library (PatternAnalyzer)
- The polarity score is a float within the range [-1.0, 1.0].

### 2. Python / Textblob / NaiveBayesAnalyzer
- Sentiment analyzer that uses Naive Bayes analyzer which is trained on a movie review corpus.
- A Naive Bayes Analyzer is based on the Naive Bayes algorithm, as implemented in NLTK.
- Returns the label probability distribution for classifying a string of text.
- The polarity score is a float within the range [0, 1.0].

### 3. R / Sentimentr 
- Sentimentr is an augmented and advanced dictionary search
- It attempts to take into account valence shifters (i.e., negators, amplifiers (intensifiers), de-amplifiers (downtoners), and adversative conjunctions) while maintaining speed.
- For more information, please refer to `https://cran.r-project.org/web/packages/sentimentr/readme/README.html`
- **In case the sentimentr package is chosen, the top 10 most frequently mentioned negative and positive terms will be extracted and displayed in a separate table on the right side.**









