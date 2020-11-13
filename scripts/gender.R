library(dplyr)
library(ggplot2)
library(plotly)
library(rbokeh)

# load unemployment data
unemployment <- read.csv("../data/unemployment.csv")

# create main dataframe `gender`
gender <- unemployment %>%
  select(Year, Month, 5:6) 

# add manipulated `date` col
gender <- gender %>%
  mutate(date = as.Date(paste(Year, Month, "01", sep = "-"),
                        format = "%Y-%b-%d"))

# remove `Year` and `Date` cols
gender <- gender %>%
  select(date, 3:4)

# rename cols of interest
gender <- gender %>%
  rename(men = Unemployment_Rate_20_Years_Over_Men,
         women = Unemployment_Rate_20_Years_Over_Women)

# aggregate/group gender unemployment rates
gender <- gender %>%
  gather(gender_type, unemployment_rate, 2:3) 

gender <- gender %>%
  filter(!is.na(unemployment_rate)) #%>%
  #arrange(unemployment_rate)

# create plot 
gender_all_plot <- 
  ggplot(data = gender, aes(x = date, y = unemployment_rate)) +
  geom_line(aes(color = gender_type), size = 1) + 
  labs(title = "Unemployment Rate (20 Years or Older)", 
       x = "Year", y = "Unemployment Rate")

# ----------------------------------------------------------

# create interactive plot
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
# symbol = ~gender_type,
# fill = "tozeroy"
plot_ly(
  data = gender,
  x = ~date,
  y = ~unemployment_rate,
  type = "scatter",
  alpha = .7,
  color = ~gender_type,
  mode = "markers",
  text = ~ paste("Date: ", date, "<br>Unemployment Rate:", unemployment_rate,
                 "<br>gender:", gender_type)
) %>%
  layout(
    title = "Unemployment Rate (20 Years or Older)",
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













