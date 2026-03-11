install.packages("dplyr")
library(dplyr)

dat <- read.csv("femaleMiceWeights.csv")
controls <- filter(dat, Diet=="chow")

select(controls, Bodyweight)

controls <- select(controls, Bodyweight)
unlist(controls)

# Pipe 
controls <- filter(dat, Diet=="chow") %>% 
  select(Bodyweight) %>% unlist

# Exercises with dplry 
install.packages("downloader")
library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)

# explore the file 
msleep <- read.csv("msleep_ggplot2.csv")

colnames(msleep)
dim(msleep)
class(msleep)

# Ex 1 
class(msleep)
# result: data.frame 
# Ex2 
primates <- filter(msleep, order == "Primates")
nrow(primates)
# result: 12 

# Ex 3
class(primates)
# result: data.frame 

# Ex 4 
Primates_sleep <- filter(msleep, order == "Primates") %>% 
  select(sleep_total) 
class(Primates_sleep)
# result: data.frame 

# Ex 5 
filter(msleep, order == "Primates") %>% 
  select(sleep_total) %>% 
  unlist() %>%
  mean() 
# result: 10.5

# Ex 6 
filter(msleep, order == "Primates") %>% 
  summarize(mean(sleep_total))









