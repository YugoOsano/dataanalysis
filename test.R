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

x <- 1:20
w <- -1 + sqrt(x)/2
y = x + rnorm(x)*w

plot(x,y)

#-- create a matrix with x in 1st column and y in 2nd.
matxy <- matrix(c(x,y), nrow = 20, ncol = 2)

#-- exporting data --
write.table(matxy, "mydaya.txt", sep="\t")

#-- Make a nonparametric local regression function
lrf <- lowess(x,y)
lines(x, lrf$y)

#-- linear regression
fm <- lm(y~x, data.frame(x,y))
abline(coef(fm), lty = 3)
