library(shiny)
library(shinydashboard)
library(distr6)
library(plotly)
library(ggplot2)
library(dplyr)
library(DT)
library(purrr)

# Source files
files <- list.files(path = "./R", recursive = T, full.names = T)
walk(files, source)