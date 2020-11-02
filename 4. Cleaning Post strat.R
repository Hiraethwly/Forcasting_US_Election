############# Cleaning Post stratification data #################

# Restart R session before running this code

#### Workspace setup ####
library(haven)
library(tidyverse)



# Set up Post stratification data, grouping by age and sex

post_data <- 
  census_data %>%
  count(state,sex,age,race,education) %>%
  group_by(state,sex,age,race,education) 




# Saving the poststratification data

write_csv(post_data, "post_census_data.csv")



         