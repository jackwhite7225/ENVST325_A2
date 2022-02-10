install.packages('dplyr')
install.packages('lubridate')
library(dplyr)
library(lubridate)

#Prompt 1

streamH <- read.csv("/cloud/project/stream_gauge.csv")
siteInfo <- read.csv("/cloud/project/site_info.csv")

floods <- full_join(streamH, # left table
                    siteInfo, # right table
                    by="siteID") # common identifier

#Prompt 2

streamH$dateF <- ymd_hm(streamH$datetime, tz="America/New_York")
floods$dateF <- ymd_hm(floods$datetime, tz="America/New_York")

as.factor(floods$names)
levels(floods$names)

#Prompt 3

earlier = floods %>%
  group_by(names) %>%
  filter(gheight.ft >= flood.ft) %>%
  summarise(min.date = min(datetime), max.ht = max(gheight.ft))
earlier

#Homework 1

sante_fe_river = floods[floods$names == "SANTA FE RIVER NEAR FORT WHITE",]
fisheating_creek = floods[floods$names == "FISHEATING CREEK AT PALMDALE",]

par(mfrow = c(1, 1))

hist(sante_fe_river$gheight.ft) #The function itself at it's basic form

hist(sante_fe_river$gheight.ft, breaks = 20) #Using the break function to add columns to divide sections

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10) #Adding a base color

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, #Creating a main graph name
     main = "Sante Fe River Stream Gauge Heights")

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, 
     main = "Sante Fe River Stream Gauge Heights", xlab = "Stream Gauge Height") #Adding an x axis label

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, 
     main = "Sante Fe River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency') #Adding a y axis label

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, 
     main = "Sante Fe River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = F) #Showing how the axes = F removes the axes

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, 
     main = "Sante Fe River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T, ylim = c(0, 350)) #Changing the y limits to show more relativity in values

hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, 
     main = "Sante Fe River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T, ylim = c(0, 350), xlim = c(0, 15)) #The same for x limits

hist(fisheating_creek$gheight.ft, breaks = 20, col = 15, 
     main = "Fisheating Creek Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T)



#Homework 2 

#Prompt 1

peace_river = floods[floods$names == "PEACE RIVER AT US 17 AT ZOLFO SPRINGS",]
coochee_river = floods[floods$names == " WITHLACOOCHEE RIVER AT US 301 AT TRILBY",]

par(mfrow = c(2, 2))
hist(fisheating_creek$gheight.ft, breaks = 20, col = 15, 
     main = "Fisheating Creek Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T)
hist(sante_fe_river$gheight.ft, breaks = 20, col = 10, 
     main = "Sante Fe River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T)
hist(peace_river$gheight.ft, breaks = 20, col = 8, 
     main = "Peace River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T)
hist(coochee_river$gheight.ft, breaks = 20, col = 5, 
     main = "Withlacoochee River Stream Gauge Heights", xlab = "Stream Gauge Height",
     ylab = 'Frequency', axes = T)

#Question 2

action_height = floods %>%
  group_by(names) %>%
  filter(gheight.ft >= action.ft) %>%
  summarise(min.date = min(datetime))
action_height

flood_height = floods %>%
  group_by(names) %>%
  filter(gheight.ft >= flood.ft) %>%
  summarise(min.date = min(datetime))
flood_height

moderate_height = floods %>%
  group_by(names) %>%
  filter(gheight.ft >= moderate.ft) %>%
  summarise(min.date = min(datetime))
moderate_height

major_height = floods %>%
  group_by(names) %>%
  filter(gheight.ft >= major.ft) %>%
  summarise(min.date = min(datetime))
major_height

#Question 3



