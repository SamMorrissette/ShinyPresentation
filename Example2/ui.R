#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

vars <- setdiff(names(iris), "Species")

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel('Iris k-means clustering'),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
      selectInput('xcol', 'X Variable', vars),
      
      selectInput('ycol', 'Y Variable', vars, selected = vars[[2]]),
      
      numericInput('clusters', 'Cluster count', 3, min = 1, max = 9)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput('plot1')
    )
  )
)



