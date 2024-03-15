#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  titlePanel("Regression Example"),
  tabsetPanel(
    type = "tabs",
    tabPanel("Upload data", 
             sidebarLayout(
               sidebarPanel(
                 fileInput("upload_file", "Upload a .csv file", accept = ".csv")
                 ),
               
               # Show a plot of the generated distribution
               mainPanel(
                 DTOutput("contents", width = "60%")
                 )
               )
             ),
    tabPanel("Plot",
             plotOutput("regression_plot")),
    tabPanel("Statistics",
             verbatimTextOutput("summary"))
  )
)
