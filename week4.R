# week 4
# Asumi Saito 2/1/2017


setwd("S:/620asaito1/week4")
known<-read.csv("knownlions.csv")
group<-read.csv("liongroups.csv")
sight<-read.csv("lionsightings.csv")

summary(group)
mean(group[,2])
t.test(group[,2]) #it's useful to get CI too.
names(group)
mean(group[,3:4])
class(group[,3])
class(group[,3:4])
t.test(group[,3:4]) #this just tests on H0; (mean(group[,3])+mean(group[,4]))/2 = 0
group[,-1] # drop the first column, -c(2,4,6) will drop those columns
group[1:10,T]
group[,c(T,F)] #do you want this row or not?
group[,"afemale"]
group["total">=10,] #Nah
group$total>=10 #logical test

group[group$total==20,] #create dataframe with the condition=T

length(group$total>=20) #all observations tested
sum(group$total>=20)    #observations with T for the condition
dim(group) #dimension of dataframe, by # of obs and var

group[group$total==(group$amale+group$afemale),]

sum(group$total==(group$amale+group$afemale))
group[group$total>=20, "total"]
mean(group[group$total!=0,"total"])
sum(group$total!=0)
a<-group[group$total!=0, "total"]
hist(a)
mean(group[group$total!=0|group$total<20,"total"])

with(group, mean(total[total!=0&amale>=1&afemale==0])) #inside with, you don't have to specify dataframe name
group[order(group$total),]
order(group$total) #show the no.observation
rev(group$total) #reverse order
sort(group$total) #show the value of each element
rev(sort(group$total))[-1] #throwing up the first observation

with(group, sum(total==2&amale==1&afemale==1))
with(group, sum(total==2))



#merge two datasets by matching 

names(sight)
test<-match(sight$sighting, group$sighting) #test has the #row from group that matches to each row of sight
group[7655,"sighting"] #QC
sight$groupsize<-group$total[match(sight$sighting, group$sighting)]
mean(sight$groupsize[sight$groupname=="Nsefu"|sight$groupname=="Nsolo"])
mean(sight$groupsize[sight$groupname %in% c("Nsefu","Nsolo")]) #%in% will match!

with(sight[sight$groupname %in% c("Nsefu","Nsolo"),], tapply(groupsize, groupname, mean, na.rm=T))
