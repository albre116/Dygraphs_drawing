# Define UI
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Hello Shiny!"),
    
    # Sidebar with a slider input
    sidebarPanel(
      sliderInput("obs",
                  "Number of observations:",
                  min = 2,
                  max = 9,
                  value = 5)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tags$head(
        includeScript("www/dist/jquery.jqplot.min.js"),
        includeScript("www/dist/plugins/jqplot.dateAxisRenderer.min.js"),
        includeScript("www/dist/plugins/jqplot.barRenderer.min.js"),
        includeScript("www/dist/plugins/jqplot.categoryAxisRenderer.min.js"),
        includeScript("www/dist/plugins/jqplot.cursor.min.js"),
        includeScript("www/dist/plugins/jqplot.highlighter.min.js"),
        includeScript("www/dist/plugins/jqplot.dragable.min.js"),
        includeScript("www/dist/plugins/jqplot.trendline.min.js"),
        includeCSS("www/dist/jquery.jqplot.min.css"),
      uiOutput('test')
      ),
      tags$div(id = 'chart2')
      
    )
    
  ))

