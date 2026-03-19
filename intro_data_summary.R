#load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(summarytools)

# load raw data
# r is object oriented data. load objects. #tab complete will complete or give list of files with similar start
raw_15min <- read.csv("data/raw/agg_15min_data.csv", stringsAsFactors = FALSE)  #use this false when you don't know hwat daata contains

#basic functions to look at data
# structure of data
str(raw_15min)

# preliminary data exploration
head(raw_15min) #gives first 6 rows of data
tail(raw_15min) #opposite of head, gives last 6 
summary(raw_15min) #very basic info like min, max, median, mean, max
glimpse(raw_15min) #gives variable names 
dfSummary(raw_15min)
