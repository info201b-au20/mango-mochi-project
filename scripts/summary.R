# This file calculates summary information to be included
library(tidyverse)

Unemployment <- load("~/Desktop/info_201/mango-mochi-project/data/Unemployment.RData")

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(Unemployment) # rows, 
summary_info$num_features <- ncol(Unemployment)
columns <- colnames(Unemployment)
View(columns)


# Max unemployment rate for men
summary_info$highest_unemployment_men <- Unemployment %>%
  filter(
    Unemployment_Rate_20_Years_Over_Men == max(	
      Unemployment_Rate_20_Years_Over_Men, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_20_Years_Over_Men))


# Max unemployment rate for women 
summary_info$highest_unemployment_women <- Unemployment %>%
  filter(
    Unemployment_Rate_20_Years_Over_Women == max(	
      Unemployment_Rate_20_Years_Over_Women, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_20_Years_Over_Women))


# Max unemployment rate for Bachelor's Degree and Higher
summary_info$highest_bachelors_and_higher <- Unemployment %>%
  filter(
    Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher == max(	
      Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher, na.rm = T)
    ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher))


# Max unemployment rate for High School Graduates No College
summary_info$highest_highschool_no_college <- Unemployment %>%
  filter(
    Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College == max(	
      Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College, na.rm = T)
    ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College))


# Max unemployment rate for Less_than_a_High_School_Diploma
summary_info$highest_less_than_highschool_diploma <- Unemployment %>%
  filter(
    Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma == max(	
      Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma))

# Max unemployment rate for Some_College_or_Associate_Degree
summary_info$highest_unemployment_women <- Unemployment %>%
  filter(
    Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree == max(	
      Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree, na.rm = T)
    ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree))


# Max unemployment rate for Asian
summary_info$highest_unemployment_asian <- Unemployment %>%
  filter(
    Unemployment_Rate_Asian == max(	
      Unemployment_Rate_Asian, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_Asian))


# Max unemployment rate for Black or African American 
summary_info$highest_unemployment_black_or_african_american <- Unemployment %>%
  filter(
    Unemployment_Rate_Black_or_African_American == max(	
      Unemployment_Rate_Black_or_African_American, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_Black_or_African_American))


# Max unemployment rate for Hispanic or Latino 
summary_info$highest_unemployment_hispanic_or_latino <- Unemployment %>%
  filter(
    Unemployment_Rate_Hispanic_or_Latino == max(	
      Unemployment_Rate_Hispanic_or_Latino, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_Hispanic_or_Latino))


# Max unemployment rate for White
summary_info$highest_unemployment_white <- Unemployment %>%
  filter(
    Unemployment_Rate_White == max(	
      Unemployment_Rate_White, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_White))


