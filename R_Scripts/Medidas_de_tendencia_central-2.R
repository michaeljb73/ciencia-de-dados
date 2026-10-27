# 1. Importar a biblioteca para manipulação e transformação de dados tabulares
# library(tidyverse)
# library(dplyr)

shell("cls")

# 2. Definindo diretório de trabalho.
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')

# 3. Listando.
# list.files()

# 4. Lendo os dados de um arquivo csv e atribuindo-os a variável "dados"
# 4.2. Antes de carregar os dados, é preciso que o arquivo csv utilize como
# ponto de separação decimal o "." e não a virgula.Existem arquivos csv que
# possuem como separador o "ponto e virgula", sendo necessário a alteração.
# para a virgula propriamente dita.

# Leitura simples de cinco linhas
# dados <- read.csv('./Dados_climaticos/RIBEIRA_DO_AMPARO_Estação_ A458_v3.csv', nrows = 5)

# Leitura avançada
dados <- read.csv('./Dados_climaticos/RIBEIRA_DO_AMPARO_Estação_ A458_v3.csv') |>
      group_by(Ano, Mes)

# Exibe os tipos de dados em cada coluna
# sapply(dados, class)

print(dados)

# Verificando os tipos de dados
str(dados)

# Convertendo os dados das colunas
# dados$Dia <- as.character(as.integer(dados$Dia))
# dados$Mes <- as.character(as.integer(dados$Mes))
# dados$Ano <- as.character(as.integer(dados$Ano))
# dados$HMed <- as.character(as.integer(dados$HMed))
# dados$PRECIPITACAO_T <- as.double(as.character(dados$PRECIPITACAO_T))
# dados$PRESSAO_AT_NE <- as.double(as.character(dados$PRESSAO_AT_NE))
# dados$PRESSAO_AT_NM <- as.double(as.character(dados$PRESSAO_AT_NM))
# dados$PRESSAO_AT_MAXH <- as.double(as.character(dados$PRESSAO_AT_MAXH))
# dados$PRESSAO.ATMINH <- as.double(as.character(dados$PRESSAO.ATMINH))
# dados$RADIACAO.G <- as.double(as.character(dados$RADIACAO.G))
# dados$TEMP.CPUEST <- as.double(as.character(dados$TEMP.CPUEST))
dados$TEMP.AR.BULBO.SECO <- as.double(as.character(dados$TEMP.AR.BULBO.SECO))

# Verificação após conversão
# str(dados)

media.temp.ar = mean(dados$TEMP.AR.BULBO.SECO, na.rm = TRUE)
print(media.temp.ar)
print(dados$TEMP.AR.BULBO.SECO)

print(dados)
