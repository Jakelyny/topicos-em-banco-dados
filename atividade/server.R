library(shiny)

setwd("C:\db-laza\atividade")
source("functions.R")
shinyServer(function(input, output) {
## funcao chamada cada vez que ocorre uma mudanca na tela
dados <- reactive({
estacao=input$local
variavel=input$variavel
gerarDados(estacao,variavel)
})
output$saidaPlot <- renderPlot({
dados <- dados() # chamada a funcao dados
plot(dados$valor~dados$data, xlab = "Data", ylab = c(input$variavel),
main=c("Grafico ",input$variavel),type="p")
})
dadosLocais <- reactive ({
withProgress(message = 'Recuperando dados....', value = 0, {
locais()
})
})
output$selectLocais= renderUI({
dt <- dadosLocais()
choices = setNames(dt$estacao,paste(dt$estacao))
selectInput(inputId = "local", label = h4("Locais:"), choices =
choices)
})
dadosVariaveis <- reactive ({
withProgress(message = 'Recuperando dados....', value = 0, {
variaveis()
})
})
output$selectVariavel= renderUI({
dt <- dadosVariaveis()
choices = dt
selectInput(inputId = "variavel", label = h4("Variaveis:"), choices =
choices)
})
})