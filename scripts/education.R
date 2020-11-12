library(dplyr)
library(ggmap)
library(ggplot2)
library(tidyverse)
library(stringr)
library("plotly")
library("rbokeh")

# load unemployment data
unemployment <- read.csv("../data/unemployment.csv")

# select education col
education <- unemployment %>% 
  select(Year, Month, 7:10)

# add date col
education <- education %>%
  mutate(date = as.Date(paste(Year, Month, "01", sep="-" ),format="%Y-%b-%d"))

# remove year and month col
education <- education %>% 
  select(date, 3:6) 

education <- education %>% 
  drop_na()

# rename cols so easier to read
education <- education %>% 
  rename(
    Bachelor_Degree_or_Higher = Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher,
    High_School_Grad = Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College,
    Some_High_School = Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma,
    Some_College_or_Associate_Degree = Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree
  )

# reshape data so we can fit data into one graph
education <- education %>% 
  gather(education_type, unemployment_rate, 2:5)

# create plot with ggplot
ggplot(data = education, aes(x = date, y = unemployment_rate))+
  geom_line(aes(color = education_type), size = 1)

# filter for only 2019-2020 data
only_2019_2020 <- education %>% 
  filter(str_sub(date, 1, 4) >= 2019)

# create plot of just 2019-2020
ggplot(data = only_2019_2020, aes(x = date, y = unemployment_rate))+
  geom_line(aes(color = education_type), size = 1)

# Create an interactive plot of the education data set using Bokeh
figure(
  data = education,                          # data for the figure
  title = "Unemployment Rate for 25 Years or Older" # title for the figure
) %>%
  ly_points(
    date,    # column for the x-axis (without quotes!)
    unemployment_rate,    # column for the y-axis (without quotes!)
    color = education_type # column for the color encoding (without quotes!)
  ) %>%
  x_axis(
    label = "Date",       # label for the axis
    # number_formatter = "printf", # formatter for each axis tick
    # format = "%s cm",            # specify the desired tick labeling
  ) %>%
  y_axis(
    label = "Unemployment Rate",       # label for the axis
    # number_formatter = "printf", # formatter for each axis tick
    # format = "%s cm",            # specify the desired tick labeling
  )

chart_type <- list(
  x = 1.25,
  y = .7,
  type = "buttons",
  buttons = list(
    list(method = "update",
         args = list(list("stackgroup" = "")),
         label = "No Area"),
    
    list(method = "update",
         args = list(list("stackgroup" = "one")),
         label = "stackgroup"),
    list(method = "relayout",
         args = list(list("hovermode" = "x")),
         label = "hover on "),
    list(method = "relayout",
         args = list(list("hovermode" = "closest")),
         label = "hover off")
  ))

# Create interactive plot with plotly
plot_ly(
  data = education,
  x = ~date,
  y = ~unemployment_rate,
  type = "scatter", 
  alpha = .7, 
  color = ~education_type,
  mode = "markers",
  # fill = "tozeroy"
  text = ~paste("Date: ", date, '<br>Unemployment Rate:', unemployment_rate, '<br>education:', education_type)
) %>%
  layout(
    title = "Unemployment Rate for 25 Years or Older",
    xaxis = list(title = "Date", type = "date"),
    yaxis = list(title = "Unemployment Rate"),
    updatemenus = list(chart_type)
  )






