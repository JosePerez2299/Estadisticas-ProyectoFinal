# Leer los datos (ajustando la ruta relativa)
Datos_ProyectoP7 <- read.delim("./Datos_ProyectoP7.txt", header = TRUE)  # nolint

# Definir variables
y <- Datos_ProyectoP7$y
# En caso de requerirse n para cálculos posteriores
n <- length(y)

# Usar el directorio actual para guardar el gráfico
img_dir <- "./imagenes"

# Ajuste de bondad
# Se utiliza un conjunto de frecuencias observadas y se genera el QQ-Norm
hist(y, plot = FALSE)
r <- 2
frec_y <- c(2, 11, 17, 31, 22, 12, 5)
png(filename = file.path(img_dir, "4_qqnorm_ajuste_bondad.png"), width = 800, height = 600)
qqnorm(y, main = "QQ-Norm para Ajuste de Bondad", pch = 19, col = "darkblue")
qqline(y, col = "red", lwd = 2)
dev.off()

# Cálculos para la prueba de bondad de ajuste
ky <- length(frec_y)
ny <- sum(frec_y)
my <- c(175, 185, 195, 205, 215, 225, 235)
xbar <- sum(frec_y * my) / ny
x_bar <- rep(xbar, ky)
s2 <- sum(frec_y * (my - x_bar)^2) / (n - 1)
s <- sqrt(s2)
py <- pnorm(18:24 * 10, xbar, s) - pnorm(17:23 * 10, xbar, s)
chi2_obs <- sum((frec_y - ny * py)^2 / (ny * py))
chi2_alpha <- qchisq(1 - (1 - 0.95), ky - 1 - r)
p_valor <- 1 - pchisq(chi2_obs, ky - 1 - r)

# Imprimir resultados
print("Resultado de la prueba de ajuste de bondad:")
print(paste("Chi-cuadrado observado:", chi2_obs))
print(paste("Valor crítico:", chi2_alpha))
print(paste("Valor p:", p_valor))