#### Preamble ####
# Purpose: Cleaning Survey data
# Author: Linxia Li (1005715488), Leyi Wang (1006318682), 
#         Xingnuo Zhang (1006145306),Yanlin Li (1003770305)
# Data: 3 November 2020
# Contact: tristal.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to run the previous Rscript (1)




############# Cleaning  Survey Data ##############

#### Workspace setup ####
library(haven)
library(tidyverse)
library(plyr) ## Note: restart R after the cleaning process because of this package

# Clean the survey data, making it the same format as census data

survey_data$education <-revalue(survey_data$education,
                                c("College Degree (such as B.A., B.S.)"="Bachelor's degree",
                                 "Completed some college, but no degree" ="Completed some college/graduate, but no degree",
                                 "Completed some graduate, but no degree" ="Completed some college/graduate, but no degree",
                                 "Completed some high school" =  "No high school diploma",
                                  "Other post high school vocational training"= "High school diploma",
                                 "Middle School - Grades 4 - 8"="No high school diploma",
                                 "3rd Grade or less"= "No high school diploma",
                                 "High school graduate" = "High school diploma"))

survey_data$race_ethnicity<-revalue(survey_data$race_ethnicity,
                                    c("Asian (Asian Indian)" = "Asian or Pacific Islander",
                                      "Asian (Chinese)"="Asian or Pacific Islander",
                                      "Asian (Filipino)"="Asian or Pacific Islander",
                                      "Asian (Japanese)"="Asian or Pacific Islander",
                                      "Asian (Korean)" ="Asian or Pacific Islander" ,
                                      "Asian (Other)" ="Asian or Pacific Islander" ,
                                      "Asian (Vietnamese)" = "Asian or Pacific Islander",
                                      "Pacific Islander (Guamanian)"= "Asian or Pacific Islander",
                                      "Pacific Islander (Native Hawaiian)" = "Asian or Pacific Islander",
                                      "Pacific Islander (Other)" ="Asian or Pacific Islander",
                                      "Pacific Islander (Samoan)" ="Asian or Pacific Islander",
                                      "Some other race" = "Other race"))




survey_data<-rename(survey_data,c("gender"="sex", "race_ethnicity" = "race" )) 

# Saving the survey data as a csv file

write_csv(survey_data, "survey_data.csv")






