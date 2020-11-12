#  creates a table of summary information to be included

Unemployment <- Unemployment %>% 
  group_by(Year) %>% 
  summarize(max = max(Unemployment_Rate_20_Years_Over_Men))