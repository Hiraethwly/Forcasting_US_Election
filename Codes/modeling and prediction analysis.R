#### Preamble ####
# Purpose: Do modeling and prediction analysis
# Author: Linxia Li (1005715488), Leyi Wang (1006318682), 
#         Xingnuo Zhang (1006145306),Yanlin Li (1003770305)
# Data: 3 November 2020
# Contact: tristal.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to run the data cleaning Rscripts in the "Cleaning Data" folder


############## Setup workspace #############

library(broom) # Helps make the regression results tidier 
library(here) # Helps make file referencing easier. 
library(tidyverse) # Helps make programming with R easier
library(lme4)
library(knitr)
library(scales)

############## Import data ###############

# Loading in the cleaned survey Data
survey <- read.csv("survey_data.csv")

# Loading in the cleaned post stratification Data
census <- read.csv("post_census_data.csv")

# Loading in the cleaned novoteinfo Data
novoteinfo_data <- read.csv("novoteinfo_data.csv")



###### Do Bayesian information criterion model selection #########

full <- glm(vote_trump ~ sex + age + education +  state + race, data = survey, family = "binomial")

step <- step(full, direction = "backward", trace = FALSE, k = log(5200))
kable(step$anova, caption = "Table 3 - BIC")



############# Creating the logistic model ###############

model <- glm(vote_trump ~ sex + age + race, data = survey, family = "binomial")

tidied = tidy(model)

kable(tidied, caption = "Table 1 - Logistic Model")


############ Perform the post-stratification calculation #############

census$logodds_estimate <-
  model %>%
  predict(newdata = census)

census$estimate <-
  exp(census$logodds_estimate)/(1+exp(census$logodds_estimate))

yhat = census %>%
  mutate(alp_predict_prop = estimate*n)%>%
  summarise(alp_predict = sum(alp_predict_prop)/sum(n))


################## Hypothesis testing ####################

tidied %>%
  select(term, p.value) %>%
  rename(probability = p.value) %>%
  mutate(threshold = rep(0.05, 7))%>%
  mutate(significant = c(FALSE,rep(TRUE,5), FALSE)) %>%
  kable(caption = "Table 2 - Hypothesis Testing")


############# Presenting result in a piechart ################

df <- data.frame(
  group = c("Joe Biden","Donald Trump"),
  value = c((1-as.numeric(yhat))*100, (as.numeric(yhat))*100))

pie<- ggplot(df, aes(x="", y=value, fill=group))+
  geom_bar(width = 1, stat = "identity") + 
  coord_polar("y", start=0)


pie + scale_fill_brewer(palette="Blues",name = "Candidates")+
  theme(axis.text.x=element_blank())+
  geom_text(aes(y = value/3 + c(0, cumsum(value)[-length(value)]), label = percent(value/100)), size=5)  + 
  xlab("") + 
  ylab("Proportion of voting for presidential candidates") + 
  ggtitle("Graph 1 - Proportion of voting")


