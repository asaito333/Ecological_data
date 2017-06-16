# week12, 3/29/2017
# Asumi Saito
# GGPLOT!!

setwd("S:/620asaito1/week12")
scdata<-read.csv("scdata.csv")

# subset the data to Jan, Feb, and Mar
mydata<-scdata[scdata$scmonth<4,]
# convert month to factor
mydata$scmonth<-as.factor(mydata$scmonth)

# install ggplot
library(ggplot2)

# ggplot function the first step is to create a ggplot object by defining data and aesthetics
w<-ggplot(mydata, aes(x=wateryear, y=scswe))  # set aesthetics as x and y axis

w #still nothing here

class(w) # is gg and ggplot

# plots are drawn by calling geopmetric objects
w + geom_point()
w + geom_path()

# color the points
w + geom_point(aes(color=scmonth))
w<-ggplot(mydata, aes(x=wateryear, y=scswe, color=scmonth)) 

# geom smooth add 95%CI
w + geom_point() + geom_smooth() # the method is defult
w + geom_point() + geom_smooth(method="lm") # case of linear regression

# label
# use scale_color_"discrete" because it is factor
w + geom_point() + scale_color_discrete("Month", labels=c("Jan","Feb","Mar")) 

# axis label
w + geom_point() + geom_smooth() + scale_color_discrete("Month", labels=c("Jan","Feb","Mar")) + scale_x_continuous("Water-year") + scale_y_continuous("Snow-water equivalents(mm)")


# multiplots can be shown with facets by three plots!
w + geom_point() + geom_smooth() + facet_wrap(~scmonth)
w + geom_point() + geom_smooth() + facet_wrap(~wateryear)

# changing point size by another variable; scdepth
w + geom_point(aes(size=scdepth)) + geom_smooth()


# play around
w + stat_ecdf()
w + stat_ellipse()
w + stat_identity()



# adding custom lines
# working hotelling confidence lines for entire data set

model<-with(mydata, lm(scswe~wateryear))
summary(model)

predictions<-predict(model,se=T)
fit<-predictions$fit
se<-predictions$se.fit

ww<-sqrt(2*qf(p=0.95, df1=2, df2=length(mydata$scswe) -2))
wh.upper<-fit+ww*se
wh.lower<-fit-ww*se

w<-ggplot(mydata, aes(x=wateryear, y=scswe, color=scmonth))  
w
w + geom_point() + geom_line(aes(x=wateryear, y=fit), size=1)+geom_line(aes(x=wateryear, y=wh.upper), color="blue", linetype='dashed', size=1)+geom_line(aes(x=wateryear,y=wh.lower), color='blue', linetype='dashed',size=1)
 
















