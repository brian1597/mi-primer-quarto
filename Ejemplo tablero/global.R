# ---------------------------------------------------------------
# Autor: Brian Ruiz
# Proyecto: Tablero de Ventas
# Fecha: 2026-03-27
# ---------------------------------------------------------------

library(shiny)
library(shinydashboard)
library(DT)
library(dplyr)
library(ggplot2)
library(scales)
library(stringr)
library(janitor)
library(openxlsx)

# datos <- read.xlsx("C:\\Users\\Brian.Ruiz\\OneDrive - Universidad Tecnológica de Pereira\\1. UTP\\2. Introducción a la Ciencia de Datos\\2026-03-27\\Datos\\Base_tecnologia.xlsx")
datos <- read.xlsx("https://docs.google.com/spreadsheets/d/e/2PACX-1vTs-CC_vSsNazKCuLlF8cQZpbPpI1-AYgAyFKB7Z6CyRh_BXWYclZ0ykOy37I7KQg/pub?output=xlsx&authuser=1")
#datos <- read.xlsx("https://docs.google.com/spreadsheets/d/e/2PACX-1vRLYTnqc_ARDjofjUvjZ4X8F1K2aj9cAvOiKE0JTwwcKWr5sSQUqqeP-jcvq6FJkg/pub?output=xlsx")
datos <- datos %>% clean_names()
