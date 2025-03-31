# Leer los datos (ajustando la ruta relativa)
Datos_ProyectoP7 <- read.delim("./Datos_ProyectoP7.txt", header = TRUE)  # nolint

y  <- Datos_ProyectoP7$y
x1 <- Datos_ProyectoP7$x1
x2 <- Datos_ProyectoP7$x2
x3 <- Datos_ProyectoP7$x3
x4 <- Datos_ProyectoP7$x4
x5 <- Datos_ProyectoP7$x5
x7 <- Datos_ProyectoP7$x7
x8 <- Datos_ProyectoP7$x8

#Modelo de regresion simple y,x3,x5,x7,x8

modeloyx1 <- lm(y~x1)
summary(modeloyx1)
modeloyx2 <- lm(y~x2)
summary(modeloyx2)
modeloyx3 <- lm(y~x3)
summary(modeloyx3)
modeloyx4 <- lm(y~x4)
summary(modeloyx4)
modeloyx5 <- lm(y~x5)
summary(modeloyx5)
modeloyx7 <- lm(y~x7)
summary(modeloyx7) #el mejor modelo de acuerdo al R^2 
modeloyx8 <- lm(y~x8)
summary(modeloyx8)

#Modelo lineal multiple y,x1,x2,x3,x4,x5,x7,x8

modelo1 <-  lm(y ~ x1+x2+x3+x4+x5+x7+x8)
summary(modelo1)

#Elimino x3

modelo2 <-  lm(y ~ x1+x2+x4+x5+x7+x8)
summary(modelo2)

#Elimino x1

modelo3 <-  lm(y ~ x2+x4+x5+x7+x8)
summary(modelo3)

#Elimino x4

modelo4 <-  lm(y ~ x2+x5+x7+x8)
summary(modelo4)

#Elimino x5

modelo5 <-  lm(y ~ x2+x7+x8)
summary(modelo5)

#Elimino x8

modelo6 <-  lm(y ~ x2+x7)
summary(modelo6)
