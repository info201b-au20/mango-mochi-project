# creates a table of summary information to be included

library(tidyverse)

# unemployment <- read.csv("data/unemployment.csv")

unemployment<- read.csv("data/unemployment_2003-2020.csv")
View(unemployment)

########################Table 1, max values#####################################

# A table of the maximum unemployment rate of each feature by year.
Unemployment_summary <- unemployment # %>% drop_na(), shouldn't be needed
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

View(Unemployment_summary)



########################Table 2, mean values####################################

# A table of the mean unemployment rate of each feature by year.
Unemployment_summary_mean <- unemployment 
Unemployment_summary_mean <- unemployment %>% 
  group_by(Year) %>% 
  summarize(
    Men = round(mean(Unemployment_Rate_20_Years_Over_Men), 1), 
    Women = round(mean(Unemployment_Rate_20_Years_Over_Women), 1),
    Bachelor_Degree_or_Higher = round(mean(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher), 1),
    High_School_Grad = round(mean(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College), 1), 
    Some_High_School = round(mean(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma), 1), 
    Some_College_or_Associate_Degree = round(mean(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree), 1), 
    Asian = round(mean(Unemployment_Rate_Asian), 1), 
    Black_or_African_American = round(mean(Unemployment_Rate_Black_or_African_American), 1), 
    Hispanic_or_Latino = round(mean(Unemployment_Rate_Hispanic_or_Latino), 1), 
    White = round(mean(Unemployment_Rate_White), 1)
  ) %>% 
  arrange(desc(Year))




# For the purpose of debugging, testing individual lines 
# unemployment_test <- unemployment %>% 
  


