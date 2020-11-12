################ Overview ############### 
# Labor Force Statistics from the Current Population Survey dataset 
# Matrixes are alphabetical, same order as github 

######## Loading data ############
# Set session to current directory, which is the data folder
# Run from line 9 to 201

# Load packages
library(readxl)
library(tidyr)
library(dplyr)

# Matrix 1-5 
Alternative_measure_of_labor_underutilization <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Alternative measure of labor underutilization U-6 - LNS13327709.xlsx")
long_Alternative_measure_of_labor_underutilization <- Alternative_measure_of_labor_underutilization %>% gather(Month, Alternative_measure_of_labor_underutilization, Jan:Dec)
  
Average_Weeks_Unemployed <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Average Weeks Unemployed - LNS13008275.xlsx")

Civilian_Labor_Force_Level <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Civilian Labor Force Level - LNS11000000.xlsx")

Civilian_Labor_Force_Participation_Rate <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Civilian Labor Force Participation Rate - LNS11300000.xlsx")

Discouraged_Workers <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Discouraged Workers - LNS15026645.xlsx")

# Matrix 6-10
Employed_Usually_Work_Full_Time <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Employed, Usually Work Full Time - LNS12500000.xlsx")

Employed_Usually_Work_Part_Time <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Employed, Usually Work Part Time - LNS12600000.xlsx")

Employment_Level <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Employment Level - LNS12000000.xlsx")

Employment_Level_Nonag_Industries_At_Work_1_34_Hrs_Usually_Work_Full_time_Bad_Weather <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Employment Level, Nonag. Industries, At Work 1-34 Hrs, Usually Work Full time, Bad Weather - LNU02033224.xlsx")

Employment_Level_Nonag_Industries_With_a_Job_not_at_Work_Bad_Weather <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Employment Level, Nonag. Industries, With a Job not at Work, Bad Weather - LNU02036012.xlsx")

# Matrix 11-15
Employment_Population_Ratio <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Employment-Population Ratio - LNS12300000.xlsx")

Marginally_Attached_to_Labor_Force <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Marginally Attached to Labor Force - LNS15026642.xlsx")

Median_Weeks_Unemployed <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Median Weeks Unemployed - LNS13008276.xlsx")

Multiple_Jobholders_Level <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Multiple Jobholders Level - LNS12026619.xlsx")

Multiple_Jobholders_as_a_Percent_of_Total_Employed <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Multiple Jobholders as a Percent of Total Employed - LNS12026620.xlsx")

# Matrix 16-20
Not_in_Labor_Force <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Not in Labor Force - LNS15000000.xlsx")

Number_Unemployed_For_15_Weeks_Over <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Number Unemployed For 15 Weeks & Over - LNS13008516.xlsx")

Number_Unemployed_For_27_Weeks_Over <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Number Unemployed For 27 Weeks & Over - LNS13008636.xlsx")

Number_Unemployed_For_5_14_Weeks <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Number Unemployed For 5-14 Weeks - LNS13008756.xlsx")

Number_Unemployed_For_Less_Than_5_weeks <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Number Unemployed For Less Than 5 weeks - LNS13008396.xlsx")

# Matrix 21-25
Persons_At_Work_Part_Time_for_Economic_Reasons <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Persons At Work Part Time for Economic Reasons - LNS12032194.xlsx")

Unemployment_Level <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level - LNS13000000.xlsx")

Unemployment_Level_Job_Leavers <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level Job Leavers - LNS13023705.xlsx")

Unemployment_Level_Job_Losers <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level Job Losers - LNS13023621.xlsx")

Unemployment_Level_Job_Losers_Not_on_Layoff <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level Job Losers Not on Layoff - LNS13025699.xlsx")

# Matrix 26-30
Unemployment_Level_Job_Losers_On_Layoff <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level Job Losers On Layoff - LNS13023653.xlsx")

Unemployment_Level_New_Entrants <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level New Entrants - LNS13023569.xlsx")

Unemployment_Level_Reentrants_To_Labor_Force <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Level Reentrants To Labor Force - LNS13023557.xlsx")


# Matrixes to use_______________________________________________________________
Unemployment_Rate_16_19_Years <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 16-19 Years - LNS14000012.xlsx")
Unemployment_Rate_16_19_Years <- Unemployment_Rate_16_19_Years %>% gather(Month, Unemployment_Rate_16_19_Years, Jan:Dec)


Unemployment_Rate_20_Years_Over_Men <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 20 Years & Over Men - LNS14000025.xlsx")
Unemployment_Rate_20_Years_Over_Men <- Unemployment_Rate_20_Years_Over_Men %>% gather(Month, Unemployment_Rate_20_Years_Over_Men, Jan:Dec)


