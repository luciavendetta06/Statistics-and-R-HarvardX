setwd("C:/Users/fqluc/OneDrive/Documentos/Statistics-and-R-HarvardX/Week1/Getting_Started")
dat <- read.csv("femaleMiceWeights.csv")
library(dplyr)

control <- filter(dat, Diet=="chow") %>%
  select(Bodyweight) %>% unlist 
treatment <- filter(dat,Diet=="hf") %>% 
  select(Bodyweight) %>% unlist 

# Diferencia de pesos entre los ratones de ambas dietas, 3.020833 g de diferencia

mean(treatment) - mean(control)

# la diferencia de pesos se debe a la dieta diferente o se debe a algo más que casualidad? 

population <- read.csv("femaleControlsPopulation.csv")
population
population <- unlist(population) # no queremos que sea un marco de datos, convert vector numérico

# Hay una función en R que si le das una lista de números, tomrá una muestra random del tamaño que desee
mean(sample(population, 12))
# Si corres esta línea varias veces cada vez te da un número distinto 

# ¿Fue la dieta alta en grasas lo que marcó la diferencia? 

# Exercises 

# Usa el siguiente dataset para resolver los ejercicios 

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
# la x representa los pesos de la población entera 

# asegúrate de estar usando el correcto random number generator con este comando: 
RNGkind("Mersenne-Twister", "Inversion", "Rejection")

# Exercise 1 
mean(x) # result: 23.89338 

# Exercise 2 
# El valor absoluto de la diferencia entre la media de la muestra (n=5) y la media poblacional
set.seed(1) 
sample_5 <- sample(x, 5)
abs(mean(sample_5) - mean(x)) 
# result: 0.3293778 

# Exercise 3 
# el valor absoluto de la diferencia entre la media de la muestra (n=5) y la media poblacional
set.seed(5) 
sample_5 <- sample(x, 5) 
abs(mean(sample_5) - mean(x))
# result: 0.3813778 

# INTRO TO NULL DISTRIBUTIONS 

obs <- mean(treatment) - mean(control) 

population <- read.csv("femaleControlsPopulation.csv")
population <- unlist(population)

# cuando la hipótesis nula es cierta: no hay ningún efecto de una dieta alta en grasas
# si tengo un nuevo conjunto de ratones de tratamiento y nuevo de control... la hipótesis nula es cierta, no hay diferencia. 
# podemos asignar ratones control a tratamiento, el tratamiento es no tratamiento 
control <- sample(population, 12)
treatment <- sample(population, 12)
mean(treatment) - mean(control)
# cada vez que corremos estas tres líneas nos sale un valor diferente que oscila entre -1.5 y 1.5

# La distribución nula son todas las realizaciones posibles bajo el valor nulo
# si la conoces puedes describir la proporción de valores que ve para cualquier intervalo de valores

n <- 10000
nulls <- vector("numeric", n)
for(i in 1:n){
  control <- sample(population, 12)
  treatment <- sample(population, 12)
  nulls[i] <- mean(treatment) - mean(control)  
}
max(nulls)
# 5.224167

hist(nulls)
# la mayoría de los valores están alrededor de -2 y 2

# tenemos una idea de la probabilidad de ver valores tan grandes como 3 bajo la hipótesis nula 
# informar la proporción de veces 

sum(nulls > obs) 

# si pones en la terminal nulls > obs te sale una tabla de TRUE o FLASE 

sum(nulls > obs)/n 
mean(nulls > obs) # solo ocurre un 0.0263 (solo ocurre un 2,6%)

# también se puede calcular con qué frecuencia es mayor en valor absoluto 

mean(abs(nulls) > obs) # 0.0524 Es aprox. el doble de grande 

# sucede el 5% de las veces, Es un p valor, que responde cuál es la probabilidad de que un resultado de la distribución nula es mayor de la que observamos cuando la hipoétis nula es verdadera


# Null distribution exercises 
# For these exercises, we will be using the following dataset:

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
# x represents the weights for the entire population 

# Ex 1 
set.seed(1)
n <- 1000
averages <- vector("numeric", n)
for(i in 1:n){
  averages[i] <- mean(sample(x, 5))
}
mean(abs(averages - mean(x)) > 1)
# result: 0.503
# Ex 2 
set.seed(1)
n <- 10000
averages <- vector("numeric", n)
for(i in 1:n){
  averages[i] <- mean(sample(x, 5))
}
mean(abs(averages - mean(x)) > 1)
# result: 0.5084



# INTRODUCTION TO PROBABILTY DISTRIBUTIONS 

install.packages("gapminder")
library(gapminder)
data(gapminder)
head(gapminder)
x <- gapminder$lifeExp[gapminder$year == 1952]
hist(x, main = "Life Expectancy by Country (1952)",
     xlab = "Life Expectancy", col = "lightblue")

# Exercises 

# Ex1 
mean(x <= 40) 

# Sapply() function 
prop = function(q) {
  mean(x <= q)
}

qs = seq(from=min(x), to=max(x), length=20)

props = sapply(qs, prop)

plot(qs, props)
props = sapply(qs, function(q) mean(x <= q))
plot(ecdf(x))









