#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

# Define server logic required to draw a histogram
function(input, output, session) {
  output$contents <- renderDT({
    req(input$upload_file)
    data <- read.csv(input$upload_file$datapath)
    datatable(data, rownames = FALSE)
  })
}
