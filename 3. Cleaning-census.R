#### Preamble ####
# Purpose: Cleaning Census data
# Author: Linxia Li (1005715488), Leyi Wang (1006318682), 
#         Xingnuo Zhang (1006145306),Yanlin Li (1003770305)
# Data: 3 November 2020
# Contact: tristal.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to run the previous Rscript (1,2)




################## Cleaning Census data #####################

#### Workspace setup ####
library(haven)
library(tidyverse)
library(plyr)## Note: restart R after the cleaning process because this package may cause problem in dplyr


# Clean the data, making it the same format as survey data



census_data<-rename(census_data,c("stateicp" = "state","educd" = "education")) 


census_data$state <- revalue(census_data$state, c("alabama"= "AL",
                                                  "alaska"="AK",
                                                  "arkansas" = "AR",
                                                  "arizona"="AZ",
                                                  "california"="CA",
                                                  "colorado"="CO",
                                                  "connecticut"="CT",
                                                  "delaware"="DE",
                                                  "florida"= "FL",
                                                  "georgia"= "GA",
                                                  "hawaii" = "HI",
                                                  "idaho" = "ID",
                                                  "illinois" = "IL",
                                                  "indiana"= "IN",
                                                  "iowa"="IA",
                                                  "kansas"= "KS",
                                                  "kentucky"="KY",
                                                  "louisiana"="LA",
                                                  "maine"="ME",
                                                  "maryland"= "MD",
                                                  "massachusetts" ="MA",
                                                  "michigan" ="MI",
                                                  "minnesota"="MN",
                                                  "mississippi"="MS",
                                                  "missouri"="MO",
                                                  "montana"="MT",
                                                  "nebraska" ="NE",
                                                  "nevada"="NV",
                                                  "new hampshire"="NH",
                                                  "new jersey" ="NJ",
                                                  "new mexico" = "NM",
                                                  "new york" = "NY",
                                                  "north carolina" = "NC",
                                                  "north dakota" = "ND",
                                                  "ohio"= "OH",
                                                  "oklahoma"="OK",
                                                  "oregon" = "OR",
                                                  "pennsylvania" = "PA",
                                                  "rhode island" ="RI",
                                                  "south carolina" = "SC",
                                                  "south dakota" ="SD",
                                                  "tennessee" = "TN",
                                                  "texas" = "TX",
                                                  "utah" = "UT",
                                                  "vermont" = "VT",
                                                  "virginia" = "VA",
                                                  "washington" = "WA",
                                                  "west virginia" = "WV",
                                                  "wisconsin"="WI",
                                                  "wyoming"="WY",
                                                  "district of columbia" ="DC"
                                                  ))



census_data$education <- revalue(census_data$education, 
                                 c("bachelor's degree" = "Bachelor's degree",
                                   "some college, but less than 1 year" = "Bachelor's degree",
                                   "nursery school, preschool" = "Bachelor's degree",
                                   "some college, but less than 1 year"= "Bachelor's degree",
                                   "1 or more years of college credit, no degree" = "Completed some college/graduate, but no degree",
                                   "12th grade, no diploma" = "No high school diploma",
                                   "doctoral degree" = "Doctorate degree",
                                   "ged or alternative credential" = "High school diploma",
                                   "grade 1" = "No high school diploma",
                                   "grade 2" = "No high school diploma",
                                   "grade 3" = "No high school diploma",
                                   "grade 4" = "No high school diploma",
                                   "grade 5" = "No high school diploma",
                                   "grade 6" = "No high school diploma",
                                   "grade 7" = "No high school diploma",
                                   "grade 8" = "No high school diploma",
                                   "grade 9" = "No high school diploma",
                                   "grade 10" = "No high school diploma",
                                   "grade 11" = "No high school diploma",
                                   "kindergarten" = "No high school diploma",
                                   "master's degree" = "Masters degree",
                                   "no schooling completed" = "No high school diploma",
                                   "professional degree beyond a bachelor's degree" = "Masters degree",
                                   "regular high school diploma" = "High school diploma",
                                   "associate's degree, type not specified" = "Associate Degree"))

census_data$sex <- revalue(census_data$sex,c("male"="Male","female" = "Female"))

census_data$race<-revalue(census_data$race,c("american indian or alaska native" = "American Indian or Alaska Native",
                                                       "chinese" ="Asian or Pacific Islander" ,
                                                       "japanese"="Asian or Pacific Islander",
                                                       "other asian or pacific islander" ="Asian or Pacific Islander" ,
                                                       "other race, nec" ="Other race",
                                                       "three or more major races"="Other race",
                                                       "two major races"="Other race",
                                                       "white"= "White",
                                                       "black/african american/negro" = "Black, or African American"))





