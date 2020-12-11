library(tidyverse)
library(dplyr)
library(plotly)
library(shiny)
library(ggplot2)
library(maps)
library(mapproj)
library(patchwork)
library(ggmap)
library(RColorBrewer)

source("scripts/education.R")
source("scripts/gender.R")
source("scripts/race.R")
source("scripts/table_summary.R")
# Another dataset 
states_data <- read.csv("data/states_data.csv")
states_data_num <- states_data %>% 
  select(-c(3:8))
colnames(states_data_num) <- select_values

# Making the map, View(states)
states <- map_data("state") 
map_data <- states %>% left_join(states_data_num, by="region") 


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
      width=950, height=700
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

#### tenz work in progress -------------------------------------------------
# need to add rangeslider, or plotly buttons for data range 

build_gender_plot <- function(df, hover, year, type) {
  gender_plot <- plot_ly(
    data = df,
    x = ~date,
    y = ~unemployment_rate,
    type = "scatter",
    alpha = .9,
    color = ~gender_type,
    mode = "markers",
    stackgroup = type,
    text = ~ paste("Date: ", date, "<br>Unemployment Rate:", unemployment_rate,
                   "<br>gender:", gender_type),
    width=950, height=700) %>%
    layout(
      hovermode = hover,
      yaxis = list(title = "Unemployment Rate (%)"),
      xaxis = list(
        title = "Date",
        type = "date",
        range = year,
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
            list(count = 21,
                 label = "all",
                 step = "year",
                 stepmode = "backward")
          )
        )
      )
    )
}

# rough draft code for date range plotly buttons
# updatemenus = list(
# list(
#   active = -1,
#   type = 'buttons',
#   buttons = list(
#     list(
#       label = 'COVID',
#       method = "relayout",
#       args = list(list(xaxis = list(range = as.POSIXct(c("2020-03-11","2020-09-01"), origin= "2020-09-01"),
#                                     rangeselector = rangeselector,
#                                     rangeslider = list(type = "date"))))), 
#     list(
#       label = '2001 Recession',
#       method = "relayout",
#       args = list(list(xaxis = list(range = as.POSIXct(c("2001-03-01","2001-11-31"), origin= "2020-09-01"),
#                                     rangeselector = rangeselector,
#                                     rangeslider = list(type = "date"))))),
#     list(
#       label = 'Great Recession',
#       method = "relayout",
#       args = list(list(xaxis = list(range = as.POSIXct(c("2007-12-01","2009-06-31"), origin= "2020-09-01"),
#                                     rangeselector = rangeselector,
#                                     rangeslider = list(type = "date")))))

# -----------------------------------------------------------------------

unemployment_sum <- Unemployment_summary %>%
  filter(Year > 2016 | Year > 2007 & Year < 2012) %>% 
  rename(Some_College = Some_College_or_Associate_Degree)


# Blank Map, making better for the map using blank_theme template 
# (cleaning lines in the map)
blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(), # remove axis lines
    axis.text = element_blank(), # remove axis labels
    axis.ticks = element_blank(), # remove axis ticks
    axis.title = element_blank(), # remove axis titles
    plot.background = element_blank(), # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank() # remove border around plot
  )

select_values <- 
  c("region", "Abbreviation",
    "Weekly UI Max in dollars", 
    "Weekly UI Max w/Extra Stimulus through July 31, 2020 (dollars)", 
    "UI Max duration (weeks)", 
    "UI Max Duration w/Pandemic Emergency Unemployment Compensation CARES extension (weeks)", 
    "Minimum Total Earnings Required In Base Period to Qualify for UI", 
    "Number of calendar quarters w/earnings in base period needed to qualify for UI", 
    "Minimum total earnings required outside highest earning calendar quarter of base period to qualify for UI", 
    "Require earnings in the last two calendar quarters of the base period in order to qualify for UI", 
    "Taxable Wage Amount", "Average Benefit Amount (August)", 
    "Population Density Per Square Miles", "Population in 2018", 
    "Number Homeless in 2019", "Percent Unemployed in 2018", 
    "Percent Living Under the Federal Poverty Line 2018", 
    "Percent At Risk for Serious Illness Due to COVID", 	
    "All-cause Deaths in 2018")


##### creates the server to create and output the graph from widget inputs.
server <- function(input, output) {
  output$unemployment <- renderDataTable(unemployment_sum)

  output$education_graph <- renderPlotly({
    return(build_education_graph(education, input$hover, input$year_range,
                         input$type))
  })
  
  output$gender_plot <- renderPlotly({
    return(build_gender_plot(gender, input$hover, input$year,
                                 input$type))
  })
  
  output$race_graph <- renderPlot({
    return(race_graph)
  })

  
############# Map for State data
  output$map <- renderPlotly({
    
    title <- paste0(input$fill_input, " by State")
    
    statistics_map <- ggplot(data = map_data) + 
      geom_polygon(aes(x = long, y = lat, 
                       fill = map_data[[input$fill_input]], group = group), 
                   color = "gray90", size = 0.05) +
      blank_theme +
      theme(legend.position = "bottom") +
      coord_fixed(1.3) +
      labs(fill = input$fill_input, title = title)
    
    ggplotly(statistics_map)
    
  })   
  
  output$map2 <- renderPlotly({
    
    title <- paste0(input$fill_input_2, " by State")
    
    statistics_map_2 <- ggplot(data = map_data) + 
      geom_polygon(aes(x = long, y = lat, 
                       fill = map_data[[input$fill_input_2]], group = group), 
                   color = "gray90", size = 0.05) +
      blank_theme +
      theme(legend.position = "bottom") +
      coord_fixed(1.3) +
      labs(fill = input$fill_input_2, title = title)
    
    ggplotly(statistics_map_2)
    
  })  
  
  
############# Map for State data
output$states_data <- renderPlotly({
  
  # Store the title of the graph in a variable indicating the x/y variables
  title <- paste0(input$x_choice, " vs. ", input$y_choice)
  
  comparison_plot <- ggplot(states_data_num) +
    geom_point(mapping = aes(x = states_data_num[[input$x_choice]], 
                             y = states_data_num[[input$y_choice]]), , 
               color = input$color_var, 
               size = input$size) + 
    labs(x = input$x_choice, y = input$y_choice, title = title) +
    theme_classic() +
    theme(panel.grid.major.y = element_line(colour = "lightgrey"))
    
  ggplotly(comparison_plot)
  
  
})   
  

  
  
}

