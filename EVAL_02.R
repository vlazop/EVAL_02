#######################################################
# UNIVERSIDAD NACIONAL DE INGENIERÍA
# CENTRO DE TECNOLOGÍAS DE INFORMACIÓN Y COMUNICACIONES
# Elaborado por: Victor Lazo
#########################################################

getwd()
setwd(dir = "c:/Users/Victor Lazo/Desktop/R4DS/05 Class/Evaluacion/EVAL_02/")
rm(list=ls())
dir()

# Describir modelos AR(2) , graficarlos para valores diferentes 
# de los argumentos (ar = c(p1,p2))
# AR(2)
AR2 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.1,0.2)), n = 100, sd = 0.1)
# Probar varias combinaciones de p1 y p2 , graficar las series de tiempo
# simuladas, y sus correspondientes funciones de autocorrelacion simple
# y funciones de autocorrelacion parcial 

# Repetir lo mismo para los procesos MA(2) 


#### Modelos AR ####

# Cargamos las librerias a utilizar
library(ggplot2)
library(tseries)
library(forecast)
library(quantmod)

# AR(2) : y[t] = mu + phi[1]*y[t-1] + phi[2]*y[t-2] + Err[t]
# Simulemos un AR(2) = ARIMA(2,0,0)
# Por un tema de reproducibilidad: Fijamos una semilla
set.seed(888)

# Simulamos los procesos AR(2)

AR2.1 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.1,0.2)), n = 100, sd = 0.1)
AR2.2 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.1,0.1)), n = 100, sd = 0.1)
AR2.3 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.1,-0.1)), n = 100, sd = 0.1)
AR2.4 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.1,-0.2)), n = 100, sd = 0.1)
AR2.5 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.2,0.2)), n = 100, sd = 0.1)
AR2.6 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.2,0.1)), n = 100, sd = 0.1)
AR2.7 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.2,-0.1)), n = 100, sd = 0.1)
AR2.8 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.2,-0.2)), n = 100, sd = 0.1)
AR2.9 <- arima.sim(model = list(order=c(2,0,0), ar=c(-0.1,0.2)), n = 100, sd = 0.1)
AR2.10 <- arima.sim(model = list(order=c(2,0,0), ar=c(-0.1,0.1)), n = 100, sd = 0.1)
AR2.11 <- arima.sim(model = list(order=c(2,0,0), ar=c(-0.1,-0.1)), n = 100, sd = 0.1)
AR2.12 <- arima.sim(model = list(order=c(2,0,0), ar=c(-0.1,-0.2)), n = 100, sd = 0.1)
AR2.13 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.4,0.3)), n = 100, sd = 0.1)
AR2.14 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.4,0.1)), n = 100, sd = 0.1)
AR2.15 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.4,-0.1)), n = 100, sd = 0.1)
AR2.16 <- arima.sim(model = list(order=c(2,0,0), ar=c(0.4,-0.3)), n = 100, sd = 0.1)


# Grafica de las series de tiempo simuladas

png(filename = "SerieTiempoAR2.png")
par(mfrow = c(4,4))
ylm <- c(min(AR2.1, AR2.2 ,AR2.3, AR2.4, AR2.5, AR2.6, AR2.7, AR2.8, AR2.9, AR2.10, AR2.11, AR2.12, AR2.13, AR2.14,AR2.15,AR2.16),
         max(AR2.1, AR2.2 ,AR2.3, AR2.4, AR2.5, AR2.6, AR2.7, AR2.8, AR2.9, AR2.10, AR2.11, AR2.12, AR2.13, AR2.14,AR2.15,AR2.16))

