library(dygraphs)
library(datasets)

shinyServer(function(input, output) {
  
  predicted <- reactive({
    hw <- HoltWinters(ldeaths)
    predict(hw, n.ahead = input$months, 
            prediction.interval = TRUE,
            level = as.numeric(input$interval))
  })
  
  output$dygraph <- renderDygraph({
    dygraph(predicted(), main = "Predicted Deaths/Month") %>%
      dySeries(c("lwr", "fit", "upr"), label = "Deaths") %>%
      dyOptions(drawGrid = input$showgrid)
  })
  
  output$from <- renderText({
    if (!is.null(input$dygraph_date_window))
      strftime(input$dygraph_date_window[[1]], "%d %b %Y")      
  })
  
  output$to <- renderText({
    if (!is.null(input$dygraph_date_window))
      strftime(input$dygraph_date_window[[2]], "%d %b %Y")
  })
  
  output$datas <- renderDataTable({
    if (is.null(input$dygraph_data_extract)){return(NULL)}
      raw <- input$dygraph_data_extract
      dimension <- input$dygraph_data_dimension_RowCol
      out <- matrix(raw,nrow=dimension[[1]],ncol=dimension[[2]],byrow = T)
      out <- as.data.frame(out)
    return(out)
    
  })
  
})
