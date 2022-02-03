install.packages('dplyr')
install.packages('lubridate')
library(dplyr)
library(lubridate)

streamH <- read.csv("/cloud/project/stream_gauge.csv")
siteInfo <- read.csv("/cloud/project/site_info.csv")

streamH$dateF <- ymd_hm(streamH$datetime, tz="America/New_York")

floods <- full_join(streamH, # left table
                    siteInfo, # right table
                    by="siteID") # common identifier
1 + 1
#test