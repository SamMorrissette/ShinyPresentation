# The goal of this project is to expand on example 1. We will include options for
# changing the colour of the histogram, and changing axes labels/titles. 
# Then, we will include a button to download the histogram. 

library(shiny)

fluidPage(
  titlePanel("Shiny Coding Example"),
  sidebarLayout(
    sidebarPanel(
      
      sliderInput("bins", "Number of bins", min = 1, max = 50, value = 30),
      
      selectInput("colour", "Select a colour for the histogram",
                  choices = c("Grey", "Light Blue", "Light Green", "Pink")),
      
      textInput("title", "Input a title for the histogram", value = "Title"),
      
      textInput("x_title", "Input an x-axis title for the histogram", value = "Waiting time to next eruption (mins)"),
      
      downloadButton(outputId = "download", label = "Download histogram")
    ),
    
    mainPanel(
      plotOutput("histogram")
    )
  )
)