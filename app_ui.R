######## home page #########

# First Tab which includes the introduction.
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("COVID-19 Unemployment Impact"),
  p("By: Tenzin, Christina, Noah, & Justin"),
  img(src = "covid.jpeg", height = "400", width = "100%"),
  h3("Introduction"),
  p(
    "In the midst of political, social, and economic polarization induced by
  COVID outbreaks, it would be interesting to explore the new dynamics of the
  labor force. Particularly, we will focus on the intersecting components of ",
    strong("employment and recession: "),
    "gender, race, age, income level, etc.
  By doing so, we hope to discover and understand the stories behind the
  numbers."
  ),
  p(
    "Our report use datasets from two different sources. The first one is the
    Labor Force Statistics Dataset from the ",
    a(href = "https://data.bls.gov/cgi-bin/surveymost?ln", "U.S. Bureau of Labor
     Statistics"),
    " Current Population Survey’s Labor Force Statistics. The
     Current Population Survey (CPS) is a monthly survey of households
     conducted by the Bureau of Census for the Bureau of Labor Statistics.
     It provides a comprehensive body of data on the labor force, employment,
     unemployment, persons not in the labor force, hours of work, earnings, and
     other demographic and labor force characteristics."
  ),
  p(
    "The second dataset is from the ", a(
      href =
        "https://www.openicpsr.org/openicpsr/project/119446/version/V38/view?path=/openicpsr/119446/fcr:versions/V38",
      "COVID-19 US State Policy Database", .noWS = "after"
    ),
    ". The data was collected from a variety of sources including state
    mandates, orders, and official governor press releases. It was then compiled
    by researchers at the Boston University School of Public Health. The dataset
    includes state level data on policies on unemployment insurances,
    unemployment percentage, percent under poverty line, and more. This will
    allow analysis of correlation between unemployment verses other
    socioeconomic factors. "
  ),
  hr(),
  p(
    "Below is a portion of unemployment table with features that reflect
    questions that we are trying to answer. Specifically, since we are primarily
    interested in the on the impact COVID had on American with different
    demographics, there are columns of sex, race and education. The table shows
    the max unemployment rate of each year. We sorted the data in descending
    year order so it is easy to compare 2020 with previous years. As you can
    see, the unemployment rates of 2020 is significantly higher than the
    previous years. Even compared to the regression in 2008, 2020 unemployment
    is significantly higher."
  ),
  tableOutput("unemployment")
)

######## education page #########

