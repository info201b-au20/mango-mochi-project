library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)

source("scripts/education.R")
source("scripts/gender.R")
source("scripts/race.R")
source("scripts/table_summary.R")

######## education graph #########
build_education_graph <- function(df, hover, year_range, type) {
   education_graph <- plot_ly(
      data = df,
      x = ~date,
      y = ~unemployment_rate,
      type = "scatter",
      alpha = .7,
      color = ~education_type,
      mode = "markers",
      stackgroup = type,
      text = ~ paste("Date: ", date, "<br>Unemployment Rate:", unemployment_rate,
         "<br>education:", education_type),
      width=1000, height=700
   ) %>%
   layout(
      hovermode = hover,
      yaxis = list(title = "Unemployment Rate (%)"),
      xaxis = list(
        title = "Date",
        type = "date",
        range = year_range,
        rangeselector = list(
        buttons = list(
          list(
          count = 2,
          label = "2 yr",
          step = "year",
          stepmode = "backward"
        ),
          list(
          count = 5,
          label = "4 yr",
          step = "year",
          stepmode = "backward"
        ),
          list(
          count = 13,
          label = "12 yr",
          step = "year",
          stepmode = "backward"
        ),
          list(count = 21,
          label = "all",
          step = "year",
          stepmode = "backward")
        )
        )
      )
   )
}

unemployment_sum <- Unemployment_summary %>%
  filter(Year > 2016 | Year > 2007 & Year < 2012) %>% 
  rename(Some_College = Some_College_or_Associate_Degree)

##### creates the server to create and output the graph from widget inputs.
server <- function(input, output) {
  output$unemployment <- renderTable(unemployment_sum)

  output$education_graph <- renderPlotly({
    return(build_education_graph(education, input$hover, input$year_range,
                         input$type))
  })
  
#### tenz work in progress --------------------
  output$gender_graph <- renderPlot({
    updated <- gender_all %>%
      filter(date == input$date) %>%
      select(unemployment_rate, date, gender_type)
    
    output$value <- renderPrint({ input$slider })
    gender_pallettte <- c("seagreen3", "mediumorchid")
    
    ggplot(data = updated) + 
      geom_line(mapping = aes(x = date, y = unemployment_rate, color = gender_type)) +
      labs(x = "Year", y = "Unemployment Rate",
      title = "Unemployment Rate (20 Years +)") +
      scale_color_manual(values = gender_pallettte) + 
      lims(x = c(max(input$slider), 2020))
  })
# ---------------------------------------
  
  output$race_graph <- renderPlot({
    return(race_graph)
  })
}

