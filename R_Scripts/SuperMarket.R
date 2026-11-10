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

# A função as.data.frame() na linguagem R serve para converter (coercion)
# outros tipos de objetos do R (como matrizes, listas, vetores ou tibbles)
# em um data frame, ou para verificar e adaptar estruturas existentes.
market_data_df <- as.data.frame(market_data)

# No R, a função View() (com V maiúsculo) é usada para abrir uma planilha
# interativa em formato de tabela para inspecionar data frames, matrizes ou
# outras estruturas retangulares.
View(market_data_df)

# A função anyNA() na linguagem R é usada para verificar se um objeto
# (como um vetor, matriz ou data frame) contém valores
# ausentes (NA: Not Available)
valores_indisponiveis <- anyNA(market_data)

# No R, a função names() serve para consultar (ver) ou definir (alterar)
# os nomes dos elementos de um objeto (como vetores, listas e data frames).
names(market_data_df)

# A função sapply() no R serve para aplicar uma função a cada elemento
# de uma lista, vetor ou data frame e simplificar o resultado
# (tentando transformá-lo automaticamente em um vetor
# ou matriz, em vez de uma lista).No R, a função class() serve para
# identificar ou definir a classe de um objeto, indicando ao R que tipo
# de estrutura de dados ele é e como as funções e operadores devem manipulá-lo.
market_data_types_df <- as.data.frame(sapply(market_data_df, class))

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