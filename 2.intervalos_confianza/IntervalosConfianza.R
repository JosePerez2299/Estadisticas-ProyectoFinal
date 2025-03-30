# Leer los datos (ajustando la ruta relativa)
Datos_ProyectoP7 <- read.delim("./Datos_ProyectoP7.txt", header = TRUE)  # nolint

y <- Datos_ProyectoP7$y
x1 <- Datos_ProyectoP7$x1
x2 <- Datos_ProyectoP7$x2
x3 <- Datos_ProyectoP7$x3
x4 <- Datos_ProyectoP7$x4
x5 <- Datos_ProyectoP7$x5
x6 <- Datos_ProyectoP7$x6
x7 <- Datos_ProyectoP7$x7
x8 <- Datos_ProyectoP7$x8

# Intervalos de confianza 95% para cada clase de publicidad
alfa <- 1 - 0.95
n <- length(y)
cuantil <- qnorm(1 - alfa / 2)

# Publicidad en TV (x3)
LIx3 <- mean(x3) - cuantil * sqrt(var(x3) / n)
LSx3 <- mean(x3) + cuantil * sqrt(var(x3) / n)
Intervalox3 <- c(LIx3, LSx3)

# Publicidad de radio (x5)
LIx5 <- mean(x5) - cuantil * sqrt(var(x5) / n)
LSx5 <- mean(x5) + cuantil * sqrt(var(x5) / n)
Intervalox5 <- c(LIx5, LSx5)

# Publicidad en redes sociales (x7)
LIx7 <- mean(x7) - cuantil * sqrt(var(x7) / n)
LSx7 <- mean(x7) + cuantil * sqrt(var(x7) / n)
Intervalox7 <- c(LIx7, LSx7)

# Publicidad en medios impresos (x8)
LIx8 <- mean(x8) - cuantil * sqrt(var(x8) / n)
LSx8 <- mean(x8) + cuantil * sqrt(var(x8) / n)
Intervalox8 <- c(LIx8, LSx8)

# Imprimir resultados
print("Intervalo de confianza para publicidad en TV (x3):")
print(Intervalox3)
print("Intervalo de confianza para publicidad de radio (x5):")
print(Intervalox5)
print("Intervalo de confianza para publicidad en redes sociales (x7):")
print(Intervalox7)
print("Intervalo de confianza para publicidad en medios impresos (x8):")
print(Intervalox8)