# This file calculates summary information to be included
library(tidyverse)
library(dplyr)

# load("~/Desktop/info_201/mango-mochi-project/data/Unemployment.RData")
load("~/Documents/info201/mango-mochi-project/data/Unemployment.RData")
#View(summary_info)

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(Unemployment) # number of rows
summary_info$num_features <- ncol(Unemployment) # number of columns
columns <- colnames(Unemployment)


# Max unemployment rate for men
summary_info$highest_unemployment_men <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_20_Years_Over_Men), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_20_Years_Over_Men == max(	
      Unemployment_Rate_20_Years_Over_Men, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_20_Years_Over_Men) %>% 
  pull(Unemployment_Rate_20_Years_Over_Men)



# Max unemployment rate for women 
summary_info$highest_unemployment_women <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_20_Years_Over_Women), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_20_Years_Over_Women == max(	
      Unemployment_Rate_20_Years_Over_Women, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_20_Years_Over_Women))


# Max unemployment rate for Bachelor's Degree and Higher
summary_info$highest_bachelors_and_higher <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher == max(	
      Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher, na.rm = T)
    ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher))


# Max unemployment rate for High School Graduates No College
summary_info$highest_highschool_no_college <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College == max(	
      Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College, na.rm = T)
    ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College))


# Max unemployment rate for Less_than_a_High_School_Diploma
summary_info$highest_less_than_highschool_diploma <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma == max(	
      Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma))

# Max unemployment rate for Some_College_or_Associate_Degree
summary_info$highest_unemployment_women <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree == max(	
      Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree, na.rm = T)
    ) %>% 
  pull(unique(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree))


# Max unemployment rate for Asian
summary_info$highest_unemployment_asian <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Asian), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_Asian == max(	
      Unemployment_Rate_Asian, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_Asian))


# Max unemployment rate for Black or African American 
summary_info$highest_unemployment_black_or_african_american <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Black_or_African_American), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_Black_or_African_American == max(	
      Unemployment_Rate_Black_or_African_American, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_Black_or_African_American) %>%
  pull(unique(Unemployment_Rate_Black_or_African_American))


# Max unemployment rate for Hispanic or Latino 
summary_info$highest_unemployment_hispanic_or_latino <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Hispanic_or_Latino), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_Hispanic_or_Latino == max(	
      Unemployment_Rate_Hispanic_or_Latino, na.rm = T)
  ) %>% 
  pull(unique(Unemployment_Rate_Hispanic_or_Latino))


# Max unemployment rate for White
summary_info$highest_unemployment_white <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_White), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_White == max(	
      Unemployment_Rate_White, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_White) %>% 
  pull(unique(Unemployment_Rate_White))

View(summary_info)