plot.ts(AR2.1, ylim = ylm, main = "AR(2) phi[1] = 0.1 y  phi[2] = 0.2")
plot.ts(AR2.2, ylim = ylm, main = "AR(2) phi[1] = 0.1 y  phi[2] = 0.1")
plot.ts(AR2.3, ylim = ylm, main = "AR(2) phi[1] = 0.1 y  phi[2] = -0.1")
plot.ts(AR2.4, ylim = ylm, main = "AR(2) phi[1] = 0.1 y  phi[2] = -0.2")
plot.ts(AR2.5, ylim = ylm, main = "AR(2) phi[1] = 0.2 y  phi[2] = 0.2")
plot.ts(AR2.6, ylim = ylm, main = "AR(2) phi[1] = 0.2 y  phi[2] = 0.1")
plot.ts(AR2.7, ylim = ylm, main = "AR(2) phi[1] = 0.2 y  phi[2] = -0.1")
plot.ts(AR2.8, ylim = ylm, main = "AR(2) phi[1] = 0.2 y  phi[2] = -0.2")
plot.ts(AR2.9, ylim = ylm, main = "AR(2) phi[1] = -0.1 y  phi[2] = 0.2")
plot.ts(AR2.10, ylim = ylm, main = "AR(2) phi[1] = -0.1 y  phi[2] = 0.1")
plot.ts(AR2.11, ylim = ylm, main = "AR(2) phi[1] = -0.1 y  phi[2] = -0.1")
plot.ts(AR2.12, ylim = ylm, main = "AR(2) phi[1] = -0.1 y  phi[2] = -0.2")
plot.ts(AR2.13, ylim = ylm, main = "AR(2) phi[1] = 0.4 y  phi[2] = 0.3")
plot.ts(AR2.14, ylim = ylm, main = "AR(2) phi[1] = 0.4 y  phi[2] = 0.1")
plot.ts(AR2.15, ylim = ylm, main = "AR(2) phi[1] = 0.4 y  phi[2] = -0.1")
plot.ts(AR2.16, ylim = ylm, main = "AR(2) phi[1] = 0.4 y  phi[2] = -0.3")
dev.off()

# Grafica AFC 

graphics.off()
png(filename = "AFCGraphAR2.png")
par(mfrow = c(4,4))
acf(AR2.1, main = "AR(2) phi[1] = 0.1 y  phi[2] = 0.2")
acf(AR2.2, main = "AR(2) phi[1] = 0.1 y  phi[2] = 0.1")
acf(AR2.3, main = "AR(2) phi[1] = 0.1 y  phi[2] = -0.1")
acf(AR2.4, main = "AR(2) phi[1] = 0.1 y  phi[2] = -0.2")
acf(AR2.5, main = "AR(2) phi[1] = 0.2 y  phi[2] = 0.2")
acf(AR2.6, main = "AR(2) phi[1] = 0.2 y  phi[2] = 0.1")
acf(AR2.7, main = "AR(2) phi[1] = 0.2 y  phi[2] = -0.1")
acf(AR2.8, main = "AR(2) phi[1] = 0.2 y  phi[2] = -0.2")
acf(AR2.9, main = "AR(2) phi[1] = -0.1 y  phi[2] = 0.2")
acf(AR2.10, main = "AR(2) phi[1] = -0.1 y  phi[2] = 0.1")
acf(AR2.11, main = "AR(2) phi[1] = -0.1 y  phi[2] = -0.1")
acf(AR2.12, main = "AR(2) phi[1] = -0.1 y  phi[2] = -0.2")
acf(AR2.13, main = "AR(2) phi[1] = 0.4 y  phi[2] = 0.3")
acf(AR2.14, main = "AR(2) phi[1] = 0.4 y  phi[2] = 0.1")
acf(AR2.15, main = "AR(2) phi[1] = 0.4 y  phi[2] = -0.1")
acf(AR2.16, main = "AR(2) phi[1] = 0.4 y  phi[2] = -0.3")
dev.off()

# Grafica PAFC 

graphics.off()
png(filename = "PAFCGraphAR2.png")
par(mfrow = c(4,4))
pacf(AR2.1, main = "AR(2) phi[1] = 0.1 y  phi[2] = 0.2")
pacf(AR2.2, main = "AR(2) phi[1] = 0.1 y  phi[2] = 0.1")
pacf(AR2.3, main = "AR(2) phi[1] = 0.1 y  phi[2] = -0.1")
pacf(AR2.4, main = "AR(2) phi[1] = 0.1 y  phi[2] = -0.2")
pacf(AR2.5, main = "AR(2) phi[1] = 0.2 y  phi[2] = 0.2")
pacf(AR2.6, main = "AR(2) phi[1] = 0.2 y  phi[2] = 0.1")
pacf(AR2.7, main = "AR(2) phi[1] = 0.2 y  phi[2] = -0.1")
pacf(AR2.8, main = "AR(2) phi[1] = 0.2 y  phi[2] = -0.2")
pacf(AR2.9, main = "AR(2) phi[1] = -0.1 y  phi[2] = 0.2")
pacf(AR2.10, main = "AR(2) phi[1] = -0.1 y  phi[2] = 0.1")
pacf(AR2.11, main = "AR(2) phi[1] = -0.1 y  phi[2] = -0.1")
pacf(AR2.12, main = "AR(2) phi[1] = -0.1 y  phi[2] = -0.2")
pacf(AR2.13, main = "AR(2) phi[1] = 0.4 y  phi[2] = 0.3")
pacf(AR2.14, main = "AR(2) phi[1] = 0.4 y  phi[2] = 0.1")
pacf(AR2.15, main = "AR(2) phi[1] = 0.4 y  phi[2] = -0.1")
pacf(AR2.16, main = "AR(2) phi[1] = 0.4 y  phi[2] = -0.3")
dev.off()

