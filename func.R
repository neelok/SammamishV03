
# var is the variable (colnames)
makePlot <- function(var){

    vec <- getArrestData[,var]
    nameVariables <- colnames(getArrestData)
    indexVariable <- which(nameVariables==var)
    
    
    par(mar = c(5,5,5,5))
    
    if(class(vec)=="numeric"|class(vec)=="integer"){
      
      hist(getArrestData[,var], main = fancyTitleName[indexVariable],
           col = rainbow(10), xlab = "") 
      
    } else if(nlevels(as.factor(vec)) > 0){
      
      crimeTable <- table(getArrestData[,var])
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
      
      hist(1, main = var)
      text(x = 0.5, y= 0.5, "Too Few Levels to Plot", cex = 1.2)
    }
}