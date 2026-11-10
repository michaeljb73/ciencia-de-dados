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

# Existem dados NA(Not Available)
anyNA(market_data)

# Exibir nomes dos campos
names(market_data)

# Exibir nomes dos campos e seus tipos
as.data.frame(sapply(market_data, class))

###############################################################################


###############################################################################
#                                ESTATÍSTICAS                                 #
#                 Medidas estatísticas, totais e porcentagens                 #
###############################################################################

# Quantos de cada tipos de clientes temos?
table(market_data$Customer.type)
customers <- table(market_data$Customer.type)

member_customer <- customers['Member']
normal_customer <- customers['Normal']

# Percentuais
percentuais <- round(prop.table(customers) * 100, digits =2)

# Criando um vetor semelhante a um dicionário ou json
vetor_percentuais <- setNames(as.vector(percentuais), names(percentuais))

# cat(percentuais['Member'],"% dos clientes são membros(",member_customer,"), enquanto ",percentuais['Normal'],"% são clientes normais(",normal_customer,").")
sprintf("%.2f%% dos clientes são membros(%.d), enquanto %.2f%% são normais %.d",percentuais['Member'],member_customer,percentuais['Normal'],normal_customer)

###############################################################################

# Quantos clientes existem por gênero?
# Quantos produtos por linha?
# Total de vendas por cidade?
# Qual a cidade que mais vendeu?
# Qual forma de pagamento foi mais utilizada no total e por mês?
# Qual a linha de produto mais vendida em quantidade, em valor, geral e mensal?
# Quais os produtos mais bem avaliados, geral e por mês?
# Quais as linhas produtos mais bem avaliadas, geral e por mês?
# Quais os produtos e suas linhas mais consumidos por homens e mulheres?