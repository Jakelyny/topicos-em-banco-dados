library(DBI)
library(RPostgres)
library(dygraphs)
library(xts)
library(ggplot2)
library(plotly)
pdbbanco <- "simposio"
pdbuser <- "postgres"
pdbpassword <- "senha"
pdbhost <- "localhost"
pdbport <- "5432"
executaConsulta <- function(sql){
con <- dbConnect(RPostgres::Postgres(), user=pdbuser,
dbname=pdbbanco,
password=pdbpassword,
host=pdbhost,port=pdbport)
rs = dbSendQuery(con,sql)
df <- dbFetch(rs)
dbClearResult(rs)
dbDisconnect(con)
return (df)
}
gerarDados<-function(p_estacao, p_variavel)
{
sql <- sprintf("select data, %s as valor from clima where
estacao=%s",p_variavel,p_estacao)
dados_clima <- executaConsulta(sql)
#dados_clima=subset(dados_clima,estacao==p_estacao,c(data,tmin))
return(dados_clima)
}
locais<-function()
{
sql <- sprintf("select estacao from clima group by estacao order by
estacao")
dados_locais <- executaConsulta(sql)
return(dados_locais)
}
variaveis<-function()
{
dados_variaveis=c("tmin","tmax","precip")
dados_variaveis=data.frame(dados_variaveis)
colnames(dados_variaveis) <- c('variavel')
return(dados_variaveis)
}
variaveis_tabela<-function()
{
sql <- sprintf("select * from variaveis")
dados_variaveis <- executaConsulta(sql)
return(dados_variaveis)
}
gerarDados_1<- function(elementos, valorInicial, valorFinal){
x <- seq(1:elementos)
y <- runif(elementos, valorInicial, valorFinal)
df <- data.frame(y,x)
return (df)
}