# week5, 2/8/2016
# Asumi Saito
setwd("S:/620asaito1/week5")
sight<-read.csv("lionsightings.csv")

# Dates and time
class(sight$sightingdate) # This is factor
mean(sight$sightingdate, na.rm = T) # so, there is no mean
mean(as.numeric(sight$sightingdate), nar.rm=T) # as numeric

# Classes for Date and Time
help(POSIXlt) 
help(POSIXct)
# How to convert to POSIXlt?
help("strptime")


## How to use strptime?
# specify the current way of storing time 
strptime(sight$sightingdate, "%m/%d/%Y")

sight$sightingdate<-strptime(sight$sightingdate, "%m/%d/%Y")
class(sight$sightingdate) #it has converted
mode(sight$sightingdate)

## now you can call specifically month or year from the variable (help(POSIXlt))

# the month of each birth is used by calling 'mon' following the variable name
sight$sightingdate$mon
# but actually month displays 0 to 11, so correct it by adding 1
sight$sightingdate$mon+1
median(sight$sightingdate$mon+1, na.rm=T)

# year (year of origin=1990)
sight$sightingdate$year+1900
median(sight$sightingdate$year+1990, na.rm=T)

# yday, ranging from 0 - 365 -> add +1
median(sight$sightingdate$yday+1, na.rm = T)


sight$sightingdate[3]
sight$sightingdate$yday[3]
sight$sightingdate$mday[3]
sight$sightingdate$wday[3]

# create new column for julianday
sight$jday<-sight$sightingdate$yday+1


## Create study date, new variable useful for analysis (wanna have continuous days regardless of month and year)
help("difftime")

# use strptime to set the first date of study date
strptime("1/1/1990", "%m/%d/%Y") # this is defult
difftime(sight$sightingdate, strptime("1/1/1990", "%m/%d/%Y"), units="days" )

# assign difftime above to new variable
sight$studyday<-as.numeric(difftime(sight$sightingdate, strptime("1/1/1990", "%m/%d/%Y"), units="days" )+1)
# QC
sight$studyday[990]
