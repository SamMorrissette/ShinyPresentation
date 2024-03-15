library(shiny)

function(input, output, session) {
  data <- faithful$waiting

  colours <- reactive({
    switch(input$colour,
           "Grey" = "grey",
           "Light Blue" = "lightblue",
           "Light Green" = "lightgreen",
           "Pink" = "pink")
  })
  

  
  output$histogram <- renderPlot({
    hist(data, 
         breaks = input$bins, 
         col = colours(),
         xlab = input$x_title,
         main = input$title)
  })
  
  output$download <- downloadHandler(
    filename = function(file) {
      "hist_plot.png"
    },
    
    content = function(file) {
      png(file)
      hist(data, 
           breaks = input$bins, 
           col = colours(),
           xlab = input$x_title,
           main = input$title)
      dev.off()
    },
  )
}
