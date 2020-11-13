#  creates a table of summary information to be included
# load("~/Desktop/info_201/mango-mochi-project/data/Unemployment.RData")

library(tidyverse)

unemployment <- read.csv("data/unemployment.csv")
# A table of the maximum unemployment rate of each feature by year.
Unemployment_summary <- unemployment %>% drop_na()
Unemployment_summary <- unemployment %>% 
  group_by(Year) %>% 
  summarize(
    Men = max(Unemployment_Rate_20_Years_Over_Men), 
    Women = max(Unemployment_Rate_20_Years_Over_Women),
    Bachelor_Degree_or_Higher = max(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher),
    High_School_Grad = max(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College), 
    Some_High_School = max(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma), 
    Some_College_or_Associate_Degree = max(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree), 
    Asian = max(Unemployment_Rate_Asian), 
    Black_or_African_American = max(Unemployment_Rate_Black_or_African_American), 
    Hispanic_or_Latino = max(Unemployment_Rate_Hispanic_or_Latino), 
    White = max(Unemployment_Rate_White)
            ) %>% 
  arrange(desc(Year))




