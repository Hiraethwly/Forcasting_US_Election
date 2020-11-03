#### Preamble ####
# Purpose: Cleaning Survey data
# Author: Linxia Li (1005715488), Leyi Wang (1006318682), 
#         Xingnuo Zhang (1006145306),Yanlin Li (1003770305)
# Data: 3 November 2020
# Contact: tristal.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the data and save it into the 
#   same folder as this document






#### Workspace setup ####
library(haven)
library(tidyverse)


############## Creating Survey data ################

# Read in the raw data
survey_raw_data <- read_dta("ns20200625.dta")
# Add the labels
survey_raw_data <- labelled::to_factor(survey_raw_data)

# Select variaboes of interests
survey_data <- 
  survey_raw_data %>% 
  select(#interest,
    #registration,
    #vote_2016,
    #vote_intention,
    vote_2020,
    #ideo5,
    #employment,
    #foreign_born,
    gender,
    #census_region,
    #hispanic,
    race_ethnicity,
    #household_income,
    education,
    state,
    #congress_district,
    age
  )


# Set up response variable, delete responses which are not choosing Donald Trump
# or Joe Biden for vote_2020.

novoteinfo_data <-
  survey_data%>%
  filter(vote_2020 != "Donald Trump")%>%
  filter(vote_2020 != "Joe Biden")

survey_data<-
  survey_data %>%
  filter(vote_2020 %in% c("Donald Trump","Joe Biden"))%>%
  mutate(vote_trump = 
           ifelse(vote_2020=="Donald Trump", 1, 0))


# Save the deleted data because of response variable

write_csv(novoteinfo_data, "novoteinfo_data.csv")


############## Creating Census data ###################


# Input data
census_raw_data <- read_dta("usa_00001.dta")


# Add the labels
census_raw_data <- labelled::to_factor(census_raw_data)

# Select some variables of interest

census_data <- 
  census_raw_data %>% 
  select(#region,
    stateicp,
    sex, 
    age, 
    race, 
    #hispan,
    #marst, 
    #bpl,
    citizen,
    educd
    #labforce
  )



census_data$age <- as.integer(census_data$age)

# Filter the variables according to voting 
# See https://www.usa.gov/who-can-vote for detail

census_data <- 
  census_data %>% 
  mutate(age = age+2) %>%
  filter(age >=18)%>%
  filter(citizen != "n/a")%>%
  filter(citizen != "not a citizen"  )%>%
  filter(citizen != "not a citizen, but has received first papers" )%>%
  filter(citizen != "foreign born, citizenship status not reported")

