server <- function(input, output, session) {

  
  x <- reactive({getArrestData[,input$select]})
  nameVariables <- colnames(getArrestData)
  
  #
  # This barplot is displayed in the first tab and lot of values are calculated
  # based
  #
  
  
  output$distribution <- renderPlot({
    indexVariable <- which(nameVariables==input$select)
    
    par(mar = c(5,20,5,5))
    
    if(class(x())=="numeric"|class(x())=="integer"){
      
      hist(getArrestData[,input$select], main = fancyTitleName[indexVariable],
           col = rainbow(10), xlab = "") 
      
    } else if(nlevels(as.factor(x())) > 0){
      
      crimeTable <- table(getArrestData[,input$select])
      crimeTable <- sort(crimeTable, decreasing = TRUE)
      
      #
      #
      # Calculating an offset for better representation of the frequency on top of
      # Barplot
      #
      dataRange <- range(crimeTable)[2]
      offset <- dataRange/20
      if(offset < 5){
        realOffset <- 5
      } else {
        realOffset <- offset
      }
      
      #
      # Creating labels for the bar graph
      #
      yCord <- barplot(crimeTable[1:10], las=2, horiz = TRUE, 
                       main = fancyTitleName[indexVariable], col = rainbow(10), 
                       xlim = c(0, dataRange *1.2))
      
      
      
      
      xCord <- crimeTable
      
      #
      #Displaying the text on top of the barplot
      #
      
      text(y = yCord[1:length(xCord)], x = xCord + offset, labels = xCord)
    } else{
      
      #
      # A blank histogram is shown if the data is not compatible
      #
      
      hist(1, main = input$select)
      text(x = 0.5, y= 0.5, "Too Few Levels to Plot", cex = 1.2)
    }
    
    
  } )
  
  #
  # This plot is displayed in the second tab
  #
  
  output$boxVariance <- renderPlot(
    {
      par(mar = c(15, 10, 1, 10))
      plot(as.factor(getArrestData[, input$variableToCompare]),
           getArrestData$Arrested.Person.Age, las = 3,
           xlab = "", ylab = "Age of the Arrested Person", 
           col =rainbow(10))
      title(xlab = input$variableToCompare, line = 14)
    }
    
    
  )
  
  #
  # This is to display the description of the data to the chart
  #
  #
  
  output$varDiscription <- renderText(
    {
      n <- which(varDisc[,1] == input$select)
      unlist(varDisc[n, 2])
      
    }
  )
  
  output$var3 <- renderText(
    {
      range(table(getArrestData[,input$select]))[2]
    }
  )
  
}