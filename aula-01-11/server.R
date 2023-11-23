library(shiny)
setwd("C:/db-laza/aula-01-11")
source("functions.R")

shinyServer(function(input, output) {
  
  output$saida <- renderPlot({
    
    elementos <- input$elementos
    valorInicial <- input$valorInicial
    valorFinal <- input$valorFinal
    tipoPlot <- input$tipoPlot
    
    dados <- gerarDados_1(elementos,valorInicial,valorFinal)
    
    plot(dados$x~dados$y, xlab = "Elementos", ylab = "Valores",
         main="Grafico com geracao de dados aleatorios",type=tipoPlot)    
  })
})