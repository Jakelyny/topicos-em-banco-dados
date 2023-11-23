library(shiny)
#setwd("/Users/alexandretagliarilazzaretti/Library/Mobile Documents/com~apple~CloudDocs/Lazzaretti/aulas/IFSUL/aulas/2023/2o Semestre/03-TBD/Linguagem R/Exemplos/exemplo1")
#source("functions.R")
#inicializando os valores
elementos <- 10
valorInicial <- 1
valorFinal <- 30
shinyUI(fluidPage(
  titlePanel("Hello Shiny!"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("tipoPlot", "Tipo do Plot",
                   c("Ponto"="p", "Linha"="l")
      ), 
      numericInput("elementos", "Numero de elementos", value = elementos),
      numericInput("valorInicial", "Valor Inicial", value = valorInicial),
      numericInput("valorFinal", "Valor Final", value = valorFinal)
    ),
    mainPanel(
      plotOutput("saida")
    )
  )   
))