library(shiny)

# Source our server and ui files
source("app_server.R")
source("app_ui.R")

# Create a new `shinyApp()` using the loaded `ui` and `server` variables
shinyApp(ui = ui, server = server)

