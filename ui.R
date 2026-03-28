library(shiny)
library(shinydashboard)
library(DT)

ui <- dashboardPage(
  # 1. Encabezado del Tablero
  dashboardHeader(title = "Tablero de Ventas"),
 
  # 2. Barra lateral (puedes dejarla vacía por ahora o añadir filtros)
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
    )
  ),
 
  # 3. Cuerpo del Tablero
  dashboardBody(
    tabItems(
      tabItem(tabName = "dashboard",
             
              # Fila 1: La Gráfica
              fluidRow(
                box(
                  title = "Distribución de Ventas por País",
                  status = "primary",
                  solidHeader = TRUE,
                  width = 12, # Ancho completo
                  plotOutput("graficoPrincipal", height = "450px")
                )
              ),
             
              # Fila 2: La Tabla
              fluidRow(
                box(
                  title = "Detalle de Datos y Descarga",
                  status = "info",
                  solidHeader = TRUE,
                  width = 12,
                  DT::dataTableOutput("tabla_paises")
                )
              )
      )
    )
  )
)