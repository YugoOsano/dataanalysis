# For Japanese information for R, see:
# http://www.okada.jp.org/RWiki/

# For ESS (Emacs Speaks Statistics):
# http://www.okada.jp.org/RWiki/?ESS

# To use ESS in Windows, download 'emacs modified' from:
# http://vgoulet.act.ulaval.ca/en/emacs/windows/
# and install it.

# To change the default directory,
# create .Rprofile file at C:\Uses\USER\documents
# with a statement such as:
# setwd("C:/yugo/statistics")
# see: http://www.rstudio.com/ide/docs/using/workspaces

# To execute a script file, type:
# source("test.R")

# For syntax highlighting of R source in Scite editor,
# copy the properties file in the user directory
# containing SciTEUser.properties.
# https://groups.google.com/forum/#!topic/scite-interest/lIHZfsrnaXA

#  To install packages, type chooseCRANmirror() and a mirror site.
#  To reflect the proxy setting, ' --internet2' option is needed when R is run
#  http://www7b.biglobe.ne.jp/~homunculus/r/rproxy.html

# practice with a lecture note from:
# https://sites.google.com/site/webtextofr/home

# For browsing help of a function 'log', type:
#  ?log

# c() means concatenate
# x = c(50,60,65)

# For the summary for a vector, use
# length(), sum(), mean(), median(), var(), sd(), cor(x,y)
# max(), min(), sort(), range(), summary(), IQR(), quantile()

# x <- rnorm(50)
# y <- rnorm(x)

library(ggplot2)
library(grid)
library(gridExtra)

x <- 1:20
w <- -1 + sqrt(x)/2
y = x + rnorm(x)*w

#-- create a new graphic frame --
frame()

#-- create data frame and plot it by ggplot2
# http://stackoverflow.com/questions/6675066/ggplots-qplot-does-not-execute-on-sourcing
xydata = data.frame(xlabel = x, ylabel = y)
#g = ggplot(xydata, aes(x,y)) 
#g + geom_point()
plot(xydata$xlabel, xydata$ylabel)

#-- create a matrix with x in 1st column and y in 2nd.
matxy <- matrix(c(x,y), nrow = 20, ncol = 2)

#-- exporting data --
#  http://www.statmethods.net/input/exportingdata.html
write.table(matxy, "mydaya.txt", sep="\t")

#-- Make a nonparametric local regression function
lrf <- lowess(x,y)
lines(x, lrf$y)

#-- linear regression; To see the result, summary(fm)
fm <- lm(y~x, data.frame(x,y))
abline(coef(fm), lty = 3)

#-- read data from a tabular format text like:
#  id,sex,ht,wt,fat,sbp,dbp,tc,hdlc,tg,fbs,ha1c,got,gpt,ggt
#  1,f,159.1,58.1,32.1,116,64,259,54,284,96,4.8,14,29,39
# .....
#  https://sites.google.com/site/webtextofr/data
data = read.delim("demodata.csv", sep=",", header=TRUE)

#-- pick up male and female data
mdata = data[data$sex == 'm', ]
fdata = data[data$sex == 'f', ]

#-- To combine multiple plots into one overall graph, use par()
# http://www.statmethods.net/advgraphs/layout.html
par(mfrow = c(2,2))

#-- pick up a pair of columns from data and plot them
attach(data)
#plot(ht[ht <= 160 & wt <= 60], wt[ht <= 160 & wt <= 60])
g1 <-
ggplot(data, aes(x=ht, y=wt)) + geom_point()

#  For a pair of a category variable and a quantity variable,
# R automatically creates a box plots
#plot (data$sex, data$ht)
g2 <- ggplot(data, aes(x=sex, y=ht, fill=sex)) + geom_boxplot()

# histogram
#hist(tg, breaks=20)
g3 <- ggplot(data, aes(x=tg)) + geom_histogram(binwidth=20)

# http://kangaete.hatenablog.com/entry/2013/09/11/222608
#g = ggplot(data, aes(x=sex, y=ht, fill=sex))
#print (g + geom_boxplot())

# Multiple plots in one page
# http://rstudio-pubs-static.s3.amazonaws.com/2852_379274d7c5734f979e106dcf019ec46c.html
grid.arrange(g1,g2,g3,ncol = 2)