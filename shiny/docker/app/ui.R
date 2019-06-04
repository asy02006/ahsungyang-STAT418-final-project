#
# This ShinyApp shows how to evaluate and compare
# the quality of linear models.
#

# Use ShinyDashboard
library(shinydashboard)

ui <- dashboardPage(
  
  # Define Header and Sidebar
  dashboardHeader(title = "Sentiment Analysis"),
  
  dashboardSidebar(
    sidebarMenu(
      menuItem("Sentiment", tabName = "Sentiment", icon = icon("atom")),
      menuItem("Data", tabName = "data", icon = icon("database")),
      menuItem("About", tabName = "about", icon = icon("info-circle"))
    )
  ),
  

  dashboardBody(
    
    # Define CSS style for the estimation button
    tags$head(tags$style(HTML('
                              .estimation_button {background-color: #33CE67; width: 100%}
                              .estimation_button:hover {background-color: #1DAA4C}
                              '))),
    
    # Define content for each page
    tabItems(
      
      # Estimation Page
      tabItem(tabName = "Sentiment",
              
                
                # Add box for graph 
                box(
                  title = "Historical Daily Sentiment of NY Times Articles on Apple Inc",
                  solidHeader = TRUE,
                  status = "primary",
                  width = 15,
                  plotOutput("plot1")
                  ),
                
                fluidRow(
                  column(6,
                         # Add box for estimation parameters
                         box(
                           width = 10,
                           title = "Sentiment Analysis Packages / Text",
                           status = "primary",
                           solidHeader = TRUE,
                           
                           radioButtons("type", "Choose the type of sentiment analyzer:",
                                        c("Python1 - Pattern Analzyer" = "1",
                                          "Python2 - Naive Bayes Classifier" = "2",
                                          "R - Sentimentr" = "3")),
                           
                           radioButtons("text", "Choose the type of text:",
                                        c("Abstract" = "1",
                                          "Headline" = "2",
                                          "Snippet" = "3",
                                          "Paragraph" = "4")),
                           
                           radioButtons("Frequency", "Choose the frequency:",
                                        c("Daily" = "1",
                                          "Weekly" = "2",
                                          "Monthly" = "3")),
                           
                           actionButton("trigger_estimation","Show",
                                        icon("play"),
                                        class="estimation_button"
                           )
                         )
                  ),
                # Add box for Accuracy
                #valueBoxOutput("accuracy_box", width = 5),
                column(6,
                       box(
                         title = "Top 10 Most Frequent Terms",
                         solidHeader = TRUE,
                         status = "primary",
                         width = 15,
                         dataTableOutput("extract_term")
                       )
                       
                )
                )
                
      ),

      #Data Page
      tabItem(tabName = "data",
              h2("Data"),
              fluidPage(
              dataTableOutput("data_table")
              )
      ),
      
      # About Page
      tabItem(tabName = "about",
              includeHTML("about.html")
      )
      
  )
)
)
