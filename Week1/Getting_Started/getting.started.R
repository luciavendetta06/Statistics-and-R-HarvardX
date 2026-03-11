install.packages("rafalib")
library(rafalib)
install.packages("swirl")
library(swirl) 
swirl()

# Exercise 1 
version$version.string
version

# Exercise 2 - Numeric vector and mean
x <- c(2.23, 3.45, 1.87, 2.11, 7.33, 18.34, 19.23)
mean(x)

# Exercise 3- For loop suma de cuadrados 
total <- 0 
for(i in 1:25)(
  total <- total + i^2
)
total
#result: 5525

# Excercise 4 
class(cars)
# result: data.frame

# Exercise 5 
nrow(cars)
#result. 50

# Exercise  6 
colnames(cars)
# result: name of second column: dist 

# Exercise 7 
mean(cars[,2])
# result: 42.98

# Exercise 8- Function Wich 
which(cars[,2] == 85)



