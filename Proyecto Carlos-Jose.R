# Proyecto Estadistica
# Carlos Ochoa Jose Perez

# Crear carpeta para guardar todos los gráficos
img_dir <- "c:/Users/josej/Documents/proyecto_final_estadisticas/imagenes"
if (!dir.exists(img_dir)) {
  dir.create(img_dir, recursive = TRUE)
}

# Datos del lab

Datos_ProyectoP7 <- read.delim("./Datos_ProyectoP7.txt", header = T) # nolint

y <- Datos_ProyectoP7$y
x1 <- Datos_ProyectoP7$x1
x2 <- Datos_ProyectoP7$x2
x3 <- Datos_ProyectoP7$x3
x4 <- Datos_ProyectoP7$x4
x5 <- Datos_ProyectoP7$x5
x6 <- Datos_ProyectoP7$x6
x7 <- Datos_ProyectoP7$x7
x8 <- Datos_ProyectoP7$x8

# histogramas de frecuencia

png(filename = file.path(img_dir, "1_histogramas_frecuencia.png"), width = 800, height = 600)
par(mfrow = c(2, 4))
hist(y, main = "Histograma de y", ylab = "Frecuencia", xlab = "y")
hist(x1, main = "Histograma de x1", ylab = "Frecuencia", xlab = "x1")
hist(x2, main = "Histograma de x2", ylab = "Frecuencia", xlab = "x2")
hist(x3, main = "Histograma de x3", ylab = "Frecuencia", xlab = "x3")
hist(x4, main = "Histograma de x4", ylab = "Frecuencia", xlab = "x4")
hist(x5, main = "Histograma de x5", ylab = "Frecuencia", xlab = "x5")
hist(x7, main = "Histograma de x7", ylab = "Frecuencia", xlab = "x7")
hist(x8, main = "Histograma de x8", ylab = "Frecuencia", xlab = "x8")
dev.off()

# Diagramas de caja

png(filename = file.path(img_dir, "2_diagramas_caja.png"), width = 800, height = 600)
par(mfrow = c(2, 4))
boxplot(y, col = "yellow", horizontal = F, xlab = "y")
boxplot(x1, col = "blue", horizontal = F, xlab = "x1")
boxplot(x2, col = "red", horizontal = F, xlab = "x2")
boxplot(x3, col = "orange", horizontal = F, xlab = "x3")
boxplot(x4, col = "green", horizontal = F, xlab = "x4")
boxplot(x5, col = "purple", horizontal = F, xlab = "x5")
boxplot(x7, col = "white", horizontal = F, xlab = "x7")
boxplot(x8, col = "gray", horizontal = F, xlab = "x8")
dev.off()

# Analisis descriptivo

media <- c(mean(y), mean(x1), mean(x2), mean(x3), mean(x4), mean(x5), mean(x7), mean(x8))
medianas <- c(median(y), median(x1), median(x2), median(x3), median(x4), median(x5), median(x7), median(x8))
des_est <- c(sd(y), sd(x1), sd(x2), sd(x3), sd(x4), sd(x5), sd(x7), sd(x8))
minimo <- c(min(y), min(x1), min(x2), min(x3), min(x4), min(x5), min(x7), min(x8))
maximo <- c(max(y), max(x1), max(x2), max(x3), max(x4), max(x5), max(x7), max(x8))

# Intervalos de confianza 95% para cada clase de publicidad

alfa <- 1 - 0.95
n <- length(y)
cuantil <- qnorm(1 - alfa / 2)

# Publicidad en TV(x3)

LIx3 <- mean(x3) - cuantil * sqrt(var(x3) / n)
LSx3 <- mean(x3) + cuantil * sqrt(var(x3) / n)
Intervalox3 <- c(LIx3, LSx3)

# Publicidad de radio(x5)

LIx5 <- mean(x5) - cuantil * sqrt(var(x5) / n)
LSx5 <- mean(x5) + cuantil * sqrt(var(x5) / n)
Intervalox5 <- c(LIx5, LSx5)

# Publicidad en redes sociales(x7)

LIx7 <- mean(x7) - cuantil * sqrt(var(x7) / n)
LSx7 <- mean(x7) + cuantil * sqrt(var(x7) / n)
Intervalox7 <- c(LIx7, LSx7)

# Publicidad en medios impresos(x8)

