#load libraries
library(tidyr)
library(dplyr)
library(lubridate) #handles date/time/timezone stuff. OlsonNames shows you all available timezones
library(ggplot2)
#can also do
#library(tidyr,
#dplyr,
#lubridate
#)

clean_df <- readRDS("data/clean_data.rds")
raw_detectors <- read.csv("data/raw/detectors.csv", stringsAsFactors = F) #lots of issues with time series if don't do StringsAsFactors

head(clean_df$starttime)
#now know what we want for timezones becuase of console work
clean_df$starttime <- ymd_hms(clean_df$starttime, tz = "US/Pacific")

det_st_ids <- raw_detectors |> 
  select(
    detectorid,
    stationid
  ) |> 
  distinct()

#aggregate data from detector level to station level
#join station to the detector to get mean speed, volume, occupacy. 
#to do by station need to group by the station and the 

stations_df <- clean_df |> 
  left_join(det_st_ids, by = c("detector_id" = "detectorid")) |> 
  group_by(
    stationid,
    starttime
  ) |> 
  summarise(
    mean_speed = mean(speed),
    tot_volume = sum(volume),
    mean_occ = mean(occupancy)
    ) |> 
  as.data.frame() #to keep it as a dataframe

#check structure of station_df
str(stations_df)
  
#graph it. adding features to graph so use + 
#order of adding geom_line and geom_point matters. line first, then point
sta_1059 <- stations_df |> 
  filter(stationid == 1059) |> 
  right_join(starttime_seq, by = "starttime") |> 
  ggplot(aes(x = starttime, y = tot_volume)) +
  geom_line(color = "skyblue") +
  geom_point(color = "darkblue") + 
  scale_x_datetime(
    date_breaks = "1 day",
    date_labels = "%Y-%m-%d",
    guide = guide_axis(angle = 45)
      ) +
xlab(NULL) +
theme_bw() +
geom_hline(yintercept = mean(stations_df$tot_volume),
           color = "pink")
sta_1059

#create a sequence
starttime_seq <- seq(
  from = ymd_hms("2026-02-01 00:00:00", tz = "US/Pacific"),
  to = ymd_hms("2026-02-16 00:00:00", tz = "US/Pacific"),
  by = "15 min"
) |> 
  as.data.frame()
 colnames(starttime_seq) <- c("starttime")
  
 #functions. inside the () will be the variable you want to put the variable in. X and y as example
# {everything you want the function to do }
 figure_function <- function (stid, measure){
   sta_1059 <- stations_df |> 
     filter(stationid == stid) |> 
     right_join(starttime_seq, by = "starttime") |> 
     ggplot(aes(x = starttime, y = {{measure}})) + ##have to put {{}} around measure
     geom_line(color = "skyblue") +
     geom_point(color = "darkblue", size = 0.5) + 
     scale_x_datetime(
       date_breaks = "1 day",
       date_labels = "%Y-%m-%d",
       guide = guide_axis(angle = 45)
     ) +
     xlab(NULL) +
     theme_bw()
     
   sta_1059
  }
  
 figure_function(3142, mean_speed)
 
 source("figure_function.R")
 figure_function(10755, mean_occ)
 
 
 
 
 
 
 
 
 
  