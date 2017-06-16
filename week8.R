# week8, 3/1/2017
# Asumi Saito

# clear the enviroment
rm(list=ls(all=TRUE))

setwd("S:/620asaito1/week8")
mydata<-read.csv("scdata.csv")

names(mydata)

# logical test on name
names(mydata)=="mycon1"

# change name
names(mydata)[names(mydata)=="mycon1"]<-"snow_depth"
names(mydata)[names(mydata)=="mycon2"]<-"snow_water"
names(mydata) #qc

# plot
with(mydata,plot(snow_depth~snow_water))

# run as a model
mymodel<-with(mydata, lm(snow_depth~snow_water, na.action = "na.exclude"))
mymodel
names(mymodel)
mymodel$coefficients

# check the yfit
yfit<-predict(mymodel)
# yfit and x should have same length
length(yfit)
length(mydata$snow_depth)
# create dataframe for x and yfit
xyfit<-data.frame(x=mydata$snow_water, yfit=yfit)
plot(xyfit)
xyfit$yobs<-mydata$snow_water
xyfit$resid<-xyfit$yobs-xyfit$yobs
mean(xyfit$resid, na.rm = T) #OLS working!

# add a regression line
with(mydata,plot(snow_depth~snow_water))
lines(xyfit$x, xyfit$yfit)

xyfit<-xyfit[order(xyfit$x),]
lines(xyfit$x, xyfit$yfit, lwd=2, col="blue")

abline(mymodel, col="red") #abline goes to infinity, but sometimes doesnt make sense. no negative snow water.
lines(c(0,400),c(750,750)) #lines can draw line between any two points


## quadratic form ##
mymodel2<-with(mydata, lm(snow_depth~snow_water+I(snow_water^2),na.action = 'na.exclude')) #I;required for nonlinear form
mymodel2$coefficients

# plot?
yfit2<-predict(mymodel2)
xyfit2<-data.frame(x=mydata$snow_water, yfit2=yfit2)
with(mydata,plot(snow_depth~snow_water))
lines(xyfit2$x, xyfit2$yfit2) #recursive line; weird. needs to be reordered
xyfit2<-xyfit2[order(xyfit2$x),]
lines(xyfit2$x, xyfit2$yfit2)

# confidence interval
yfit2<-predict(mymodel2, se.fit=T)
yfit2$fit
yfit2$se.fit

xyfit3<-data.frame(x=mydata$snow_water,
                   yfit=yfit2$fit,
                   lcl=yfit2$fit-(1.96*yfit2$se.fit),
                   ucl=yfit2$fit+(1.96*yfit2$se.fit))
head(xyfit3) # proc print obs=6

xyfit3<-xyfit3[order(xyfit3$x),]
xyfit3<-xyfit3[!is.na(xyfit3$yfit),]

with(mydata,plot(snow_depth~snow_water))
with(xyfit3, lines(x, yfit, lwd=2, col='blue'))
with(xyfit3, lines(x, lcl, lty=2, lwd=2, col='blue'))
with(xyfit3, lines(x, ucl, lty=2, lwd=2, col='blue'))

with(xyfit3, polygon(c(x,rev(x)),c(lcl, rev(ucl)), col=rgb(0,0,1,0.25),border=NA)) #rev(x)=reverse(x), going around the area
with(xyfit3, lines(x, yfit, col='blue'))


fakedata<-data.frame(snow_water=seq(0,1000))
predict(mymodel2, newdata=fakedata)