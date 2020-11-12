#  creates a table of summary information to be included
# load("~/Desktop/info_201/mango-mochi-project/data/Unemployment.RData")

# A table of the maximum unemployment rate of each feature by year. 
library(tidyverse)
Unemployment_summary <- Unemployment %>% 
  group_by(Year) %>% 
  summarize(
    men = max(Unemployment_Rate_20_Years_Over_Men), 
    women = max(Unemployment_Rate_20_Years_Over_Women),
    bachelors = max(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher),
    high_school = max(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College), 
    less_than_highschool = max(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma), 
    some_college = max(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree), 
    asian = max(Unemployment_Rate_Asian), 
    black_or_african_american = max(Unemployment_Rate_Black_or_African_American), 
    hispanic_or_latino = max(Unemployment_Rate_Hispanic_or_Latino), 
    white = max(Unemployment_Rate_White)
            )