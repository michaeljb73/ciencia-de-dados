# Carregando bibliotecas
library(tidyverse)
library(dplyr)
library(scales)

###############################################################################

# Instanciando local de trabalho
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')

# Carregando os dados
market_data <- read.csv('./Data_sets/SuperMarket_Analysis.csv')

# Vendo as linhas iniciais dos dados
head(market_data)

# Contando o número de linhas
num_rows <- nrow(market_data)
print(num_rows)

###############################################################################

# Visualizações
as.data.frame(market_data)
View(market_data)

###############################################################################


###############################################################################
#                                ESTATÍSTICAS                                 #
#                 Medidas estatísticas, totais e porcentagens                 #
###############################################################################

# Quantos tipos de clientes temos?
# Quantos clientes existem por gênero ?
# Quantos produtos por linha ?
# Total de vendas por cidade ?
# Qual a cidade que mais vendeu?
# Qual forma de pagamento foi mais utilizada no total e por mês?
# Qual a linha de produto mais vendida em quantidade, em valor, geral e mensal?
# Quais os produtos mais bem avaliados, geral e por mês?
# Quais as linhas produtos mais bem avaliadas, geral e por mês?