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
  data <- reactive({
    req(input$upload_file)
    data <- read.csv(input$upload_file$datapath)
  })
  
  output$contents <- renderDT({
    datatable(data(), rownames = FALSE)
  })
  
  output$regression_plot <- renderPlot({
    my_df <- data()
    lm_out <- lm(my_df[,2] ~ my_df[,1])
    plot(my_df[,1], my_df[,2])
    abline(lm_out, col = "red", lwd = 2)
  })
  
  output$summary <- renderPrint({
    my_df <- data()
    lm_out <- lm(my_df[,2] ~ my_df[,1])
    summary(lm_out)
  })
    
    
  
}
