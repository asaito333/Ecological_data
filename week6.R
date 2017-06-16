# week6, 2/15/2017
# Asumi Saito

# snow data
setwd("S:/620asaito1/week6")
scdata<-read.csv("scdata.csv")

# clear the environment
rm(list=ls(all=T))

# mycat1; file name
# mycat2; month
scdata$mycat2<-as.factor(scdata$mycat2)

# sudden t test
with(scdata, t.test(mycon1))

## PLOTTING ##

# categorical response variable, continuous explanatory variable
# mycon2; snow water
with(scdata, plot(mycat2~mycon2)) #wtf?
# switch x and y
with(scdata, plot(mycon2~mycat2)) # :)

# formatting "boxplot"

# how about
with(scdata, plot(mycat1~mycat2)) #?
with(scdata, boxplot(mycon2~mycat2, range=1.0))
with(scdata, boxplot(mycon2~mycat2, range=2.0))
with(scdata, plot(mycon1~mycon2))


## Formatiing ## help("par")

# lables : turn off
with(scdata, plot(mycon1~mycon2, xlab='', ylab=''))
# axis : turn off. n=NO! 
with(scdata, plot(mycon1~mycon2, xlab='', ylab='', xaxt='n', yaxt='n'))
# boundary box: 
with(scdata, plot(mycon1~mycon2, xlab='',ylab='',xaxt='n',yaxt='n', bty='n'))
# plots:
with(scdata, plot(mycon1~mycon2, xlab='',ylab='',xaxt='n',yaxt='n',bty='n', type='n'))

# show specific points
points(0,0)

with(scdata,points(mycon2,mycon2, type='l'))

# Formatting points #help(points)
with(scdata,plot(mycon1~mycon2, xlab='',ylab='',xaxt='n',yaxt='n', col='cadetblue',bty='n', pch=8))

# all available colors in R
plot(rep(seq(1,26),each=26),rep(seq(1,26),26),col=colors(),pch=15,cex=2)

# transparant points by col=rgb 
with(scdata,points(mycon2,mycon1, col=rgb(1,0,0,0.5),cex=2,pch=23))


