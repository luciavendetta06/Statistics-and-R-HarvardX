library(UsingR)
x <- father.son$fheight
# Forma manual (para entender el concepto)
ps <- seq(0.01, 0.99, 0.01)
observed  <- quantile(x, ps)        # percentiles reales
teoricos  <- qnorm(ps, mean(x), sd(x)) # percentiles normales
plot(teoricos, observed)
abline(0, 1)  # línea con intercepto 0 y pendiente 1
# Forma rápida con funciones de R
qqnorm(x)   # genera el Q-Q plot directamente
qqline(x)   # añade la línea de referencia


# Exercises 

load("skew.RData")
getwd()

setwd("C:/Users/fqluc/OneDrive/Documentos/Statistics-and-R-HarvardX/Week1/Introduction_to_exploratory_data_analysis")
load("skew.RData")
dim(dat)
par(mfrow = c(3,3))
for (i in 1:9) {
  qqnorm(dat[,i], main = paste("Column", i))
  qqline(dat[,i])
}

par(mfrow = c(1,1))

# Sustituye X e Y por las columnas que identifiques
hist(dat[,4], main = "Column 4 - Sesgo positivo", xlab = "")
hist(dat[,9], main = "Column 9 - Sesgo negativo", xlab = "")


# Tema 2: Boxplot 
# Histograma para ver la distribución
hist(exec.pay, main="Salarios ejecutivos", xlab="Salario")

# Q-Q plot para confirmar que no es normal
qqnorm(exec.pay)
qqline(exec.pay)

# Boxplot
boxplot(exec.pay, ylab="Salario", main="Salarios ejecutivos")

# Comparar media vs mediana
mean(exec.pay)    # mucho más alto
median(exec.pay)  # aproximadamente la mitad de la media

# Exercises 
head(InsectSprays)

# Split
boxplot(split(InsectSprays$count, InsectSprays$spray),
        xlab = "Tipo de insecticida",
        ylab = "Número de insectos",
        main = "InsectSprays - split")
# formula 
boxplot(count ~ spray, 
        data = InsectSprays,
        xlab = "Tipo de insecticida",
        ylab = "Número de insectos",
        main = "InsectSprays - fórmula")
library(dplry)
install.packages("dplry")
library(dplyr)
data(nym.2002, package="UsingR")
head(nym.2002)

# Boxplot por género
boxplot(time ~ gender, 
        data = nym.2002,
        xlab = "Género",
        ylab = "Tiempo (minutos)",
        main = "NYC Marathon 2002 - Tiempos por género")

# Histogramas por género
par(mfrow = c(2,1))
hist(nym.2002$time[nym.2002$gender == "Male"], 
     main = "Hombres", xlab = "Tiempo", xlim = c(120, 540))
hist(nym.2002$time[nym.2002$gender == "Female"], 
     main = "Mujeres", xlab = "Tiempo", xlim = c(120, 540))
par(mfrow = c(1,1))


