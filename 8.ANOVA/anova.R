# Leer los datos (ajustando la ruta relativa)
datos_prediccion <- read.delim("./datos_predicción.txt", sep = " ", header = TRUE)  # nolint

y <- datos_prediccion$y
x6 <- datos_prediccion$x6

fact <- factor(x6)

medias <- tapply(datos_prediccion$y, fact, mean)

print("Medias por estrato:")
print(medias)

print("Tamaños por estrato:")
print(table(x6))


print(boxplot(y ~ x6,
    main = "Diagrama de Caja de los estratos", 
    xlab = "Estrato", 
    ylab = "Valores de y", 
    col = rainbow(nlevels(fact))
)$stats)


dev.copy(png, filename = "./imagenes/8_boxplot_estratos.png", width = 800, height = 800)
dev.off()

mod.lm <- lm(y ~ fact)
print("Resultados del ANOVA:")
print(anova(mod.lm))