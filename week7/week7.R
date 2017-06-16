#Plotting in R
#week 7

# clear the enviroment
rm(list=ls(all=TRUE))


# set the working directory


mydata<-read.csv("scdata.csv")

## to make the following code work with your data,
## rename mycont1 and mycont2 to mycon1 and mycon2


# force R to recognize your categorical variables as "factors"
# if you use the mydata, mycat1 is the name of the file (one for each snow site), mycat2 is the month of the year,
# mycon1 is the snowdepth, and mycon2 is the snow water equivalents 
mydata$mycat1<-as.factor(mydata$mycat1)
mydata$mycat2<-as.factor(mydata$mycat2)



# empty blank plot
## rgb will also take a fourth argument that allows one to describe transparency
with(mydata,plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n'))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))


# drawing axes
axis(1)
axis(2)

# drawing axes
axis(1)
axis(2)

#changing the axes so origin is at limits of graph
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i'))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1)
axis(2)


# Changing the range of the plot scales
with(mydata, plot(mycon1~mycon2,
                  xlab='',ylab='',
                  xaxt='n',yaxt='n',
                  bty='n',type='n',
                  xaxs='i',yaxs='i',
                  xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1)
axis(2)

# Changing the range doesn't always result in the axes we want
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',
                  xaxt='n',yaxt='n',
                  bty='n',type='n',
                  xaxs='i',yaxs='i',
                  xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=c(0,100,200,300,400,500))
axis(2,at=seq(0,1600,400))


# Changing the range doesn't always result in the axes are drawn independent of the range we want and clipped to the plot area
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',
                  xaxt='n',yaxt='n',
                  bty='n',type='n',xaxs='i',
                  yaxs='i',xlim=c(0,500),ylim=c(0,1000)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100))
axis(2,at=seq(0,1600,400),xpd=T)

# often tick mark labels look better if inside the plot
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i',xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,lwd=3)
axis(1,at=seq(0,500,100),tcl=-0.5)
axis(2,at=seq(0,1600,400),tcl=0.5)

# add a more meaningful label
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',
                  xaxt='n',yaxt='n',
                  bty='n',type='n',
                  xaxs='i',yaxs='i',
                  xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,labels=as.character(seq(0,50,10)))
axis(2,at=seq(0,1600,400),tcl=0.5)




# move labels closer to the axis
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i',xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,labels=c("0","10","20","30","40","50"),padj=-1)
axis(2,at=seq(0,1600,400),tcl=0.5,padj=1)


# add axis labels
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i',xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,labels=c("0","10","20","30","40","50"),padj=-1)
axis(2,at=seq(0,1600,400),tcl=0.5,padj=1)
mtext("Snow-water (cm)",1,line=3)
mtext("Snow depth (mm)",2,line=3)

# orient axis labels
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i',xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,labels=c("0","10","20","30","40","50"),padj=-1)
axis(2,at=seq(0,1600,400),tcl=0.5,padj=1)
mtext("Snow-water (cm)",1,line=3)
mtext("Snow depth (mm)",2,line=3,las=2)

# change outer margin area
par(mar=c(3,7,1,1))

with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i',xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,labels=c("0","10","20","30","40","50"),padj=-1)
axis(2,at=seq(0,1600,400),tcl=0.5,padj=1)
mtext("Snow-water (cm)",1,line=3)
mtext("Snow depth (mm)",2,line=3,las=2)

# wrap text on y axis label
par(mar=c(4,7,1,1))
with(mydata, plot(mycon1~mycon2,xlab='',ylab='',xaxt='n',yaxt='n',bty='n',type='n',xaxs='i',yaxs='i',xlim=c(0,500),ylim=c(0,1600)))
with(mydata, points(mycon2,mycon1,col=rgb(1,0,0,0.5),cex=2,pch=19))
axis(1,at=seq(0,500,100),tcl=0.5,labels=c("0","10","20","30","40","50"),padj=-1)
axis(2,at=seq(0,1600,400),tcl=0.5,padj=1,cex.axis=2)
mtext("Snow-water (cm)",1,line=2)
mtext("Snow\ndepth\n(mm)",2,line=3,las=2)