# widgets for education graph
education_sidebar <- sidebarPanel(
  p(
    strong("How does unemployment rates correlate with education level?"),
    br(),
    "In this graph we can explore the effects of education level on unemployment
    rates."
  ),
  p("Choose the from the time ranges and other display options to see how the
    unemployment rates differ for the education levels of Some High School,
    High School Graduate, Some College or Associate Degree, and Bachelor Degree
    or Higher."),
  sliderInput(
    "year_range",
    label = "Year Range",
    min = as.Date("2000-01-01", "%Y-%m-%d"),
    max = as.Date("2020-10-01", "%Y-%m-%d"),
    value = c(as.Date("2000-01-01"), as.Date("2020-10-01")),
    timeFormat = "%Y-%m-%d"
  ),
  radioButtons(
    "hover",
    label = "Compare Mode",
    choices = list(
      "Off" = "closest",
      "On" = "x"
    ),
    selected = "closest"
  ),
  radioButtons(
    "type",
    label = "Graph Type",
    choices = list(
      "Scatter" = "",
      "Stack Group" = "one"
    ),
    selected = ""
  )
)

# education graph itself
education_content <- mainPanel(
  plotlyOutput("education_graph"),
)

# education tab
education_panel <- tabPanel(
  "Education Graph",
  titlePanel("Unemployment Rate for 25 Years or Older"),
  sidebarLayout(
    education_sidebar,
    education_content
  )
)

######## gender page #########

# variable for widget Year choices
list_years <- c(
  2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011,
  2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020
)

# widgets for gender graph
gender_sidebar <- sidebarPanel(
  p(
    strong("How does unemployment rates correlate with different genders?"),
    br(), "In this graph we can explore the unemployment rates for men
    and women throughout the years."
  ),
  p("Choose from different year options to see how the 
    unemployment rates differ for men and women. "),

  selectInput(
    "sel_year",
    label = "Select Year",
    choices = list_years,
    selected = "2020"
  ),

  p("We hope this visualization simplifies the recession trends and helps you see interesting differences. 
  Some notes about our graph: the overrepresentation of gender binary colors in data (pink, blue) inspired the choice of",
    a(href = "https://blog.datawrapper.de/gendercolor/", "purple and green!"), "For the months with only one point, the 
    unemployment rate was the same for men and women."
    ),
  
)

# gender graph itself
gender_content <- mainPanel(
  plotlyOutput("gender_plot")
)

# gender tab
gender_panel <- tabPanel(
  "Gender Graph",
  titlePanel("Unemployment Rate (20 Years or Older)"),
  sidebarLayout(
    gender_sidebar,
    gender_content
  )
)

######## race page #########

# widgets for race graph
race_sidebar <- sidebarPanel(
  p(
    strong("How does unemployment rates correlates with race?"),
    br(), "In this graph we can explore the relations between race and
    unemployment rates."
  ),
  p("Choose the from........... to see how the
    unemployment rates differ for the different races (Asian, Black, Hispanic,
    White).")
  # your widget(s) here
)

# race graph itself
race_content <- mainPanel(
  plotOutput("race_graph")
)

# race tab
race_panel <- tabPanel(
  "Race Graph",
  titlePanel("graph title here"),
  sidebarLayout(
    race_sidebar,
    race_content
  )
)

######## map page #########

# widgets for map
select_values <- c(
  "region", "Abbreviation",
  "Weekly UI Max in dollars",
  "Weekly UI Max w/Extra Stimulus through July 31, 2020 (dollars)",
  "UI Max duration (weeks)",
  "UI Max Duration w/Pandemic Emergency Unemployment Compensation CARES
  extension (weeks)",
  "Minimum Total Earnings Required In Base Period to Qualify for UI",
  "Number of calendar quarters w/earnings in base period needed to qualify
  for UI",
  "Minimum total earnings required outside highest earning calendar quarter of
  base period to qualify for UI",
  "Require earnings in the last two calendar quarters of the base period in
  order to qualify for UI",
  "Taxable Wage Amount", "Average Benefit Amount (August)",
  "Population Density Per Square Miles", "Population in 2018",
  "Number Homeless in 2019", "Percent Unemployed in 2018",
  "Percent Living Under the Federal Poverty Line 2018",
  "Percent At Risk for Serious Illness Due to COVID",
  "All-cause Deaths in 2018"
)

# Create a variable `fill_input` that stores a `selectInput()` fill variables
# assign an inputId, label, and selected value
fill_input <- selectInput(
  "fill_input",
  label = "Map 1 Data Choices: ",
  choices = select_values,
  selected = "Percent Unemployed in 2018"
)

fill_input_2 <- selectInput(
  "fill_input_2",
  label = "Map 2 Data Choices: ",
  choices = select_values,
  selected = "Weekly UI Max in dollars"
)

# widgets for state page
map_sidebar <- sidebarPanel(
  # your widget(s) here
  p(
    strong("How does unemployment rates at the state level correlate with other
           factors?"), br(),
    "In this graph we can explore how unemployment rates, Unemployment
    Insurance (UI) policies, population, and other factors relates."
  ),
  br(),
  h5("Data by State:"),
  p("Choose the different data options to visualize the difference in data
    between states and with in each state."),
  fill_input,
  fill_input_2,
  br(),
  h5("Dataset Correlations:"),
  p("Use the x and y options to compare and find correlations between the
    different datasets."),
  x_input <- selectInput(
    "x_choice",
    label = "X Variable",
    choices = select_values[2:19],
    selected = "Abbreviation"
  ),
  y_input <- selectInput(
    "y_choice",
    label = "Y Variable",
    choices = select_values[3:19],
    selected = "Percent Unemployed in 2018"
  ),

  color_var <- selectInput(
    "color_var",
    label = "Color",
    choices = brewer.pal(8, "Set2"),
    selected = "#8DA0CB"
  ),

  size_input <- sliderInput(
    "size",
    label = "Size of point", min = 1, max = 10, value = 2
  )
)

# display maps
map_content <- mainPanel(
  fluidRow(
    splitLayout(
      cellWidths = c("50%", "50%"), plotlyOutput("map"),
      plotlyOutput("map2")
    )
  ),
  # plotlyOutput("map"),
  plotlyOutput("states_data")
)

# map tab
map_panel <- tabPanel(
  "State Data Graph",
  titlePanel("Comparision of the Unemployment Data vs. Other State Data"),
  sidebarLayout(
    map_sidebar,
    map_content
  )
)

######## summary page  #########

# summary tab 
summary_panel <- tabPanel(
  "Summary",
  titlePanel("Summary and Takeaways"),
  img(src = "unemployment.jpg", height = "400", width = "100%"),
  # another option for img: covid-19-unemployment.jpg, can also find more
  h3("Education Takeaway"),
  p(
    "During times like these, with vast unemployment rates, many students like
us are struggling with school. But does education level really impact one's
chances of being unemployed? The education graph sought to answer that
problem. As we can see, there was a significant spike in unemployment in
2020 based on education levels. Notably, those with lower education levels,
some high school or just high school, were hit the worst by COVID-19 as their
unemployment rates skyrocketed. On the other hand, those with higher
education, were not as significantly impacted."
  ),
  hr(),
  h3("Gender Takeaway"),
  p(
    "
    The gender gap between sexes has always been a issue throughout history.
    Specifically as the result of COVID, how large, if any, is the gender gap
    between men and women concerning unemployment? Surprisingly, our graph reveals no profound
    discrepancies during this year. For the past 5 months, the unemployment rate has stayed below a 3% difference.
    However, we discovered something new: that the COVID recession deviates from 'regular' recession trends. Notably in 
    April 2020, when COVID began taking a significant toll, the unemployment rate for women began surpassing 
    men; the opposite of what happened during the Great Recession (2007-2009). We believe this emphasizes 
    workplace inequality in a different light due to possible factors including: childcare, volatility of work hours, 
    occupational flexibility, and gender norms."
  ),
  hr(),
  h3("Race Takeaway"),
  p(
    "With unemployment rates reaching massive levels due to the pandemic, it is
    important to pinpoint whether or not certain racial demographics have been
    affected differently. This graph reveals that the unemployment spike that
    happened as a cause of COVID-19 had a tremendous impact on all racial
    backgrounds, with minorities being affected about 2% more and African
    Americans being the furthest from reaching their pre-corona levels."
  ),
  hr(),
  h3("Other Takeaways"),
  p(
    "Some quick information that we extracted from our summary information
functions was that women had a higher max unemployment rate of 15.5% versus
males with 13%. We also found that among people with different education
levels, those those with less education (less than high school diploma or
only highschool diploma) had higher max unemployment rates, 17.3% to 21.2%
than those with higher education (some college or bachelors and higher),
8.4% to 15%. Finally among different races, hispanic/latino Americans had the
highest max unemployment rate of 18.9% while white Americans had the lowest
unemployment rate of just 14.2%. Interestingly all these max unemployment
rates were in 2020, showing the devastating impact COVID has had on all
Americans."
  ),
  hr(),
  h3("Conclusion"),
  p("As students living through the COVID pandemic, we have seen and experienced 
  significant changes to our daily lives. We saw this project as an opportunity to dig deeper into 
  the affect of COVID on the dynamics of the labor force; to show that behind all
  these numbers, there are certain groups facing the most adverse impacts. The COVID recession is 
  not over yet and we hope that our analysis helps other gain simple and valuable insight.")
)

######## overall ui #########

# combine all pages by calling the intro panel and plot panels
ui <- navbarPage(
  theme = "style.css",
  "COVID-19 Unemployment",
  intro_panel,
  education_panel,
  gender_panel,
  race_panel,
  map_panel,
  summary_panel
)
