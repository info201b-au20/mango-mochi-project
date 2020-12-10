library(shiny)
library(mapproj)
library(patchwork)
library(ggmap)
library(RColorBrewer)

# First Tab which includes the introduction.
intro_panel <- tabPanel(
  "Introduction",
  titlePanel("COVID-19 Unemployment Impact"),
  p("By: Tenzin, Christina, Noah, & Justin"),
  h3("Introduction"),
  img(src = "covid.jpeg",height="400", width="1400"),
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
    "This is our report of the Labor Force Statistics Dataset from the ",
    a(href = "https://data.bls.gov/cgi-bin/surveymost?ln", "U.S. Bureau of Labor
     Statistics"),
    " Current Population Survey’s Labor Force Statistics. The
     Current Population Survey (CPS) is a monthly survey of households
     conducted by the Bureau of Census for the Bureau of Labor Statistics.
     It provides a comprehensive body of data on the labor force, employment,
     unemployment, persons not in the labor force, hours of work, earnings, and
     other demographic and labor force characteristics."
  ),
  hr(),
  p(
    "Below is a unemployment table with features that reflect questions that we
  are trying to answer. Specifically, since we are primarily interested in the
  on the impact COVID had on American with different demographics, there are
  columns of sex, race and education. The table shows the max unemployment
  rate of each year. We sorted the data in descending year order so it is easy
  to compare 2020 with previous years. As you can see, the unemployment rates
  of 2020 is significantly higher than the previous years. Even compared to the
  regression in 2008, 2020 unemployment is significantly higher"
  ),
  tableOutput("unemployment")
)

# widgets for education graph
education_sidebar <- sidebarPanel(
  sliderInput(
    "year_range",
    label = "Year Range",
    # min = 2000,
    # max = 2021,
    # value = c(2000, 2021),
    min = as.Date("2000-01-01","%Y-%m-%d"),
    max = as.Date("2020-10-01","%Y-%m-%d"),
    value=c(as.Date("2000-01-01"), as.Date("2020-10-01")),
    timeFormat="%Y-%m-%d"
  ),

  radioButtons(
    "hover",
    label = "Compare Mode",
    choices = list("Off" = "closest",
                   "On" = "x"),
    selected = "closest"
  ),
  radioButtons(
    "type",
    label = "Graph Type",
    choices = list("Scatter" = "",
                   "Stack Group" = "one"),
    selected = ""
  )
)

# education graph itself
education_content <- mainPanel(
  plotlyOutput("education_graph")
)

# education tab
education_panel <- tabPanel(
  "Education Graph",

  titlePanel("Unemployment Rate for 25 Years or Older"),

  sidebarLayout(education_sidebar,
                education_content)
)

# tenz work in progress --------------------
# widgets for gender graph
gender_sidebar <- sidebarPanel( 
      p("Blah"),
      sliderInput(
        inputId = "slider",
        label = "date",
        min = 2000,
        max = 2020,
        value = c(2000)
      ),
)

# gender graph itself
gender_content <- mainPanel(
  plotOutput(outputId = "gender_graph")
)

# gender tab
gender_panel <- tabPanel(
  "Gender Graph",

  titlePanel("graph title here"),

  sidebarLayout(gender_sidebar,
                gender_content)
)
# ------------------------------------

# widgets for race graph
race_sidebar <- sidebarPanel(
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

  sidebarLayout(race_sidebar,
                race_content)
)

select_values <- c("region", "Abbreviation",
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

# Create a variable `fill_input` that stores a `selectInput()` fill variables
# assign an inputId, label, and selected value
fill_input <- selectInput(
  "fill_input",
  label = "Data Choices: ",
  choices = select_values,
  selected = "Percent Unemployed in 2018"
)

# First Tab which includes the introduction.
summary_panel <- tabPanel(
  "Summary",
  titlePanel("Summary and Takeaways"),
  plotlyOutput("map"), 
  fill_input, 
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
    "The gender gap between sexes has always been a issue throughout history.
Specifically as the result of COVID, how large, if any, is the gender gap
between men and women? Surprisingly, our graph reveals that the unemployment
rate between men and women as mostly been the same this past year.
For 5 of the past months, the unemployment rate has been less than a
1% difference. However, notably for April 2019, when COVID began taking a
significant toll on Americans, the unemployment difference was the largest
its been this past year with about a 3% difference. The gender binary colors
(pink, blue) are ovverrepresented in data, which inspired the choice of ",
    a(href = "https://blog.datawrapper.de/gendercolor/", "purple and green
 Statistics")
  ),
  hr(),
  h3("Gender Takeaway"),
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
  p("Our conclusion here blah blah blah")
)

# Create overall ui by calling the into panel and plot panel
ui <- navbarPage(
  # includeCSS("style.css"),  # this is not working for some reasons
  "COVID-19 Unemployment",
  intro_panel,
  education_panel,
  gender_panel,
  race_panel,
  summary_panel
)