#### Modelos MA ####

# Cargamos las librerias a utilizar
library(ggplot2)
library(tseries)
library(forecast)
library(quantmod)

# Simulemos un MA(2) = (0,0,2)
# Por un tema de reproducibilidad: Fijamos una semilla
set.seed(888)

# Simulamos los procesos MA(2)
MA2.1 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.1,0.2)), n = 100, sd = 0.1)
MA2.2 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.1,0.1)), n = 100, sd = 0.1)
MA2.3 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.1,-0.1)), n = 100, sd = 0.1)
MA2.4 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.1,-0.2)), n = 100, sd = 0.1)
MA2.5 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.2,0.2)), n = 100, sd = 0.1)
MA2.6 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.2,0.1)), n = 100, sd = 0.1)
MA2.7 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.2,-0.1)), n = 100, sd = 0.1)
MA2.8 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.2,-0.2)), n = 100, sd = 0.1)
MA2.9 <- arima.sim(model = list(order=c(0,0,2), ma= c(-0.1,0.2)), n = 100, sd = 0.1)
MA2.10 <- arima.sim(model = list(order=c(0,0,2), ma= c(-0.1,0.1)), n = 100, sd = 0.1)
MA2.11 <- arima.sim(model = list(order=c(0,0,2), ma= c(-0.1,-0.1)), n = 100, sd = 0.1)
MA2.12 <- arima.sim(model = list(order=c(0,0,2), ma= c(-0.1,-0.2)), n = 100, sd = 0.1)
MA2.13 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.4,0.3)), n = 100, sd = 0.1)
MA2.14 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.4,0.1)), n = 100, sd = 0.1)
MA2.15 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.4,-0.1)), n = 100, sd = 0.1)
MA2.16 <- arima.sim(model = list(order=c(0,0,2), ma= c(0.4,-0.3)), n = 100, sd = 0.1)


# Grafica de las series de tiempo simuladas

png(filename = "SerieTiempoMA2.png")
par(mfrow = c(4,4))
ylm <- c(min(MA2.1, MA2.2 ,MA2.3, MA2.4, MA2.5, MA2.6, MA2.7, MA2.8, MA2.9, MA2.10, MA2.11, MA2.12, MA2.13, MA2.14,MA2.15,MA2.16),
         max(MA2.1, MA2.2 ,MA2.3, MA2.4, MA2.5, MA2.6, MA2.7, MA2.8, MA2.9, MA2.10, MA2.11, MA2.12, MA2.13, MA2.14,MA2.15,MA2.16))

plot.ts(MA2.1, ylim = ylm, main = "MA(2) phi[1] = 0.1 y  phi[2] = 0.2")
plot.ts(MA2.2, ylim = ylm, main = "MA(2) phi[1] = 0.1 y  phi[2] = 0.1")
plot.ts(MA2.3, ylim = ylm, main = "MA(2) phi[1] = 0.1 y  phi[2] = -0.1")
plot.ts(MA2.4, ylim = ylm, main = "MA(2) phi[1] = 0.1 y  phi[2] = -0.2")
plot.ts(MA2.5, ylim = ylm, main = "MA(2) phi[1] = 0.2 y  phi[2] = 0.2")
plot.ts(MA2.6, ylim = ylm, main = "MA(2) phi[1] = 0.2 y  phi[2] = 0.1")
plot.ts(MA2.7, ylim = ylm, main = "MA(2) phi[1] = 0.2 y  phi[2] = -0.1")
plot.ts(MA2.8, ylim = ylm, main = "MA(2) phi[1] = 0.2 y  phi[2] = -0.2")
plot.ts(MA2.9, ylim = ylm, main = "MA(2) phi[1] = -0.1 y  phi[2] = 0.2")
plot.ts(MA2.10, ylim = ylm, main = "MA(2) phi[1] = -0.1 y  phi[2] = 0.1")
plot.ts(MA2.11, ylim = ylm, main = "MA(2) phi[1] = -0.1 y  phi[2] = -0.1")
plot.ts(MA2.12, ylim = ylm, main = "MA(2) phi[1] = -0.1 y  phi[2] = -0.2")
plot.ts(MA2.13, ylim = ylm, main = "MA(2) phi[1] = 0.4 y  phi[2] = 0.3")
plot.ts(MA2.14, ylim = ylm, main = "MA(2) phi[1] = 0.4 y  phi[2] = 0.1")
plot.ts(MA2.15, ylim = ylm, main = "MA(2) phi[1] = 0.4 y  phi[2] = -0.1")
plot.ts(MA2.16, ylim = ylm, main = "MA(2) phi[1] = 0.4 y  phi[2] = -0.3")
dev.off()