# add legend
legend(100,1675,legend=c("March snow","May snow"),col=c(rgb(1,0,0,0.5),rgb(0,0,1,0.5)),pch=c(19,15),bty="n",xpd=T)

## add linear regression line
## First fit a linear regression model and use the slope and intercept of the that model to draw a line.
## the funciton lm will fit a linear model and when the argument na.exclude is given, the predict values
## will account for some missing observations.  Including x=T will append the x data to the model.

mymodel<-with(mydata,lm(mycon1~mycon2,na.action="na.exclude"))

## R Needs point with x and y coordinates to draw a line on a graph, It will connect those points in the order it reads them
## the points along a regression line are the predicted (or fitted) y-values for the observed x values.  

## THe predict function can be applied to a fitted model and will return the fitted y-values for the x observatoins used to fit the model. If
## na.exclude was specified as an argument when fitting the model, than the predict funciton will also return NA's as fitted values for any
## of the missing data points. This will ensure that the fitted values are teh same length as the x values.
yfit<-predict(mymodel)

## to facilitate ordering the data, combine the fitted y-values and the x observations into a singel data frame.
xyfit<-data.frame(x=mydata$mycon2,y=yfit) 

## however these fittedy data are not in order from smallest x, to largest x and will produce a gibberish graph if used to fit a curved line
## As R draws the line, we need R to read the points in from smallest x to largest along the fitted values, from the left side of the graph to the right.

xyfit<-xyfit[order(xyfit$x),]

#now lines can be drawn on the existing open graph using the lines funciton
lines(xyfit$x,xyfit$y,lwd=2,col="blue") 


## this general format will also work for curved lines, if say, the relationship between the response variable and explanatory variable is best fit using
## a non-linear trend as in a quadratic model

#redraw the plot using the code above

## then refit the model including a quadratic term and rebuild the data to fit the curve 
mymodel2<-with(mydata,lm(mycon1~mycon2+I(mycon2^2),na.action="na.exclude"))
yfit2<-predict(mymodel2)
xyfit2<-data.frame(x=mydata$mycon2,y=yfit2) 
xyfit2<-xyfit2[order(xyfit2$x),]

# draw thes new lines
lines(xyfit2$x,xyfit2$y,lwd=2,col="blue") 

## similar lines can also be  drawn for the 95% confidence bands just by using the Standard Errors of the fitted values. Standard error of fitted
## values can be retrieved by specifying se.fit=T as an argument within preddict.  The result will not just be a vector of fitted values but a list
## of fitted values and their standard errors.

yfit2<-predict(mymodel2, se.fit=T)

## in this list, the fitted values are in the slot called $fit and the standard errors are in a slot called se.fit
yfit2$fit
yfit2$se.fit

## the Lower and Upper 95% confidence bands are bounded by the fitted values plus or minus  1.96*standard error for each x observation 
## we can calculate these lower and upper y values manually and add them to the existing data frame as columns 'lcl' and 'ucl' for lower and upper
##   confidence limit when we build are data frame for drawing the fitted line
xyfit2<-data.frame(x=mydata$mycon2,y=yfit2$fit,lcl=yfit2$fit-(1.96*yfit2$se.fit),ucl=yfit2$fit+(1.96*yfit2$se.fit))

## again, we shoudl reorder the dataframe rows from smallest x to largest x
xyfit2<-xyfit2[order(xyfit2$x),]

xyfit2<-xyfit2[!is.na(xyfit2$y),]

## this data.frame now holds our x observations, our fitted values, the lower 95% confidence limit for each fitted value, and the upper 95% confidence limit
## these can all be drawn on the graph now

lines(xyfit2$x,xyfit2$y,lwd=2,col="blue") 
lines(xyfit2$x,xyfit2$lcl,lty=2,lwd=2,col="blue") 
lines(xyfit2$x,xyfit2$ucl,lty=2,lwd=2,col="blue")


# or a shaded polygon can be drawn

with(xyfit2,polygon(c(x,rev(x)),c(lcl,rev(ucl)),col=rgb(0,0,1,0.25),border=NA))



