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

# Directorio para guardar gráficos: usar el directorio actual
img_dir <- "./imagenes"

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
