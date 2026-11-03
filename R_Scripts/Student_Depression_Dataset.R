# 1. Instalar e importar a biblioteca tidyverse
library('tidyverse')
library("dplyr")

# 2. Definir o local de trabalho
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')
getwd() # Retorna o local de trabalho
list.files()

# 3. Ler os dados em arquivo CSV
dados <- read.csv('./Data_sets/Student_Depression_Dataset.csv')

print(dados)

# 4. Verivicando se existem dados NA

# 4.1. Saber se há algum dado NA no conjunto de dados (retorna TRUE ou FALSE)
anyNA(dados)

# 5. Exibir apenas os campos da tabela
names(dados) # ou colnames(dados)

# 5.1. Exibir os tipos de dados da coluna
as.data.frame(sapply(dados, class)) # Exibição mais simples sapply(dados, class)

# 6. Contando os dados
generos <- table(dados$Gender)

# 6.1. Identificando o tipo de dado retornado pela
# função table()
class(generos) # Tipo da variável

# 6.2. Total de participantes por gênero
print(generos)
cat("Total de mulheres: ",generos["Female"])

# 6.3. Dados estatísticos sobre o campo Age

# Medidas de centralidade e posição
# Método de visualização 1
dados |>
  summarise(
    media = mean(dados$Age),
    mediana = median(dados$Age),
    quartil = quantile(dados$Age,  probs = 0.75),
    total_linhas = n()
  )

# Método de visualização 2
metricas <- dados |>
  summarise(
    media = mean(dados$Age),
    mediana = median(dados$Age),
    quartil = quantile(dados$Age,  probs = 0.75),
    total_linhas = n()
  )

glimpse(metricas)
