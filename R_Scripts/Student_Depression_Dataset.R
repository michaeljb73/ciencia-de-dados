# ╔═╗       ╔═══════╗ ╔═══════╗ ╔═══════╗ ╔═╗     ╔═╗         ╔═══════╗ 
# ║ ║       ║ ╔═════╝ ║ ╔═══╗ ║ ║ ╔═══╗ ║ ║ ╚═══╗ ║ ║         ║ ╔═══╗ ║ 
# ║ ║       ║ ╚═══╗   ║ ╚═══╝ ║ ║ ╚═══╝ ║ ║ ╔═╗ ╚═╝ ║         ║ ╚═══╝ ║ 
# ║ ║       ║ ╔═══╝   ║ ╔═══╗ ║ ║ ╔═╗ ╔═╝ ║ ║ ╚═╗   ║         ║ ╔═╗ ╔═╝ 
# ║ ╚═════╗ ║ ╚═════╗ ║ ║   ║ ║ ║ ║ ║ ╚═╗ ║ ║   ╚═╗ ║         ║ ║ ║ ╚═╗ 
# ╚═══════╝ ╚═══════╝ ╚═╝   ╚═╝ ╚═╝ ╚═══╝ ╚═╝     ╚═╝         ╚═╝ ╚═══╝ 


# 1. Instalar e importar a biblioteca tidyverse
library('tidyverse')
library("dplyr")

###############################################################################
# 2. Definir o local de trabalho
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')
getwd() # Retorna o local de trabalho
list.files()
###############################################################################

###############################################################################
# 3. Ler os dados em arquivo CSV
dados <- read.csv('./Data_sets/Student_Depression_Dataset.csv')
print(dados)
###############################################################################

###############################################################################
# 4. Verivicando se existem dados NA

# 4.1. Saber se há algum dado NA no conjunto de dados (retorna TRUE ou FALSE)

if(!anyNA(dados)) {
  print("Não existem dados NA (Not Available")
} else {
  print("Existem dados NA (Not Available)")
}

# Saber a quantidade de valores ausentes (NA) em cada coluna com
# colSums(is.na(dados). as.data.frame exibe uma melhor formatação.
as.data.frame(colSums(is.na(dados))) # Melhor apresentação dos dados
###############################################################################

###############################################################################
# 5. Exibir apenas os campos da tabela
names(dados) # ou colnames(dados)

# 5.1. Exibir os tipos de dados da coluna
as.data.frame(sapply(dados, class)) # Exibição mais simples sapply(dados, class)
###############################################################################

###############################################################################
# 6. Questões

# a. Qual a quantidade de tipos de genero nos dados apresentados?
generos <- table(dados$Gender) # Dados do campo Generos
print(generos)

# b. Qual o tipo da variável genero?
class(generos) # Tipo da variável

# c. Quantidade de pessoas do gênero feminino
cat("Total de mulheres: ",generos["Female"])

# c. Quantidade de pessoas do gênero masculino
cat("Total de homens: ",generos["Male"])
###############################################################################

###############################################################################
# 7. Medidas de centralidade e posição

# 7.1. Idade(Age)

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
###############################################################################

# Agrupar valores repetidos
Marital_status <- dados$Marital_status
unique(Marital_status[duplicated(Marital_status)])
