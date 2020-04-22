library(shiny)
library(dplyr)
library(tidyverse)


source("func.R")

load("crimeSummary.RData")
compareToAge <- c("Arrested.Person.Home.Address.State", "Arrested.Person.Sex",
                  "Arrested.Person.Race", "Arrested.Person.Ethnicity", "Month",
                  "Day.of.Week", "Shooting")
