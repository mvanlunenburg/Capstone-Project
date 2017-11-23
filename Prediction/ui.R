#
# This app gives suggestions for the next word in a phrase. 
#

#load libraries
suppressPackageStartupMessages(c(
        library(shinythemes),
        library(shiny),
        library(tm),
        library(stringr),
        library(markdown),
        library(stylo)))

#ui
shinyUI(navbarPage("Coursera Data Science Capstone", 
                   
                   theme = shinytheme("cerulean"),
                   
                   ## Tab 1 - Prediction
                   
                   tabPanel("Next Word Prediction",
                            
                            
                            
                            fluidRow(
                                    
                                    column(3),
                                    column(6,
                                           tags$div(textInput("text", 
                                                              label = h3("Enter your text here:"),
                                                              value = ),
                                                    tags$span(style="color:grey",("Only English words are supported.")),
                                                    br(),
                                                    tags$hr(),
                                                    h4("The predicted next word:"),
                                                    tags$span(style="color:darkred",
                                                              tags$strong(tags$h3(textOutput("predictedWord")))),
                                                    br(),
                                                    tags$hr(),
                                                    h4("What you have entered:"),
                                                    tags$em(tags$h4(textOutput("enteredWords"))),
                                                    align="center")
                                    ),
                                    column(3)
                            )
                   ),
                   
                   ############################### ~~~~~~~~2~~~~~~~~ ##############################
                   ## Tab 2 - About 
                   
                   tabPanel("About This Application",
                            fluidRow(
                                    column(2,
                                           p("This app gives suggestions for the next word in a phrase. It is especially designed for people learning the English language. Underneath you find a report with more information about the creation of the app.")),
                                    column(8,
                                           includeMarkdown("Milestone_report.Rmd")),
                                    column(2,
                                           p("The data used in this project is kindly provided by SwiftKey"))
                            )
                   )
                   
                  
)
)