# Proyecto Final de Estadísticas

## Descripción del Proyecto

1. Datos  
   Cada grupo recibirá un conjunto de datos que contiene 100 observaciones de 9 variables. Las observaciones o unidades muestrales corresponden a empresas, y las variables están relacionadas a aspectos económicos, las cuales son:
   - y = ventas de la empresa durante el periodo de estudio, en miles de dólares.
   - x1 = índice económico, que estudia la salud de la economía en el periodo de estudio.
   - x2 = número de canales de venta que utiliza la empresa.
   - x3 = presupuesto para publicidad en televisión durante el periodo de estudio, en miles de dólares.
   - x4 = número de promociones hechas por la empresa durante el periodo de estudio.
   - x5 = presupuesto para publicidad en radio durante el periodo de estudio, en miles de dólares.
   - x6 = estrato de la población a la que están dirigidos predominantemente los productos de la empresa.
   - x7 = presupuesto para publicidad en redes sociales durante el periodo de estudio, en miles de dólares.
   - x8 = presupuesto para publicidad en medios impresos durante el periodo de estudio, en miles de dólares.

2. Trabajo asignado  
   - Realizar un análisis descriptivo de los datos.
   - Utilizar intervalos de confianza y/o pruebas de hipótesis para sacar conclusiones acerca de los presupuestos asignados para televisión, radio, redes sociales y medios impresos.
   - Realizar un grafo de dispersión y una matriz de correlación de las variables.
   - Realizar una prueba de bondad de ajuste para determinar si la variable y se distribuye en forma normal.
   - Encontrar el modelo de regresión simple que mejor se ajuste a los datos, donde y es la variable dependiente.
   - Hallar un modelo lineal que explique mejor la variable y. Incluir todas las pruebas necesarias para llegar a este modelo, así como un análisis de residuos.
   - Con los datos de "datos_predicción.txt" hacer una predicción de la variable y (con el mejor modelo) y generar un histograma, diagrama de cajas y resumen estadístico de los residuos de predicción (valor observado vs. predicción del modelo) para concluir respecto al poder predictivo del modelo.
   - Realizar un análisis de varianza para estudiar si existen diferencias entre las ventas medias de las empresas de acuerdo al estrato.
   - En el caso de conseguir diferencias significativas, realizar pruebas de medias para determinar cuáles son las medias que difieren.

# Proyecto Final de Estadísticas

Este proyecto contiene un conjunto de análisis estadísticos realizados con R para evaluar distintas variables de un estudio. Se incluyen análisis descriptivos, intervalos de confianza, análisis de gráficos de dispersión y correlación, pruebas de bondad de ajuste, análisis ANOVA, modelos de regresión lineal y procesos de predicción.

## Estructura del Proyecto

- **1.analisis_descriptivo**  
  Contiene el script `AnalisisDescriptivo.R` para generar histogramas, diagramas de caja y medidas resumidas de las variables.

- **2.intervalos_confianza**  
  Script `IntervalosConfianza.R` para calcular intervalos de confianza del 95% para diversas clases de publicidad.

- **3.graficos_dispersion_correlacion**  
  Script `GraficoDispersionCorrelacion.R` que genera gráficos de dispersión y una matriz de correlación utilizando `ggpairs`.

- **4.ajuste_bondad**  
  Script `AjusteBondad.R` que realiza un análisis de ajuste de bondad utilizando gráficos QQ-Norm y la prueba Chi-cuadrado.

- **5. 6.modelos_lineales**  
  Script `ModelosLinealesError.R` para ajustar modelos de regresión lineal simple y múltiple, además de analizar residuos y gráficos diagnósticos.

- **7. prediccion**  
  Incluye el script `modelo_prediccion` que muestra la construcción y evaluación iterativa del mejor modelo predictivo, junto con gráficos comparativos y análisis de residuos.  
  También se encuentra un README con una descripción paso a paso de la selección de variables.

- **8.ANOVA**  
  Script `anova.R` para realizar análisis de varianza (ANOVA) considerando la variable categórica `x6`.

- **Datos y Recursos**  
  - `Datos_ProyectoP7.txt`: Archivo con las variables originales del estudio.
  - `datos_predicción.txt`: Archivo de datos utilizado para la predicción.

## Requisitos y Ejecución

- Se requiere R y las librerías: `ggplot2` y `GGally`.
- Asegúrese de que las rutas de los archivos de datos sean correctas.
- Los scripts guardan los gráficos en la carpeta `imagenes`.

