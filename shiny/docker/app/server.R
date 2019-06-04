##
## This ShinyApp shows average sentiment scores of NY Times 
## articles on Apple Inc.

library(shiny)
library(dplyr)
library(lubridate)
library(sentimentr)
library(SentimentAnalysis)
library(ggplot2)
library(gridExtra)


shinyServer(function(input, output) {
  

  # Reactive value that triggers plot update and stores fitted values
  v <- reactiveValues(fitted_values = NULL,
                      r2 = NULL)
  
  v$date = c(as.Date('2014-01-01', format = '%Y-%m-%d'), as.Date('2019-04-30', format = '%Y-%m-%d'))
  v$sentiment = c(0,0)
  v$no = c(0,0)
  
  # When action button was triggered...
  observeEvent(input$trigger_estimation, {
    # Add progress bar
    withProgress(message = 'Please wait',
                 detail = 'Bring the data...', value = 0.6,
    {
      # Run estimation depending on the model specification
      if (input$type == "1" & input$text == "1"){
        sentiment <- news$abstract_polarity
      }
      
      else if (input$type == "1" & input$text == "2"){
        sentiment <- news$headline_polarity
      }
      
      else if (input$type == "1" & input$text == "3"){
        sentiment <- news$snippet_polarity
      }
      
      else if (input$type == "1" & input$text == "4"){
        sentiment <- news$paragraph_polarity
      }
     
      else if (input$type == "2" & input$text == "1"){
        sentiment <- news$abstract_polarity_nba
      }
      
      else if (input$type == "2" & input$text == "2"){
        sentiment <- news$headline_polarity_nba
      }
      
      else if (input$type == "2" & input$text == "3"){
        sentiment <- news$snippet_polarity_nba
      }
      
      else if (input$type == "2" & input$text == "4"){
        sentiment <- news$paragraph_polarity_nba
      }
      
      else if (input$type == "3" & input$text == "1"){
        sentiment <- sentiment_by(get_sentences(as.character(news$abstract)))$ave_sentiment
      }
      
      else if (input$type == "3" & input$text == "2"){
        sentiment <- sentiment_by(get_sentences(as.character(news$headline)))$ave_sentiment
      }
      
      else if (input$type == "3" & input$text == "3"){
        sentiment <- sentiment_by(get_sentences(as.character(news$snippet)))$ave_sentiment
      }
      
      else if (input$type == "3" & input$text == "4"){
        sentiment <- sentiment_by(get_sentences(as.character(news$paragraph)))$ave_sentiment
      }
      
      # Increase progress bar to 0.8  
      incProgress(0.8, detail="Plotting the results")
      
      # Create a data set
      news_data = cbind(date = as.character(news$date), sentiment)
      news_data = as.data.frame(news_data)
      
      if (input$timeframe == "1"){
        news_grouped = group_by(news_data, date) 
        news_grouped = summarize(news_grouped, no_articles = n(), sentiment = mean(as.numeric(as.character(sentiment))))
        news_grouped = as.data.frame(news_grouped)
        v$date = as.Date(as.character(news_grouped$date), format = '%Y-%m-%d')
        v$sentiment = news_grouped$sentiment
        v$no = news_grouped$no_articles
      }
      
      else if (input$timeframe == "2"){
        news_grouped = group_by(news_data, date = format(as.Date(news$date, format = '%Y-%m-%d'), format = '%Y-%W'))
        news_grouped = summarize(news_grouped, no_articles = n(), sentiment = mean(as.numeric(as.character(sentiment)))) 
        news_grouped = as.data.frame(news_grouped)
        v$date = seq(1,length(news_grouped$date))*7 + as.Date('2013-12-29', format = '%Y-%m-%d') 
        v$sentiment = news_grouped$sentiment
        v$no = news_grouped$no_articles
      }
      
      else if (input$timeframe == "3"){
        news_grouped = group_by(news_data, date = format(as.Date(news$date, format = '%Y-%m-%d'), format = '%Y-%m')) 
        news_grouped = summarize(news_grouped, no_articles = n(), sentiment = mean(as.numeric(as.character(sentiment))))
        news_grouped = as.data.frame(news_grouped)
        v$date = as.Date(paste(news_grouped$date, '-01', sep = ''), format ='%Y-%m-%d')
        v$sentiment = news_grouped$sentiment
        v$no = news_grouped$no_articles
      }
      
      freq_table = function(){
        if(input$type != 3){
          df = data.frame('Negative Terms' = NULL, 'Freq' = NULL, 'Positive Terms' = NULL, 'Freq' = NULL)
        }else {
          if(input$text == '1'){
            sent_terms = extract_sentiment_terms(get_sentences(as.character(news$abstract)))
            table_neg = sort(table(unlist(sent_terms$negative)), decreasing = TRUE)[1:10]
            table_neg = as.data.frame(table_neg)
            table_pos = sort(table(unlist(sent_terms$positive)), decreasing = TRUE)[1:10]
            table_pos = as.data.frame(table_pos)
            df = cbind(table_neg, table_pos)
            df = as.data.frame(df)
            colnames(df) = c('Negative Terms', 'Freq', 'Positive Terms', 'Freq')
          }else if(input$text == '2'){
            sent_terms = extract_sentiment_terms(get_sentences(as.character(news$headline)))
            table_neg = sort(table(unlist(sent_terms$negative)), decreasing = TRUE)[1:10] 
            table_neg = as.data.frame(table_neg)
            table_pos = sort(table(unlist(sent_terms$positive)), decreasing = TRUE)[1:10] 
            table_pos = as.data.frame(table_pos)
            df = cbind(table_neg, table_pos)
            df = as.data.frame(df)
            colnames(df) = c('Negative Terms', 'Freq', 'Positive Terms', 'Freq')
          }else if(input$text == '3'){
            sent_terms = extract_sentiment_terms(get_sentences(as.character(news$snippet)))
            table_neg = sort(table(unlist(sent_terms$negative)), decreasing = TRUE)[1:10]
            table_neg = as.data.frame(table_neg)
            table_pos = sort(table(unlist(sent_terms$positive)), decreasing = TRUE)[1:10]
            table_pos = as.data.frame(table_pos)
            df = cbind(table_neg, table_pos) 
            df = as.data.frame(df)
            colnames(df) = c('Negative Terms', 'Freq', 'Positive Terms', 'Freq')
          }else if(input$text == '4'){
            sent_terms = extract_sentiment_terms(get_sentences(as.character(news$paragraph)))
            table_neg = sort(table(unlist(sent_terms$negative)), decreasing = TRUE)[1:10] 
            table_neg = as.data.frame(table_neg)
            table_pos = sort(table(unlist(sent_terms$positive)), decreasing = TRUE)[1:10] 
            table_pos = as.data.frame(table_pos)
            df = cbind(table_neg, table_pos) 
            df = as.data.frame(df)
            colnames(df) = c('Negative Terms', 'Freq', 'Positive Terms', 'Freq')
          }
        }
        return(df)
      }
      
      output$extract_term <- renderDataTable({freq_table()})
      
      # Increase progress bar to 1
      incProgress(1, detail="Finish")
    })
  })
  
  # Estimation Results
  #output$estimation_results <- renderText(
  #  v$var
  #)
  
  # Accuracy Box (Use it if needed)
  output$accuracy_box <- renderValueBox({
    if (input$type != '2'){
      range = '[-1 to +1]'
    }else{
      range = '[0 to +1]'
    }
    valueBox(
      paste0(round(mean(as.numeric(v$sentiment)),3), " ", range), 
      "Overall Mean of Sentiment Scores", icon = icon("tachometer"),
      color = "light-blue"
      )	
    })

  # Overview Plot
  output$plot1 <- renderPlot({

      p1 = ggplot(data = data.frame(date = v$date, sentiment = v$sentiment, no = v$no), aes(x = date)) + 
        geom_line(aes(y = as.numeric(sentiment))) +
        geom_hline(yintercept = mean(as.numeric(v$sentiment)), color = 'red', linetype = 'dashed', size = 1) + 
        geom_text(aes(v$date[1], round(mean(as.numeric(v$sentiment)),2), label = round(mean(as.numeric(v$sentiment)),2), vjust = -1), size = 6, color = 'red') +
        labs(title ="Historical Sentiment Scores", x = "Date", y = "Sentiment Score")
    
      p2 = ggplot(data = data.frame(date = v$date, no = v$no), aes(x = date)) + 
        geom_bar(aes(y = as.numeric(no)), stat = 'identity', size = 0.5) +
        labs(title ="Historical Number of Articles", x = "Date", y = "Number of Articles")
        
      grid.arrange(p1, p2, nrow = 2)

  })
 
  # Show Data Table
  output$data_table <- renderDataTable({news}) 

})
