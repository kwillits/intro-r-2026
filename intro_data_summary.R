#load libraries
library(dplyr)
library(tidyr)
library(ggplot2)
library(summarytools)

# load raw data
# r is object oriented data. load objects. #tab complete will complete or give list of files with similar start
raw_15min <- read.csv("data/raw/agg_15min_data.csv", stringsAsFactors = FALSE)  #use this false when you don't know what data contains

#basic functions to look at data
# structure of data
str(raw_15min)

# preliminary data exploration
head(raw_15min) #gives first 6 rows of data
tail(raw_15min) #opposite of head, gives last 6 
summary(raw_15min) #very basic info like min, max, median, mean, max
glimpse(raw_15min) #gives variable names 
dfSummary(raw_15min)

#base R function - automatically available without loading additional packages
#raw_15min[x, y] #x=row, y = column
raw_15min[2, ]
raw_15min[ , 2]
raw_15min[2, 3]
#this is helpful when dealing with lists of lists. 
# use $ to call out a specific column
mean(raw_15min$speed)
mean(raw_15min$volume)
hist(raw_15min$volume)

#learn about filters. dplyr function previously. 
#pipe function changed. %>% is now |> and |> is part of Base R. want to take soemthing out of raw data
occ_20plus <- raw_15min |>
  filter(occupancy < 20)

occ10_sp80 <- raw_15min |> 
  filter(occupancy < 10 & speed > 80)
table(occ10_sp80$detector_id) 
