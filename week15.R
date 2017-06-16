# week15, 4/19/2017
# Asumi Saito

setwd("S:/620asaito1/week15")

library(raster)
mydata<-read.csv("transects.csv")
names(mydata)
summary(mydata)

#sruvey, transectdata ; date
# trans, count, perpdist, vehiclexy, animalxy; numeric
# year, daynight species, habitat; categorical


# change your data into a spatial object by firt pointing out the columns that hold the (x,y)
# then convert the data to a spatialpoints object
coordinates<-cbind(mydata$animalx, mydata$animaly)
coordinates

#spatial points data frame needs coordinates (points) and correspoinding data
transects<-SpatialPointsDataFrame(coordinates, mydata)

#btw
ex<-SpatialPoints(coordinates)

plot(transects)

#evi.tif stores the numbers, library raster interpret them as colors in cells(?)
library(rgdal)
evi<-raster("evi.tif")
evi

plot(evi)
plot(transects, add=T)

# extracting raster values at each point in your data frame couldnt be easier using rater?
transects$evi<-extract(evi, transects)

hist(transects$evi, freq=F, col=rgb(0,0,1,0.5)) #this evi values are the ones correspoinding with dataset
hist(getValues(evi), freq=F, add=T, col=rgb(1,0,0,0.5)) # this is whole evi values 
# blue histogram show that evi value shown in the dataset, which meanse
# animals are observed in high evi value area 

slotNames(transects)
transects@data

hist(transects$evi[transects$species=="gira"], freq=F, col=rgb(0,0,1,0.5) )
hist(transects$evi[transects$species=="ostr"], freq=F, add=T, col=rgb(1,0,0,0.5) )



proj4string(evi)
proj4string(transects)<-proj4string(evi)


datafolder<-"evi_time_series"
evifiles<-list.files(path=datafolder, full.names = T, pattern = ".tif")

# read all the files as rasters
evilist<-lapply(evifiles, raster)

# stack all the rasters
evistack<-stack(evilist)

plot(evistack)

# extract the raster value from each rater using each transect point
transectevi<-extract(evistack, transects)

transects<-cbind(transects, transectevi)









