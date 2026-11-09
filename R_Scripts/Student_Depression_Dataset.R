#      ╔═╗       ╔═══════╗ ╔═══════╗ ╔═══════╗ ╔═╗     ╔═╗         ╔═══════╗ 
#     ║ ║       ║ ╔═════╝ ║ ╔═══╗ ║ ║ ╔═══╗ ║ ║ ╚═══╗ ║ ║         ║ ╔═══╗ ║ 
#    ║ ║       ║ ╚═══╗   ║ ╚═══╝ ║ ║ ╚═══╝ ║ ║ ╔═╗ ╚═╝ ║         ║ ╚═══╝ ║ 
#   ║ ║       ║ ╔═══╝   ║ ╔═══╗ ║ ║ ╔═╗ ╔═╝ ║ ║ ╚═╗   ║         ║ ╔═╗ ╔═╝ 
#  ║ ╚═════╗ ║ ╚═════╗ ║ ║   ║ ║ ║ ║ ║ ╚═╗ ║ ║   ╚═╗ ║         ║ ║ ║ ╚═╗ 
# ╚═══════╝ ╚═══════╝ ╚═╝   ╚═╝ ╚═╝ ╚═══╝ ╚═╝     ╚═╝         ╚═╝ ╚═══╝ 


# 1. Instalar e importar a biblioteca tidyverse
library('tidyverse')
library("dplyr")
library("scales")

###############################################################################

# 2. Definir o local de trabalho
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')
getwd() # Retorna o local de trabalho
list.files()

###############################################################################

# 3. Ler os dados em arquivo CSV
dados <- read.csv('./Data_sets/Student_Depression_Dataset.csv')
print(dados)

# Total de dados
num_rows <- nrow(dados)
print(num_rows)

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

# 5. Exibir apenas os campos da tabela
names(dados) # ou colnames(dados)

# 5.1. Exibir os tipos de dados da coluna
as.data.frame(sapply(dados, class)) # Exibição mais simples sapply(dados, class)

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


# Font-family: Slant
#      ______     __            __         _______       _ __
#     / ____/____/ /_____ _____/ /___     / ____(_)   __(_) /
#    / __/ / ___/ __/ __ `/ __  / __ \   / /   / / | / / / / 
#   / /___(__  ) /_/ /_/ / /_/ / /_/ /  / /___/ /| |/ / / /  
#  /_____/____/\__/\__,_/\__,_/\____/   \____/_/ |___/_/_/ 

# Agrupar valores repetidos. Identificando quais valores se repetem
Marital_status <- dados$Marital_status # Selecionando a coluna
unique(Marital_status[duplicated(Marital_status)])

###############################################################################

# Contando as opões de Marital_status
Marital_status_count <- table(dados$Marital_status)
# class(Marital_status_count)  # Tipo retornado por table

print(Marital_status_count)  # Total dos valores(opções) repetidos

# Porcentagem de cada opção
Marital_status_percent <- round(prop.table(Marital_status_count) * 100, digits = 2)
print(Marital_status_percent) # Percentuais

# Porcentagem de cada opção. Outra modo.
## Convertendo um objeto do tipo table em um vetor com os totais dos
## valores originais repetidos
percentual <- setNames(as.vector(Marital_status_percent), names(Marital_status_percent))
# class(percentual)

Marital_status_percent <- percent(prop.table(percentual))
print(Marital_status_percent)

###############################################################################

#          ________                        _____            _       __
#        / ____/ /___ ______________     / ___/____  _____(_)___ _/ /
#      / /   / / __ `/ ___/ ___/ _ \    \__ \/ __ \/ ___/ / __ `/ / 
#    / /___/ / /_/ (__  |__  )  __/   ___/ / /_/ / /__/ / /_/ / /  
#   \____/_/\__,_/____/____/\___/   /____/\____/\___/_/\__,_/_/ 


# REPLICANDO O PROCESSO

# Analisando a classe social dos participantes
print(dados$Family_background)

# Variável Family_background
Family_background <- dados$Family_background

# Exibindo os tipos de classe cadastrados
unique(Family_background[duplicated(Family_background)])

# Total por classe sociai
Family_background_count <- table(dados$Family_background)
as.data.frame(Family_background_count) # Exibição

# Percentual das classes sociais
class(Family_background)  # Tipo retornado por table

## Porcentagem de cada opção
Family_background_percent <- round(prop.table(Family_background_count) * 100, digits = 2)
print(Family_background_percent) # Exibir Percentuais

## Porcentagem de cada opção. Outro maneira de exibir.
percentual <- setNames(as.vector(Family_background_percent), names(Family_background_percent))
class(percentual)
as.data.frame(percentual) # Exibir Percentuais

# Exibir Percentuais no formato [num%]
Family_background_percent <- percent(prop.table(percentual), accuracy = 0.01)
print(Family_background_percent)

###############################################################################
