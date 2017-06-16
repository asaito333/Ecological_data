# week13, 4/12/2017
# Asumi Saito

setwd("S:/620asaito1/week13")
library(animation)

# create a simple loop that calculates the square of each item in a vector

## simultated data; 10 random numbers from a normal distrbution with mean 0, sd=1
testdata<-rnorm(10)

## create an emplty 'container', this will have new data created in the loop
container<-NA

# initialize the loop
# steps (here, 1:10) doesn't have to be integer, could be character
for(i in 1:10){
    container[i]<-testdata[i]*testdata[i]
    print(container[i])
}
container


# functions
# cutom functions can execute a block of code and accept custom arguments (or no aruguments)

coefvar<-function() mean(testdata)/sd(testdata)
coefvar()

coefvarx<-function(x) mean(x)/sd(x)
coefvarx(container)
coefvarx(rnorm(10000))

# using loops and functions with package animation

meanapr<- read.csv("aprsnow.csv")

plotasprsnow<-function(){
    for (i in c(1930:2014)) {
      with(meanapr, plot(year,swe, type='n'))
      with(meanapr, lines(year, swe, col='grey'))
      with(meanapr[meanapr$year==i,], points(year, swe))
      with(meanapr[meanapr$year<=i,], lines(year, swe))
    
    }
}

saveGIF(plotasprsnow(), movie.name="april_animation.gif")

## speed is too slow
saveGIF(plotasprsnow(), movie.name="april_animation.gif", interval=0.1)


dev.off()



plotasprsnow<-function(){
  for (i in c(1930:2014)) {
    with(meanapr, plot(year,swe, type='n'))
    with(meanapr, lines(year, swe, col='grey'))
    with(meanapr[meanapr$year==i,], points(year, swe))
    with(meanapr[meanapr$year<=i,], lines(year, swe))
    text(1970, -10, i, cex=2)
    points(i,par("usr")[3], pch=15)
  }
}
saveGIF(plotasprsnow(), movie.name="april_animation.gif", interval=0.1)

# ggplot animations

library(ggplot2)
library(devtools)

devtools::install_github("dgrtwo/gganimate")


library(gganimate)

snow<-read.csv("yellowstone.csv")
p<-ggplot(snow, aes(x=julianday, y=snowwater, frame=wateryear))
p<-p + geom_point() + geom_smooth(aes(group=wateryear), method="lm", formula=y~poly(x,3))

gganimate(p)
gganimate(p, convert="gm convert")


p<-ggplot(snow, aes(wateryear, snowwater, frame=month)) + geom_point() +
    geom_smooth(method="lm", formula=y~poly(x,3))+
    facet_wrap(~state)

gganimate(p, interval=2, convert="gm convert")

