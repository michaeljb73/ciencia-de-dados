library('dplyr')

# Definindo diretório de trabalho.
setwd('D:/Users/setic/Documents/Michael/Ciencia_de_dados')
list.files()

# Agrupar por mês group_by
# group_by(dados,ano,mes)

# sumarizar as medidas estatísticas
# summarise(dados,media=mean(t.ar))

# LImpar terminal
shell("cls")

# Dados / passando dados com o pipe para group_by. 
# .groups = "drop_last" Oculta notificações.
dados <- read.csv('temperatura.csv') |> 
         group_by(ano,mes) |>
         summarise(media=mean(t.ar),    # Média
         mediana=median(t.ar),          # Mediana
         desvPAD=sd(t.ar),              # Desvio padrão
         maximo=max(t.ar),              # Máximo
         minimo=min(t.ar),              # Mínimo
         p25=quantile(t.ar,probs=0.25), # Quartil 25
         p75=quantile(t.ar,probs=0.75), # Quartil 75
         .groups = "drop_last")         # Oculta notificações
  
print(dados)



# #########################################################



# Cria um vetor de valores do tipo float com uma casa decimal.
notas <- c(sort(round(runif(30, min = 4.0, max = 10.0), digits = 1)))

print(notas)

# Resumo com as medidas estatísticas
summary(notas)

# Média
mean(notas)

# Mediana
median(notas)

# Cálculo da variância
var(notas)

# Desvio padrão( é a raiz quadrada da variância)
sd(notas)

# Cálculo do quartil
# Calculando percentil 25
p.25 <- quantile(notas, probs = .25)
p.75 <- quantile(notas, probs = .75)

print(p.25)
print(p.75)


# #########################################################

# LImpar terminal
shell("cls")

notas <- c(6.75,4,8,9,7,3,8,NA)

# Removendo NA(valores faltantes)
  mean(notas, na.rm=TRUE)
