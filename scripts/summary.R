# This file calculates summary information to be included
library(tidyverse)
library(dplyr)

# image links
# https://kalingatv.com/miscellany/covid-19-pandemic-left-147m-people-unemployed-globally/
# https://www.debt.org/2020/08/27/covid-19-unemployment-benefits/

# Working directory set inside data folder 
Unemployment<- read.csv("data/unemployment_2003-2020.csv")
#View(Unemployment)

#################### Overall Max Value##########################################

# View(summary_info)

# A function that takes in a dataset and returns a list of info about it:
summary_info <- list()
summary_info$num_observations <- nrow(Unemployment) # number of rows
summary_info$num_features <- ncol(Unemployment) # number of columns
columns <- colnames(Unemployment)


# Max unemployment rate for men
summary_info$men_highest_unemployment <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_20_Years_Over_Men), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_20_Years_Over_Men == max(	
      Unemployment_Rate_20_Years_Over_Men, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_20_Years_Over_Men) %>% 
  pull(Unemployment_Rate_20_Years_Over_Men)



# Max unemployment rate for women 
summary_info$women_highest_unemployment <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_20_Years_Over_Women), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_20_Years_Over_Women == max(	
      Unemployment_Rate_20_Years_Over_Women, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_20_Years_Over_Women)


# Max unemployment rate for Bachelor's Degree and Higher
summary_info$bachelors_and_higher_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher == max(	
      Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher, na.rm = T)
    ) %>% 
  pull(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher)


# Max unemployment rate for High School Graduates No College
summary_info$highschool_no_college_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College == max(	
      Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College, na.rm = T)
    ) %>% 
  pull(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College)


# Max unemployment rate for Less_than_a_High_School_Diploma
summary_info$less_than_highschool_diploma_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma == max(	
      Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma) %>% 
  pull(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma)

# Max unemployment rate for Some_College_or_Associate_Degree
summary_info$Some_College_or_Associate_Degree_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree == max(	
      Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree, na.rm = T)
    ) %>% 
  pull(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree)


# Max unemployment rate for Asian
summary_info$asian_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Asian), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_Asian == max(	
      Unemployment_Rate_Asian, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_Asian)


# Max unemployment rate for Black or African American 
summary_info$black_or_african_american_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Black_or_African_American), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_Black_or_African_American == max(	
      Unemployment_Rate_Black_or_African_American, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_Black_or_African_American) %>%
  pull(Unemployment_Rate_Black_or_African_American)


# Max unemployment rate for Hispanic or Latino 
summary_info$hispanic_or_latino_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Hispanic_or_Latino), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_Hispanic_or_Latino == max(	
      Unemployment_Rate_Hispanic_or_Latino, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_Hispanic_or_Latino)


# Max unemployment rate for White
summary_info$white_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_White), list(as.numeric)) %>% 
  filter(
    Unemployment_Rate_White == max(	
      Unemployment_Rate_White, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_White) %>% 
  pull(Unemployment_Rate_White)

View(summary_info)



########################## Max for each Feature in 2020 ########################

# View(summary_info_2020)

# A function that takes in a dataset and returns a list of info about it:
summary_info_2020 <- list()
summary_info_2020$num_observations <- nrow(Unemployment) # number of rows
summary_info_2020$num_features <- ncol(Unemployment) # number of columns
columns <- colnames(Unemployment)

#View(Unemployment)
# Max unemployment rate for men
summary_info_2020$men_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_20_Years_Over_Men), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_20_Years_Over_Men == max(	
      Unemployment_Rate_20_Years_Over_Men, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_20_Years_Over_Men) %>% 
  pull(Unemployment_Rate_20_Years_Over_Men)


# Max unemployment rate for women 
summary_info_2020$women_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_20_Years_Over_Women), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_20_Years_Over_Women == max(	
      Unemployment_Rate_20_Years_Over_Women, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_20_Years_Over_Women)


# Max unemployment rate for Bachelor's Degree and Higher
summary_info_2020$bachelors_and_higher_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher == max(	
      Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher)


# Max unemployment rate for High School Graduates No College
summary_info_2020$highschool_no_college_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College == max(	
      Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College)


# Max unemployment rate for Less_than_a_High_School_Diploma
summary_info_2020$less_than_highschool_diploma_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma == max(	
      Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma) %>% 
  pull(Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma)

# Max unemployment rate for Some_College_or_Associate_Degree
summary_info_2020$Some_College_or_Associate_Degree_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree == max(	
      Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree)


# Max unemployment rate for Asian
summary_info_2020$asian_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Asian), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_Asian == max(	
      Unemployment_Rate_Asian, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_Asian)


# Max unemployment rate for Black or African American 
summary_info_2020$black_or_african_american_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Black_or_African_American), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_Black_or_African_American == max(	
      Unemployment_Rate_Black_or_African_American, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_Black_or_African_American) %>%
  pull(Unemployment_Rate_Black_or_African_American)


# Max unemployment rate for Hispanic or Latino 
summary_info_2020$hispanic_or_latino_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_Hispanic_or_Latino), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_Hispanic_or_Latino == max(	
      Unemployment_Rate_Hispanic_or_Latino, na.rm = T)
  ) %>% 
  pull(Unemployment_Rate_Hispanic_or_Latino)


# Max unemployment rate for White
summary_info_2020$white_highest <- Unemployment %>%
  mutate_at(vars(Unemployment_Rate_White), list(as.numeric)) %>% 
  filter(Year == 2020) %>% 
  filter(
    Unemployment_Rate_White == max(	
      Unemployment_Rate_White, na.rm = T)
  ) %>% 
  distinct(Unemployment_Rate_White) %>% 
  pull(Unemployment_Rate_White)

#View(summary_info_2020)

#################### Group with highest rates #####################################
education_highest <- education %>%
  arrange(desc(unemployment_rate)) %>%
  head(3)

gender_highest <- gender_data %>%
  arrange(desc(unemployment_rate)) %>%
  head(3)

race_highest <- race %>%
  arrange(desc(unemployment_rate)) %>%
  head(3)
