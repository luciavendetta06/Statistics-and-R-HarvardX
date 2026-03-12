install.packages("UsingR")
library(UsingR)
library(rafalib)

x=father.son$fheight
round(sample(x,20),1)

#Histogram
bins <- seq(floor(min(x)),ceiling(max(x)))
hist(x, breaks=bins, xlab="Height", main="Adult men heights")

# Density function
myCDF <- ecdf(x)
xs <- seq(floor(min(x)),ceiling(max(x)),0.1)
plot(xs,myCDF(xs),type="l",xlab="x=Height",ylab="F(x)")












