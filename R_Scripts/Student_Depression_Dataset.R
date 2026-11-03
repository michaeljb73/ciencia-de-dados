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

# 6. Retornando a quantidade de ocorrências de um valor e
# uma coluna(campo)
generos <- table(dados$Gender)
class(generos) # Tipo da variável

print("Total de mulheres e homens participantes da pesquisa:")
print(generos)
cat("Total de mulheres: ",generos["Female"])
