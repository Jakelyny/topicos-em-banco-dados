library(shiny)
setwd("C:\db-laza\atividade")
#inicializando os valores
estacao <- 49
variavel <- "tmin"
shinyUI(fluidPage(
titlePanel("Hello Shiny ex03!"),
sidebarLayout(
sidebarPanel(
uiOutput('selectLocais'),
uiOutput('selectVariavel'),
width = 3
),
mainPanel(
tabsetPanel(type = "tabs",
tabPanel("Plot", plotOutput("saidaPlot"))
)
)
)
))