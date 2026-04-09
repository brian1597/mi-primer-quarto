
# ---------------------------------------------------------------
# Autor: Brian Ruiz
# Proyecto: Tablero de Ventas
# Fecha: 2026-03-27
# ---------------------------------------------------------------

# Código para el archivo SERVER


server <- function(input, output, session) {
  
  # Lógica para el gráfico
  output$graficoPrincipal <- renderPlot(
    {
      # Creación de gráfico de barras por país
      datos %>% group_by(pais) %>%
        summarise(ventas = sum(ventas)) %>%
        mutate(porcentaje = percent(ventas/sum(ventas),1)) %>%
        # Identificamos los ejes de la variable, no importa si vas a hacer
        # un gráfico de barras o de columnas, porque al final lo puedes girar.
        ggplot(aes(x = pais, y = ventas, fill = pais,
                   label = paste(porcentaje,"\n",ventas," ")))+
        geom_col()+
        # Estos ajustes de vjust y hjust funcionan muy bien, sin embargo, los puedes ajustar.
        geom_text(vjust = 0.5, hjust = -0.1, size = 3,position = position_dodge(width = 1))+
        # Esta línea ayudará a que las etiquetas de cada barra no se corten por el tamaño de la gráfica.
        # pues con ella se hace que el eje sea un 10% más grande que el valor máximo.
        ## ☢️🚧 scale_y_continuous(limits = c(0, max(datos$n) * 1.1)) +
        labs(x = "Nombre_Eje_X", y = "Nombre_Eje_X",
             title = str_wrap("Cantidad y porcentaje de CONTINUACION DEL TITULO ",width = 30),
             caption="Texto informativo en la parte inferior derecha.")+
        theme(plot.title = element_text(size=15, face='bold', color="#525252", hjust=0.5))+
        # Con esto se evita el cuadro de la leyenda.
        theme(legend.position="none")+
        # Tamaño del texto de los ejes.
        theme(axis.text.y = element_text(size = 8))+
        theme(axis.text.x = element_text(size = 10))+
        # Hace que se ajuste el largo de los textos del eje X,
        # para que no se superpongan.
        scale_x_discrete(labels = function(x) str_wrap(x, width = 20))+
        # Una paleta de colores recomendad, pero puedes cambiarla.
        scale_fill_manual(values = c("#2171b5",
                                     "#4292c6","#74a9cf",
                                     "#41b6c4","#7fcdbb","#238b45",#"#41ab5d",
                                     "#78c679","#c7e9b4","#edf8b1","#fee391","#fec44f",
                                     "#fe9929","#ec7014"))
      # Con el coord_flip() se puede girar las barras a horizontal.
      #coord_flip()
  })
  
  # Lógica para la tabla
  output$tabla_paises <- DT::renderDataTable(
    {
      datos %>% group_by(pais) %>%
        summarise(ventas = sum(ventas)) %>%
        rename("País" = pais, "Ventas" = ventas) %>%
        datatable(
          extensions = 'Buttons', # Activa la extensión de botones
          options = list(
            dom = 'Bfrtip',       # Define la posición de los elementos (B = Buttons)
            buttons = list(
              list(
                extend = 'excel',
                text = 'Descargar Excel',
                title = 'Reporte de Ventas por País'
              )
            ),
            language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Spanish.json') # Opcional: Idioma español
          )
        ) %>%
        # 3. Formateo de moneda ($) y miles (.)
        formatCurrency(
          columns = 'Ventas',
          currency = '$',
          interval = 3,
          mark = '.',
          digits = 0
        )

    }
  )  

}

