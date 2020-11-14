library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)
library(rbokeh)

# load unemployment data
unemployment <- read.csv("data/unemployment_2003-2020.csv")

# select education col
race <- unemployment %>%
  select(Year, Month,Unemployment_Rate_White, 10:12)

# add date col
race <- race %>%
  mutate(date = as.Date(paste(Year, Month, "01", sep = "-"),
                        format = "%Y-%b-%d"))

# remove year and month col
race <- race %>%
  select(date, 3:6)

# rename cols so easier to read
race <- race %>%
  rename(
    White_Unemployment =
      Unemployment_Rate_White,
    Black_Unemployment =
      Unemployment_Rate_Black_or_African_American,
    Asian_Unemployment =
      Unemployment_Rate_Asian,
    Hispanic_Unemployment =
      Unemployment_Rate_Hispanic_or_Latino
  )

# reshape data so we can fit data into one graph
race <- race %>%
  gather(racial_background, unemployment_rate, 2:5)

race <- race %>%
  filter(!is.na(unemployment_rate))

race <- race %>%
  filter(date >= '2020-01-01')

sapply(race, typeof)


# create plot with ggplot
ggplot(data = race, aes(x = date, y = unemployment_rate)) +
  geom_bar(aes(fill = racial_background),stat = "identity") +
  ggtitle("Unemployment based on race 2020") 
  

# # Create an interactive plot of the education data set using Bokeh
# figure(
#   data = education,                          # data for the figure
#   title = "Unemployment Rate for 25 Years or Older" # title for the figure
# ) %>%
#   ly_points(
#     date,    # column for the x-axis (without quotes!)
#     unemployment_rate,    # column for the y-axis (without quotes!)
#     color = education_type # column for the color encoding (without quotes!)
#   ) %>%
#   x_axis(
#     label = "Date",       # label for the axis
#     # number_formatter = "printf", # formatter for each axis tick
#     # format = "%s cm",            # specify the desired tick labeling
#   ) %>%
#   y_axis(
#     label = "Unemployment Rate",       # label for the axis
#     # number_formatter = "printf", # formatter for each axis tick
#     # format = "%s cm",            # specify the desired tick labeling
#   )

chart_type <- list(
  x = 1.35,
  y = .7,
  buttons = list(
    list(
      method = "update",
      args = list(list("stackgroup" = "")),
      label = "Scatter"
    ),
    
    list(
      method = "update",
      args = list(list("stackgroup" = "one")),
      label = "Stackgroup"
    )
  )
)

hover <- list(
  x = 1.65,
  y = .7,
  buttons = list(
    list(
      method = "relayout",
      args = list(list("hovermode" = "closest")),
      label = "Hover off"
    ),
    list(
      method = "relayout",
      args = list(list("hovermode" = "x")),
      label = "Hover on "
    )
  )
)

# Create interactive plot with plotly
# symbol = ~education_type,
# fill = "tozeroy"
race_graph <- plot_ly(
  data = race,
  x = ~date,
  y = ~unemployment_rate,
  type = "scatter",
  alpha = .7,
  color = ~racial_background,
  mode = "markers",
  text = ~ paste("Date: ", date, "<br>Unemployment Rate:", unemployment_rate,
                 "<br>education:", racial_background)
) %>%
  layout(
    title = "Unemployment Rate for 25 Years or Older",
    updatemenus = list(chart_type, hover),
    yaxis = list(title = "Unemployment Rate (%)"),
    xaxis = list(
      title = "Date",
      type = "date",
      range = c("2000-01-01", "2020-10-01"),
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
          list(step = "all")
        )
      ),
      rangeslider = list(type = "date")
    )
  )

