## Set data to the csv file saved in Repo
## Data is downloaoded from the NY Times API 
## with sentiment scores computed using Python Packages
## Change the directory to where the csv file is saved

news <- read.csv('news_data.csv')
news = as.data.frame(news)
