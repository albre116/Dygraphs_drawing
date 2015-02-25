library(RJSONIO)
shinyServer(function(input, output, session) {
  
  output$test <- renderUI({
    noPoints <- as.integer(input$obs)
    series <- toJSON(cbind(seq(88, 266, by = (266-88)%/%(noPoints-1)), 113))
    
    tags$script(HTML(
      paste0("$(document).ready(function () {
            
      $.jqplot.config.enablePlugins = true;
      
      s1 = ",
             series,       
             ";
      
      plot1 = $.jqplot('chart2',[s1],{
      title: 'Highlighting, Dragging, Cursor and Trend Line',
          seriesDefaults: {
          showLine: false
          },
             axes: {
             xaxis: {
             labelRenderer: $.jqplot.CanvasAxisLabelRenderer,
             label: \"X Axis\"
             },
             yaxis: {
             tickOptions: {
             labelRenderer: $.jqplot.CanvasAxisLabelRenderer
             },
             label: \"Y Axis\",
             max: 200,
             min: 0
             }
             },
             highlighter: {
             sizeAdjust: 10,
             tooltipLocation: 'n',
             tooltipAxes: 'xy',
             useAxesFormatters: false
             },
             cursor: {
             show: true
             }
  });
             });")
    ))
    
  })
  
})