#week3, 1/25/2016
#Asumi Saito

library(MASS)
bacteria

#read numbers from clipboard(Ctrl+C)
#read as character variables
mydata<-readClipboard()
is.vector(mydata)
mydata<-as.numeric(mydata) #convert to numeric
as.character(mydata) #convert to character (but without assigining)
as.logical(mydata) #convert to logical (weird)

#read numbers as factor variables
sites<-as.factor(c("61","62","63","11","12","13","111","112","113"))
levels(sites)
as.numeric(sites) 
#when you read factors as numeric, R recode them as numeric in certain order (same as order in levels)
mean(as.numeric(sites)) #this is wrong
sites<-as.numeric(as.character(sites)) #now it's reading as the numbers are
mean(sites) #got it!


###WORK ON YELLBEARS DATASET
#change has made on raw excel file
#last two column has deleted from raw excel file

#read csv file
read.table("S:/620asaito1/week3/yellbears.csv")   #read.table gets the path name
#instead of giving the entire path,
setwd("S:/620asaito1/week3") #if you open the script from somewhewre, that's gonna be working directry (check in getwd)
getwd()
yellbearscsv<-read.csv('yellbears.csv')

#read txt
read.table("yellbears.txt") #Nah. read.table has lot options to apply for different types of files
bear.data<-read.delim("yellbears.txt") #worked! lucky! use this.

View(yellbearscsv)
summary(yellbearscsv)

#Check the class of variable with weird levels
lapply(yellbearscsv$Wolves,class)
#or
str(yellbearscsv$Wolve) # so it's factor
#rename it
levels(yellbearscsv$Wolves)<-list(y="y",y="Y",y=" y",y="Yes", n="N")
summary(yellbearscsv$Wolves)
#replace NA with y
yellbearscsv$Wolves[is.na(yellbearscsv$Wolves)]<-"y"

#replace levels of Techniques
summary(yellbearscsv$Technique)
levels(yellbearscsv$Technique)<-list(aerial="aerial",ground="ground",mark_resight="mark-resight",mark_resight="mark-resihgt",mark_resight="mark resight" )
yellbearscsv$Technique

plot(yellbearscsv)

###WORK WITH DATA ONLINE

#download.file downloads the file into current working directory
download.file("https://www.wcc.nrcs.usda.gov/ftpref/data/snow/snotel/cards/arizona/09n05s_2010.tab", "snow.tab")
snow<-read.delim("snow.tab")
list.files("https://www.wcc.nrcs.usda.gov/ftpref/data/snow/snotel/cards/arizona",all.files = T, full.names = F) #doesn't work
help("list.files")