LIx8 <- mean(x8) - cuantil * sqrt(var(x8) / n)
LSx8 <- mean(x8) + cuantil * sqrt(var(x8) / n)
Intervalox8 <- c(LIx8, LSx8)

# Matriz de correlacion

mat_cor <- cor(Datos_ProyectoP7[, c("y", "x1", "x2", "x3", "x4", "x5", "x7", "x8")])

# Grafico de dispersion y correlacion

png(filename = file.path(img_dir, "3_grafico_dispersion_correlacion.png"), width = 800, height = 600)
library(ggplot2) # Libreria instalada
library(GGally) # Libreria instalada
plot_obj <- ggpairs(Datos_ProyectoP7, columns = c("y", "x1", "x2", "x3", "x5", "x7", "x8"))
print(plot_obj)
dev.off()

# Ajuste de bondad (y)

hist(y, plot = F)
r <- 2
frec_y <- c(2, 11, 17, 31, 22, 12, 5)
png(filename = file.path(img_dir, "4_qqnorm_ajuste_bondad.png"), width = 800, height = 600)
qqnorm(y, main = "QQ-Norm para Ajuste de Bondad", pch = 19, col = "darkblue")
qqline(y, col = "red", lwd = 2)
dev.off()
ky <- length(frec_y)
ny <- sum(frec_y)
my <- c(175, 185, 195, 205, 215, 225, 235)
xbar <- sum(frec_y * my) / ny
x_bar <- rep(xbar, ky)
s2 <- sum(frec_y * (my - x_bar)^2) / (n - 1)
s <- sqrt(s2)
py <- pnorm(18:24 * 10, xbar, s) - pnorm(17:23 * 10, xbar, s)
chi2_obs <- sum((frec_y - ny * py)^2 / (ny * py))
chi2_alpha <- qchisq(1 - alfa, ky - 1 - r)
p_valor <- 1 - pchisq(chi2_obs, ky - 1 - r)

# Modelo de regresion simple y,x3,x5,x7,x8

modeloyx3 <- lm(y ~ x3)
summary(modeloyx3)
modeloyx5 <- lm(y ~ x5)
summary(modeloyx5)
modeloyx7 <- lm(y ~ x7)
summary(modeloyx7) # el mejor modelo de acuerdo al R^2
modeloyx8 <- lm(y ~ x8)
summary(modeloyx8)

# Modelo lineal multiple y,x3,x5,x7,x8

modelo1 <- lm(y ~ x3 + x5 + x7 + x8)
summary(modelo1)

# Eliminamos x3

modelo2 <- lm(y ~ x5 + x7 + x8)
summary(modelo2)

# Eliminamos x8

modelo3 <- lm(y ~ x5 + x7)
summary(modelo3) # modelo aceptado

# Modelo final
modelo_final <- modelo3


# Resumen del modelo final

# Extraer residuos y valores ajustados del modelo final
residuos <- resid(modelo_final)
ajustados <- fitted(modelo_final)
# Se elimina el par(mfrow = c(1, 3)) para generar gráficos individuales

# Guardar gráfico de residuos vs valores ajustados
png(filename = file.path(img_dir, "5_residuos_vs_valores_ajustados.png"))  # Guarda el gráfico con nombre descriptivo
plot(ajustados, residuos, 
     main = "Gráfico de residuos vs valores ajustados", 
     xlab = "Valores Ajustados", 
     ylab = "Residuos",
     pch = 19, col = "blue")
abline(h = 0, col = "red", lwd = 2)
dev.off()  # Cierra el dispositivo gráfico

# Guardar histograma de los residuos
png(filename = file.path(img_dir, "6_histograma_residuos.png"))  # Guarda el histograma con nombre descriptivo
hist(residuos, 
     main = "Histograma de Residuos", 
     xlab = "Residuos", 
     col = "lightgreen", border = "black")
dev.off()  # Cierra el dispositivo gráfico

# Guardar QQ-plot de los residuos
png(filename = file.path(img_dir, "7_qqplot_residuos.png"))  # Guarda el QQ-plot con nombre descriptivo
qqnorm(residuos, main = "QQ-Plot de los Residuos", pch = 19, col = "darkblue")
qqline(residuos, col = "red", lwd = 2)
dev.off()  # Cierra el dispositivo gráfico

# Prueba de Shapiro-Wilk
shapiro_result <- shapiro.test(residuos)
print(shapiro_result)