# Matrixes 31-35
Unemployment_Rate_20_Years_Over_Women <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 20 Years & Over Women - LNS14000026.xlsx")
Unemployment_Rate_20_Years_Over_Women <- Unemployment_Rate_20_Years_Over_Women %>% gather(Month, Unemployment_Rate_20_Years_Over_Women, Jan:Dec)


Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 25 Years & Over, Bachelor's Degree and Higher - LNS14027662.xlsx")
Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher <- Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher %>% gather(Month, Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher, Jan:Dec)


Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 25 Years & Over, High School Graduates No College - LNS14027660.xlsx")
Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College <- Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College %>% gather(Month, Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College, Jan:Dec)


Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 25 Years & Over, Less than a High School Diploma - LNS14027659.xlsx")
Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma <- Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma %>% gather(Month, Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma, Jan:Dec)


Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - 25 Years & Over, Some College or Associate Degree - LNS14027689.xlsx")
Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree <- Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree %>% gather(Month, Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree, Jan:Dec)


# Matrixes 35-40
Unemployment_Rate_Asian <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - Asian - LNS14032183.xlsx")
Unemployment_Rate_Asian <- Unemployment_Rate_Asian %>% gather(Month, Unemployment_Rate_Asian, Jan:Dec)


Unemployment_Rate_Black_or_African_American <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - Black or African American - LNS14000006.xlsx")
Unemployment_Rate_Black_or_African_American <- Unemployment_Rate_Black_or_African_American %>% gather(Month, Unemployment_Rate_Black_or_African_American, Jan:Dec)


Unemployment_Rate_Hispanic_or_Latino <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - Hispanic or Latino - LNS14000009.xlsx")
Unemployment_Rate_Hispanic_or_Latino <- Unemployment_Rate_Hispanic_or_Latino %>% gather(Month, Unemployment_Rate_Hispanic_or_Latino, Jan:Dec)


Unemployment_Rate <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - LNS14000000.xlsx")
Unemployment_Rate <- Unemployment_Rate %>% gather(Month, Unemployment_Rate, Jan:Dec)


Unemployment_Rate_White <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - White - LNS14000003.xlsx")
Unemployment_Rate_White <- Unemployment_Rate_White %>% gather(Month, Unemployment_Rate_White, Jan:Dec)

# Making it into 1 big dataframe

# Making interesed columns into a vector 
Year <- Unemployment_Rate_16_19_Years$Year
Month <- Unemployment_Rate_16_19_Years$Month
Unemployment_Rate_16_19_Years <- Unemployment_Rate_16_19_Years$Unemployment_Rate_16_19_Years
Unemployment_Rate_20_Years_Over_Men <- Unemployment_Rate_20_Years_Over_Men$Unemployment_Rate_20_Years_Over_Men
Unemployment_Rate_20_Years_Over_Women <- Unemployment_Rate_20_Years_Over_Women$Unemployment_Rate_20_Years_Over_Women
Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher <- Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher$Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher
Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College <- Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College$Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College
Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma <- Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma$Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma
Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree <- Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree$Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree
Unemployment_Rate_Asian <- Unemployment_Rate_Asian$Unemployment_Rate_Asian
Unemployment_Rate_Black_or_African_American <- Unemployment_Rate_Black_or_African_American$Unemployment_Rate_Black_or_African_American
Unemployment_Rate_Hispanic_or_Latino <- Unemployment_Rate_Hispanic_or_Latino$Unemployment_Rate_Hispanic_or_Latino
Unemployment_Rate <- Unemployment_Rate$Unemployment_Rate
Unemployment_Rate_White <- Unemployment_Rate_White$Unemployment_Rate_White

# One dataframe of all the necessary columns 
Unemployment <- as.data.frame(cbind(Year, 
                      Month, 
                      Unemployment_Rate_16_19_Years, 
                      Unemployment_Rate_20_Years_Over_Men, 
                      Unemployment_Rate_20_Years_Over_Women,
                      Unemployment_Rate_25_Years_Over_Bachelor_s_Degree_and_Higher, 
                      Unemployment_Rate_25_Years_Over_High_School_Graduates_No_College, 
                      Unemployment_Rate_25_Years_Over_Less_than_a_High_School_Diploma, 
                      Unemployment_Rate_25_Years_Over_Some_College_or_Associate_Degree, 
                      Unemployment_Rate_Asian, 
                      Unemployment_Rate_Black_or_African_American, 
                      Unemployment_Rate_Hispanic_or_Latino, 
                      Unemployment_Rate, 
                      Unemployment_Rate_White
                      ))

Unemployment <- Unemployment[c(-180, -198, -216), ]
save(Unemployment, file = "Unemployment.RData")


# Should we arrange by year, how?
# Unemployment <- Unemployment %>% arrange(Year)


# Others 
# Format to make years the rowname
rownames <- Alternative_measure_of_labor_underutilization$Year
Alternative_measure_of_labor_underutilization <- Alternative_measure_of_labor_underutilization[, 2:13]
rownames(Alternative_measure_of_labor_underutilization) <- rownames
View(Alternative_measure_of_labor_underutilization)

# Format to turn the wide dataframe into long
Unemployment_Rate <- 
  read_excel("Labor Force Statistics from the Current Population Survey, 40 matrixes/Unemployment Rate - LNS14000000.xlsx")
Unemployment_Rate <- Unemployment_Rate %>% gather(Month, Unemployment_Rate, Jan:Dec)
