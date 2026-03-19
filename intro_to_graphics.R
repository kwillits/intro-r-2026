# load libraries
library(dplyr)
library(ggplot2)
library(tidyr) #sometimes forget which are from which library, so load all is good
library(plotly)

# load clean datashet
clean_df <- readRDS("data/clean_data.rds")

#create a graph. aes means asthetic. 
speed_occ_fig <- clean_df |> 
  ggplot(aes(x = speed, y = occupancy, color = as.factor(detector_id))) + 
  geom_point()
#can leave blank
speed_occ_fig

#speed vs volume
speed_vol_fig <- clean_df |> 
  ggplot(aes (x = speed, y = volume, color = as.factor(detector_id))) +
  geom_point()
speed_vol_fig

#clean df$detector)id 
#think of a pipe as a step. step 1 - call object. step 2 - filter. step 3- think I wnat another filter. now I want a graph
#now start GGplot to graph. need to add layers in Ggplot. + not pipe. Not doing next step, adding layers 
speed_occ_fig2 <- clean_df |>
  filter(detector_id <101100) |> 
  filter (speed >40 ) |>
  ggplot(aes (x = speed, y = volume, color = as.factor(detector_id))) +
  geom_point()
speed_occ_fig2

#pick another type of figure. Boxplot of detector id and speed
speed_det_fig3 <- clean_df |>
  filter(detector_id <101100) |> 
  filter (speed >40 ) |>
  ggplot(aes (x = detector_id, y = speed, color = as.factor(detector_id))) +
  geom_boxplot()
speed_det_fig3


#boxplot of speeds greater than 
speed_det_fig3 <- clean_df |>
  filter(detector_id <101100) |> 
    ggplot(aes (x = detector_id, y = speed, color = as.factor(detector_id))) +
  geom_boxplot()
speed_det_fig3

#added in plotly library above

det_speed_figly <- ggplotly(speed_det_fig3) #run the object drom above thru ggplotly
det_speed_figly
