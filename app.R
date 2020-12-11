library(shiny)
library(tidyverse)
library(dplyr)
library(plotly)
library(ggplot2)
library(maps)
library(mapproj)
library(patchwork)
library(ggmap)
library(RColorBrewer)
library(rbokeh)
library(gridExtra)

# Source our server and ui files
source("app_server.R")
source("app_ui.R")

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)

