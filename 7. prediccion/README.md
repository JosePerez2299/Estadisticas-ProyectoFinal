Se realizó un proceso paso a paso para identificar el mejor modelo predictivo. En cada iteración se eliminó la variable con mayor p-valor, evaluando el impacto en el ajuste del modelo.

| Paso | Variable Eliminada | p-valor | Variables en el modelo |
| :---- | :---- | :---- | :---- |
| 1 | x4 | 0.759 | x1, x2, x3, x5, x7, x8 |
| 2 | x5 | 0.438 | x1, x2, x3, x7, x8 |
| 3 | x3 | 0.2027 | x1, x2, x7, x8 |
| 4 | x2 | 0.200272 | x1, x7, x8 |
| 5 | x1 | 0.242951 | x7, x8 |
| 6 | x8 | 0.24105 | x7 |

## Tabla del Modelo Final

El modelo final obtenido es: 

**Ecuación:** $$ y = 103.5631 + 1.0133 \, x_7 $$

### Coeficientes

| Término | Estimate | Std. Error | t value | p-valor |
| :---- | :---- | :---- | :---- | :---- |
| (Intercept) | 103.5631 | 12.3625 | 8.377 | 5.96e-11 |
| x7 | 1.0133 | 0.1231 | 8.231 | 9.88e-11 |

### Resumen del Ajuste

| Métrica | Valor |
| :---- | :---- |
| Error Estándar Residual | 9.666 |
| Grados de Libertad | 48 |
| R² Múltiple | 0.5853 |
| R² Ajustado | 0.5767 |
| F-Estadístico | 67.75 |
| p-valor (F-test) | 9.882e-11 |
