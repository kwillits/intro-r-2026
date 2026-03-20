library(dplyr)
library(tidyr)
library(leaflet)
library(sf)
library(tigris)

#where are all of the stations
#import dataset.
raw_stations <- read.csv("data/raw/stations.csv", stringsAsFactors = F)

stations <- raw_stations |> 
  filter(end_date == "") |> 
  select(
    stationid, 
    locationtext,
    lon,
    lat,
    milepost,
    agency
  )

stations_map <- stations |> 
  filter(lat != -1) |> 
  leaflet() |>  #leaflet is also layer building. rely on pipe function instead of +
  addProviderTiles(providers$CartoDB.Positron) |>  #need to decide how to plot the points. circle, triangle
  addCircleMarkers(
    lng = stations$lon, 
    lat = stations$lat,
    color = "orange",
    radius = 2,
    popup = paste("Stationid: ", stations$stationid, "<br>",
                  "Description: ", stations$locationtext, "<br>",
                  "Agency: ", stations$agency, "<br>",
                  "MP", stations$milepost)
  )
  
stations_map

#tigris is a good rsource. LIbrary of datafiles. 
#want to see counties in Viriginia
va_counties <- counties(state = "VA")
va_counties <- st_transform(va_counties, crs = '+proj=longlat +datum=WGS84')
  


#interested in mapping all of the counites
va_county_map <- va_counties |> 
  leaflet() |> 
  addPolygons(
    highlightOptions = highlightOptions(color = "white", weight = 2, 
                                        bringToFront = T),
    popup = paste(
      "NAME: ", va_counties$NAME, "<br>"
      
    )
  )

va_county_map
