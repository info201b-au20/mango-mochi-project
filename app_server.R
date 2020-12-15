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
    text = ~ paste(
      "Date: ", date, "<br>Unemployment Rate:", unemployment_rate,
      "<br>education:", education_type
    ),
    width = 950, height = 700
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
            list(
              count = 21,
              label = "all",
              step = "year",
              stepmode = "backward"
            )
          )
        )
      )
    )
}

######## gender graph #########
build_gender_plot <- function(df, sel_year) {
  gender_fill <- c("seagreen3", "#c774db")
  gender_bor <- c("#3cb367", "mediumorchid")
  df<- df %>% 
    filter(Year == sel_year)
  
  df$unemployment_rate <- jitter(df$unemployment_rate)
  
  gender_plot <- 
    ggplot(data = df, aes(x = Month, y = unemployment_rate)) +
    geom_point(aes(color = Gender, fill = Gender), 
               alpha = .9, size = 3) + 
               #position = position_jitter(h = .1, w = 0), size = 2) + 
    labs(x = sel_year, y = "Unemployment Rate (%)") + 
    geom_line(color = "gray", alpha = .2, size = 3)
    #geom_vline(xintercept = df$Month, linetype = 3, color = "black")
  
  gender_plot <- gender_plot +
    scale_color_manual(values = gender_bor) + 
    scale_fill_manual(values = gender_fill) + 
    theme_minimal() 
  
}

######### race graph #########
build_race_plot <- function(df, race_choice, color_change) {
  df <- df %>%
    filter(racial_background == race_choice) %>% 
    rename(Race = racial_background)
  
  race_plot <- ggplot(data = df, aes(x = date, y = unemployment_rate))+
    geom_bar(aes(fill = Race), stat = "identity", fill = color_change)+
    labs(x = "Months", y = "Unemployment Rate", 
         title = "Unemployment Rate Based on Race in 2020") 
}

######## map components #########

# Another dataset
states_data <- read.csv("data/states_data.csv")
select_values <-c(
  "region", "Abbreviation",
  "Weekly UI Max in dollars",
  "Weekly UI Max w/Extra Stimulus through July 31, 2020 (dollars)",
  "UI Max duration (weeks)",
  "UI Max Duration w/Pandemic Emergency Unemployment Compensation CARES
    extension (weeks)",
  "Minimum Total Earnings Required In Base Period to Qualify for UI",
  "Number of calendar quarters w/earnings in base period needed to qualify
    for UI",
  "Minimum total earnings required outside highest earning calendar quarter
    of base period to qualify for UI",
  "Require earnings in the last two calendar quarters of the base period in
    order to qualify for UI",
  "Taxable Wage Amount", "Average Benefit Amount (August)",
  "Population Density Per Square Miles", "Population in 2018",
  "Number Homeless in 2019", "Percent Unemployed in 2018",
  "Percent Living Under the Federal Poverty Line 2018",
  "Percent At Risk for Serious Illness Due to COVID",
  "All-cause Deaths in 2018"
)

states_data_num <- states_data %>%
  select(-c(3:8))
colnames(states_data_num) <- select_values

# Making the map, View(states)
states <- map_data("state")
map_data <- states %>% left_join(states_data_num, by = "region")

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
########  create breaf data table in intro #########
unemployment_sum <- Unemployment_summary %>%
  filter(Year > 2016 | Year > 2007 & Year < 2012) %>%
  rename(Some_College = Some_College_or_Associate_Degree)

######## creating all visualizations #########

# creates the server to create and output the graph from widget inputs.
server <- function(input, output) {
  output$unemployment <- renderTable(unemployment_sum)

  output$education_graph <- renderPlotly({
    return(build_education_graph(
      education, input$hover, input$year_range,
      input$type
    ))
  })
  
  gender_data$Month <- factor(
    gender_data$Month,  
    levels = c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", 
               "Oct", "Nov", "Dec"))

  output$gender_plot <- renderPlotly({
    return(build_gender_plot(gender_data, input$sel_year))
  },)
  
  # race$racial_background <- factor(
  #   race$racial_background,  
  #   levels = c("White", "Black", "Asian", "Hispanic"))

  output$race_graph <- renderPlotly({
    return(build_race_plot(race, input$race_choice, color = input$color_change))
  })

# Map1 for State data
  output$map <- renderPlotly({
    title <- paste0(input$fill_input, " by State")

    statistics_map <- ggplot(data = map_data) +
      geom_polygon(aes(
        x = long, y = lat,
        fill = .data[[input$fill_input]], group = group
      ),
      color = "gray90", size = 0.05
      ) +
      blank_theme +
      theme(legend.position = "bottom") +
      coord_fixed(1.3) +
      labs(fill = input$fill_input, title = title)

    ggplotly(statistics_map)
  })

  output$map2 <- renderPlotly({
    title <- paste0(input$fill_input_2, " by State")

    statistics_map_2 <- ggplot(data = map_data) +
      geom_polygon(aes(
        x = long, y = lat,
        fill = .data[[input$fill_input_2]], group = group
      ),
      color = "gray90", size = 0.05
      ) +
      blank_theme +
      theme(legend.position = "bottom") +
      coord_fixed(1.3) +
      labs(fill = input$fill_input_2, title = title)

    ggplotly(statistics_map_2)
  })

# Map2 for State data
  output$states_data <- renderPlotly({

    # Store the title of the graph in a variable indicating the x/y variables
    title <- paste0(input$x_choice, " vs. ", input$y_choice)

    comparison_plot <- ggplot(states_data_num) +
      geom_point(
        mapping = aes(
          x = .data[[input$x_choice]],
          y = .data[[input$y_choice]]
        ),
        color = input$color_var,
        size = input$size
      ) +
      labs(x = input$x_choice, y = input$y_choice, title = title) +
      theme_classic() +
      theme(panel.grid.major.y = element_line(colour = "lightgrey"))

    ggplotly(comparison_plot)
  })
}

