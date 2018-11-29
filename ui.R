# loading library
library(shiny)
library(quantmod)
library(VGAM)


# Define UI for random distribution application 
shinyUI(pageWithSidebar(
  # title of the App
  headerPanel("Stock Analysis"),
  # Input functions
  sidebarPanel(
    #adding text
    helpText("Stock will be extracted from Yahoo Finance"),
    #Input for symbol of the stock
    textInput("symb", "Symbol", "GOOG"),
    #range of dates
    dateRangeInput("dates", 
                   "Compare to historic returns from",
                   start = "2015-04-02", end = "2015-09-05"),
    #you need to click this to get the data uploaded
    actionButton("get", "Extract Data"),
    #add spacing
    br(),
    br(),
    
    # outputs of the stock analysis
    uiOutput("newBox"),
    p("Copyright (c) 2018 Mario Rosales")
    
    ),
  
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Charts", plotOutput("chart")), 
      tabPanel("Model", div(h3(textOutput("ks"))), 
               div(h3(textOutput("ksp"))), 
               plotOutput("hist")),
      id = "tab"
    )
  )
))