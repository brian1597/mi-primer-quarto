# Agent Rules Standard (AGENTS.md):
# Instrucciones personalizadas para este proyecto

## Programación en R

Para todo código R en este proyecto:

1. **Evitar crear data.frames intermedios** - No guardar resultados en objetos temporales
2. **Usar pipes `%>%`** para encadenar operaciones y relacionar objetos
3. **Estilo tidyverse/dplyr** - aplicar transformaciones en cadena sin asignar a variables intermedias

### Ejemplo

En lugar de:
```r
df <- filter(data, x > 5)
df <- mutate(df, y = x * 2)
result <- select(df, y)
```

Usar:
```r
data %>% 
  filter(x > 5) %>% 
  mutate(y = x * 2) %>% 
  select(y)
```
