# 1. Instalar e importar a biblioteca tidyverse
library('tidyverse')

# 2. Definir o local de trabalho
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')
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

