# week11, 3/22/2017
# Asumi Saito

scdata<-read.csv("scdata.csv")
names(scdata)
summary(scdata$enso)
class(scdata$enso)
summary(scdata$scdepth)
class(scdata$scdepth)

# run a linear regresion with categorical variables (enso)
lmodel<-with(scdata, lm(scdepth~enso))
summary(lmodel)

# get a coeffcient of interecepts
# here elnino is the defult of lmodel
with(scdata[scdata$enso=="elnino",],mean(scdepth, na.rm = T))
summary(lmodel)
summary(scdata$enso)
names(scdata)

# R runs regression on categorical variables by converting the factor to dummy variables (?)
scdata$Dlanina<-with(scdata, ifelse(enso=="lanina",1,0))
scdata$Dnormal<-with(scdata, ifelse(enso=="normal",1,0))
model2<-with(scdata, lm(scdepth~Dlanina+Dnormal))
summary(model2)
summary(lmodel)


# how to change the labels
levels(scdata$enso)<-c("a","b","c")

# change the order of enso to make the model easy to read
scdata$enso<-factor(scdata$enso, levels=c("normal","elnino","lanina"))
model3<-with(scdata, lm(scdepth~enso))
summary(model3)
summary(lmodel)

# no intercept
model4<-with(scdata, lm(scdepth~-1+enso))
summary(model4)

#lmodel, model2, model3, model4 give you same results

# anova
model5<-with(scdata, aov(scdepth~enso))
summary(model5)
anova(lmodel)
# F test on anova is for testing if the element significantly affects on the outcome var


## Different type of data
# snow plots are the number of olots that could be successfully measured over a site, max is 75

# create dataset without NA.
snow<-scdata[!is.na(scdata$snowplots),]

plotmodel<-with(snow[snow$scmonth==2,],lm(snowplots~scswe))
summary(plotmodel)

with(snow[snow$scmonth==2,],plot(snowplots~scswe))
abline(plotmodel)

plot(plotmodel)


# logstic regression
# ->glm, use binominal. help(familiy)

model6<-with(snow[snow$scmonth==2,], glm(snowplots~scswe, family='binomial'))
summary(snow$snowplots)
table(snow$snowplots)

# here, snowplots is not 0<snowplots<1, need to be changed

# two matrix way
model7<-with(snow[snow$scmonth==2,], glm(cbind(snowplots, 75-snowplots)~scswe, family='binomial'))
summary(model7)

# log transformation
with(snow[snow$scmonth==2,], plot(log((snowplots/75)/(1-(snowplots/75)))~scswe))

# devide by 75 to make snoplets within 0 and 1
model8<-with(snow[snow$scmonth==2,], glm(I(snowplots/75)~scswe, family="binomial", 
                                         weights = rep(75,length(snowplots))))

summary(model8)

# mean expected response uses the backtransformation of the logit to get p
# p must be multipled by # of trails(75) to get expected number of plots
# backtransformation for logit; log(x/1-x) -> exp(x)/1+exp(x)
coefs<-model8$coefficients
coefs

(exp(coefs[[1]]+coefs[[2]]*0))/(1+exp(coefs[[1]]+coefs[[2]]*0))*75


## poisson
model9<-with(snow[snow$scmonth==2,], glm(snowplots~scswe, family = "poisson"))
summary(model9)
plot(model9)


# mixed effect model
library(lme4)
model10<-with(snow, glmer(snowplots~scale(scswe)+(1|courseid),family="poisson"))
summary(model10)





scale(snow$scswe)










