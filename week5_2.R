# week5-2

# using the "studyday", analyze if the gorupsize has changed over time


group<-read.csv("liongroups.csv")

# match
# give studay to groupdata, by matching sight id
group$studyday<-sight$studyday[match(group$sighting, sight$sighting)]

# plot the duration of study and number of groupmember
with(group[!group$total==0,], plot(total~studyday))

# regress total on studyday to see correlation
model1<-with(group[!group$total==0,], lm(total~studyday))
summary(model1)
abline(model1)
class(model1)


# code on D2L