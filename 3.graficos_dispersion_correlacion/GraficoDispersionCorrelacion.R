# Leer los datos (ajustando la ruta relativa)
Datos_ProyectoP7 <- read.delim("./Datos_ProyectoP7.txt", header = TRUE)  # nolint

# Definir variables
y <- Datos_ProyectoP7$y; x1 <- Datos_ProyectoP7$x1; x2 <- Datos_ProyectoP7$x2; 
x3 <- Datos_ProyectoP7$x3; x4 <- Datos_ProyectoP7$x4; x5 <- Datos_ProyectoP7$x5; 
x7 <- Datos_ProyectoP7$x7; x8 <- Datos_ProyectoP7$x8

# Usar el directorio actual para guardar el gráfico
img_dir <- "./imagenes"

# Matriz de correlación
mat_cor <- cor(Datos_ProyectoP7[, c("y", "x1", "x2", "x3", "x4", "x5", "x7", "x8")])

# Gráfico de dispersión y correlación
png(filename = file.path(img_dir, "3_grafico_dispersion_correlacion.png"), width = 800, height = 800)
library(ggplot2)   # Librería instalada
library(GGally)    # Librería instalada
plot_obj <- ggpairs(Datos_ProyectoP7, 
    columns = c("y", "x1", "x2", "x3", "x5", "x7", "x8"),
    columnLabels = c("Ventas", 
                     "Índice Económico", 
                     "Canales de Venta", 
                     "TV", 
                     "Radio", 
                     "Redes Sociales", 
                     "Medios Impresos")
)
plot_obj <- plot_obj + labs(title = "Gráfico de dispersión y correlación", subtitle = "Representación de la relación entre las variables del estudio")
print(plot_obj)
dev.off()