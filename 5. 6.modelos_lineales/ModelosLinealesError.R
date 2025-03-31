# Leer los datos (ajustando la ruta relativa)
Datos_ProyectoP7 <- read.delim("./Datos_ProyectoP7.txt", header = TRUE)  # nolint

y  <- Datos_ProyectoP7$y
x3 <- Datos_ProyectoP7$x3
x5 <- Datos_ProyectoP7$x5
x7 <- Datos_ProyectoP7$x7
x8 <- Datos_ProyectoP7$x8

# Modelos de regresión simple
modelo_yx3 <- lm(y ~ x3)
summary(modelo_yx3)
modelo_yx5 <- lm(y ~ x5)
summary(modelo_yx5)
modelo_yx7 <- lm(y ~ x7)
summary(modelo_yx7)
modelo_yx8 <- lm(y ~ x8)
summary(modelo_yx8)

# Modelo lineal múltiple
modelo1 <- lm(y ~ x3 + x5 + x7 + x8)
summary(modelo1)

# Eliminación de variables
modelo2 <- lm(y ~ x5 + x7 + x8)
summary(modelo2)
modelo3 <- lm(y ~ x5 + x7)
summary(modelo3)  # Modelo aceptado

# Modelo final y análisis de errores
modelo_final <- modelo3
residuos  <- resid(modelo_final)
ajustados <- fitted(modelo_final)

# Usar el directorio actual para guardar gráficos
img_dir <- "./imagenes"

# Gráfico de residuos vs valores ajustados
png(filename = file.path(img_dir, "5-6_residuos_vs_valores_ajustados.png"), width = 800, height = 600)
plot(ajustados, residuos, main = "Residuos vs Valores Ajustados", 
     xlab = "Valores Ajustados", ylab = "Residuos", pch = 19, col = "blue")
abline(h = 0, col = "red", lwd = 2)
dev.off()

# Histograma de residuos
png(filename = file.path(img_dir, "5-6_histograma_residuos.png"), width = 800, height = 600)
hist(residuos, main = "Histograma de Residuos", xlab = "Residuos", 
     col = "lightgreen", border = "black")
dev.off()

# QQ-plot de residuos
png(filename = file.path(img_dir, "5-6_qqplot_residuos.png"), width = 800, height = 600)
qqnorm(residuos, main = "QQ-Plot de Residuos", pch = 19, col = "darkblue")
qqline(residuos, col = "red", lwd = 2)
dev.off()

# Guardar los 4 gráficos de diagnóstico del modelo final
png(filename = file.path(img_dir, "5-6_diagnosticos_modelo_final.png"), width = 800, height = 800)
par(mfrow = c(2, 2))
plot(modelo_final)
dev.off()
print(summary(modelo_final))