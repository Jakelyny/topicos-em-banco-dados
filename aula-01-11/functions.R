gerarDados_1<- function(elementos, valorInicial, valorFinal){
  x <- seq(1:elementos)
  y <- runif(elementos, valorInicial, valorFinal)  
  df <- data.frame(y,x)
  return (df)
}
