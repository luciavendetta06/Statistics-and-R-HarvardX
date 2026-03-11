# Read data command 
dat <- read.csv("femaleMiceWeights.csv") 
RNGkind()

# Exercise 1 
colnames(dat)
# result: Bodyweight 

# Exercise 2 
dat[12, 2]

# result: 26.25

# Exercise 3
dat$Bodyweight[11]
# result: 26.91 

# Exercise 4 
length(dat$Bodyweight)
# result: 24

# Exercise 5
mean(dat$Bodyweight[13:24])
# result: 26.83417

# Exercise 6
set.seed(1)
i <- sample(13:24, 1)
dat$Bodyweight[i]









