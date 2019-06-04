# Shiny App on Sentiment Scores 

**The app is currently running at**
`https://ahsung-yang.shinyapps.io/sentiment/`

This is a directory to create a Shiny app that shows a plot of historical sentiment scores (polarity) of New York Times articles on Apple Inc from January 1, 2014 to April 30, 2019.

It uses three different existing sentiment analysis packages to plot the historical sentiment scores of the articles.

You can choose the sentiment analysis method (PatternAnalyzer, Naive Bayes Analyzer, Sentimentr), type of text data (abstract, headline, snippet, paragraph), and frequency of data (daily, weekly, monthly) to get a plot of historical sentiment scores.

For weekly or monthly frequency, the sentiment score is the average score of the corresponding period. 

## Description of Packages/Analyzer

### 1. Python / Textblob / PatternAnalyzer (default)
- Sentiment analyzer that uses the same implementation as the pattern library (PatternAnalyzer).
- The polarity score is a float within the range [-1.0, 1.0].
### 2. Python / Textblob / NaiveBayesAnalyzer
- Sentiment analyzer that uses Naive Bayes analyzer which is trained on a movie review corpus.
- A classifier based on the Naive Bayes algorithm, as implemented in NLTK.
- Returns the label probability distribution for classifying a string of text.
- The polarity score is a float within the range [0, 1.0].
### 3. R / Sentimentr 
- sentimentr attempts to take into account valence shifters (i.e., negators, amplifiers (intensifiers), de-amplifiers (downtoners), and adversative conjunctions) while maintaining speed.
- An augmented dictionary search
- For more information, please refer to 
`https://cran.r-project.org/web/packages/sentimentr/readme/README.html`
- For sentimentr package, the negative and positive terms detected by the analyzer can be extracted.
- Top 10 most frequently mentioned negative and positive temrs will be shown in a separate table









