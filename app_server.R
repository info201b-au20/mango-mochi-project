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
states_data <- read.csv("~/Desktop/info_201/mango-mochi-project/data/states_data.csv")
states_data_num <- states_data %>% 
  select(-c(3:8))


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
  
  
  
############# Map for State data
  output$map <- renderPlotly({
    
    title <- paste0(input$fill_input, " by State")
    
    colnames(states_data_num) <- select_values
    
    states <- map_data("state") 
    map_data <- states %>% left_join(states_data_num, by="region") 
    
    # Making the map, View(states)
    states <- map_data("state")  
    
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

  
  
}

