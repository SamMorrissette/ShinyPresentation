# Create an app that allows the user to upload their own dataset and display 
# a nicely formatted table

library(shiny)
library(DT)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Table Example"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
          fileInput("upload_file", "Upload a .csv file", accept = ".csv")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            DTOutput("contents", width = "60%")
        )
    )
)
