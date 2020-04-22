
source("global.R")
ui <- fluidPage(
  theme = shinytheme("superhero"),
  #
  #
  #
  tags$div( style = "max-width:70%; margin:auto; text-align:center; margin-top: 20px;",
  
  headerPanel(title = "Sammamish Arrest Summary"),
  
  # Creating First Tabset here
  #
  #   
  tabsetPanel(
    tabPanel("Variables", "Variables and Their Distribusion",
             tags$div(
               selectInput(inputId = "select", choices = aa, 
                           label = "Select Column for inspection"), style ="margin-top:20px"),
             #
             #
             # Variable description is shown here
             #
             #
             tags$h4("Data Description", style = "margin-top:20px; padding-top:10px ; border-top:grey 1px solid; width:60% "),
             
             tags$div(
               
               textOutput("varDiscription"),
               style = "margin-bottom:30px ; border-bottom:grey 1px solid; 
               width:60%; padding-bottom:10px"
             ),
             
             fluidRow(
               column(12,
                      plotOutput("distribution"))
             ),
             
             
             tags$h4("Note: Only top 10 items are diplayed for every Variable"),
             tags$br()
             
             
             
             
             
             
             
    ), 
    tabPanel("Age of Arrested Person", "",
             
             
             tags$div(
               
               
               
               selectInput( inputId = "variableToCompare", label = "SELECT THE VARIABLE TO SEE HOW AGE MATTERS", 
                            choices = compareToAge, width = "50%"), style = "margin-top:20px"
             ),
             tags$div(plotOutput("boxVariance"),
                      style= "margin-top:100px")
             
             
             
             
    )

    
  ),
  
  
  
  ) 
  
)