#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
source("global.R")
source("func.R")

#* @apiTitle Sammaish Crime Summary



#* Plot a Bar plot
#* @param var
#* @png
#* @get /plot
function(var) {
  makePlot(var)
}


