#### Preamble ####
# Purpose: Cleaning post stratification data
# Author: Linxia Li (1005715488), Leyi Wang (1006318682), 
#         Xingnuo Zhang (1006145306),Yanlin Li (1003770305)
# Data: 3 November 2020
# Contact: tristal.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to run the previous Rscript (1,2,3) and restart R session now





############# Cleaning Post stratification data #################

# !!!!!!!!!!!!! Restart R session before running this code !!!!!!!!!!!!!

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



         