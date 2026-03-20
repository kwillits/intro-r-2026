#load libraries
library(tidyr)
library(dplyr)
library(lubridate) #handles date/time/timezone stuff. OlsonNames shows you all available timezones

#can also do
#library(tidyr,
#dplyr,
#lubridate
)

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
str(station_df)
  
#graph it
sta_1059 <- stations_df |> 
  filter(stationid == 1059) |> 
  ggplot(aes(x = starttime, y = tot_volume)) +
  geom_line() +
  geom_point()
sta_1059

  
  
  
    
  
  
  