# Grafica AFC 

graphics.off()
png(filename = "AFCGraphMA2.png")
par(mfrow = c(4,4))
acf(MA2.1, main = "MA(2) phi[1] = 0.1 y  phi[2] = 0.2")
acf(MA2.2, main = "MA(2) phi[1] = 0.1 y  phi[2] = 0.1")
acf(MA2.3, main = "MA(2) phi[1] = 0.1 y  phi[2] = -0.1")
acf(MA2.4, main = "MA(2) phi[1] = 0.1 y  phi[2] = -0.2")
acf(MA2.5, main = "MA(2) phi[1] = 0.2 y  phi[2] = 0.2")
acf(MA2.6, main = "MA(2) phi[1] = 0.2 y  phi[2] = 0.1")
acf(MA2.7, main = "MA(2) phi[1] = 0.2 y  phi[2] = -0.1")
acf(MA2.8, main = "MA(2) phi[1] = 0.2 y  phi[2] = -0.2")
acf(MA2.9, main = "MA(2) phi[1] = -0.1 y  phi[2] = 0.2")
acf(MA2.10, main = "MA(2) phi[1] = -0.1 y  phi[2] = 0.1")
acf(MA2.11, main = "MA(2) phi[1] = -0.1 y  phi[2] = -0.1")
acf(MA2.12, main = "MA(2) phi[1] = -0.1 y  phi[2] = -0.2")
acf(MA2.13, main = "MA(2) phi[1] = 0.4 y  phi[2] = 0.3")
acf(MA2.14, main = "MA(2) phi[1] = 0.4 y  phi[2] = 0.1")
acf(MA2.15, main = "MA(2) phi[1] = 0.4 y  phi[2] = -0.1")
acf(MA2.16, main = "MA(2) phi[1] = 0.4 y  phi[2] = -0.3")
dev.off()

# Grafica PAFC 

graphics.off()
png(filename = "PAFCGraphMA2.png")
par(mfrow = c(4,4))
pacf(MA2.1, main = "MA(2) phi[1] = 0.1 y  phi[2] = 0.2")
pacf(MA2.2, main = "MA(2) phi[1] = 0.1 y  phi[2] = 0.1")
pacf(MA2.3, main = "MA(2) phi[1] = 0.1 y  phi[2] = -0.1")
pacf(MA2.4, main = "MA(2) phi[1] = 0.1 y  phi[2] = -0.2")
pacf(MA2.5, main = "MA(2) phi[1] = 0.2 y  phi[2] = 0.2")
pacf(MA2.6, main = "MA(2) phi[1] = 0.2 y  phi[2] = 0.1")
pacf(MA2.7, main = "MA(2) phi[1] = 0.2 y  phi[2] = -0.1")
pacf(MA2.8, main = "MA(2) phi[1] = 0.2 y  phi[2] = -0.2")
pacf(MA2.9, main = "MA(2) phi[1] = -0.1 y  phi[2] = 0.2")
pacf(MA2.10, main = "MA(2) phi[1] = -0.1 y  phi[2] = 0.1")
pacf(MA2.11, main = "MA(2) phi[1] = -0.1 y  phi[2] = -0.1")
pacf(MA2.12, main = "MA(2) phi[1] = -0.1 y  phi[2] = -0.2")
pacf(MA2.13, main = "MA(2) phi[1] = 0.4 y  phi[2] = 0.3")
pacf(MA2.14, main = "MA(2) phi[1] = 0.4 y  phi[2] = 0.1")
pacf(MA2.15, main = "MA(2) phi[1] = 0.4 y  phi[2] = -0.1")
pacf(MA2.16, main = "MA(2) phi[1] = 0.4 y  phi[2] = -0.3")
dev.off()