
#deploy to shinyapps.io


#install.packages('rsconnect')

#name is account name, get both your authentication token and secret in your account
rsconnect::setAccountInfo(name='ahsung-yang', 
                          token='558C27A37DA178DF8D4A7B4AECE8A6B0', 
                          secret='YHTy0p6ET9GIGmWXFYYnCz/M4SC4nquTMUtOSDyf')

setwd("~/Documents/2019_Spring_Q/STAT418/ahsungyang-STAT418-final-project/shiny")
library(rsconnect)
rsconnect::deployApp(appDir = 'docker/app/',appName="sentiment")

#this is now running at
#https://ahsung-yang.shinyapps.io/sentiment/
