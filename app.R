#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(knitr)
library(rmarkdown)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Knitr"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
        textInput('firstname', 'First name', value = 'Jimmy'),
        textInput('lastname', 'Last name', value = 'John'),
        downloadButton('report')
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  
  hi <- "Hello"
  
  output$report = downloadHandler(
    filename = 'myreport.pdf',
    
    content = function(file) {
      out = knit2pdf('input.Rnw', clean = TRUE)
      file.rename(out, file) # move pdf to file for downloading
    },
    
    contentType = 'application/pdf'
  )
}

# Run the application 
shinyApp(ui = ui, server = server)

