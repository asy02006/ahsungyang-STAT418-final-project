
#deploy to shinyapps.io


#install.packages('rsconnect')

#name is account name, get both your authentication token and secret in your account
rsconnect::setAccountInfo(name='ahsung-yang', 
                          token='<TOKEN>',
                          secret='<SECRET>')

setwd("~/Documents/2019_Spring_Q/STAT418/ahsungyang-STAT418-final-project/shiny")
library(rsconnect)
rsconnect::deployApp(appDir = 'docker/app/',appName="sentiment")

#this is now running at
#https://ahsung-yang.shinyapps.io/sentiment/
