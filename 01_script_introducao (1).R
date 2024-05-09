# 1.Introdução à linguagem R ------------------------------------------------

# Tenha em mente que: 1) no R, tudo é um objeto; 2) o R é uma maneira de se
# "comunicar" com uma máquina e, por assim ser, seja explícito(a), direto(a) e 
# literal; e 3) o R, em sua forma pura, entende a linguagem R e só.


# O R entende o significado, ou melhor, o valor de algo, quando esse algo
# está contido por um objeto. Exemplo:

meu_primeiro_objeto <- 15
meu_primeiro_objeto = 15

# A partir de agora "meu_primeiro_objeto", para o R, é um objeto com valor 
# igual a 15. Podemos verificar isso declarando o objeto: 

meu_primeiro_objeto

# Podemos, inclusive, efetuar algumas operações com o nosso primeiro objeto:

15 + 2 #é o mesmo que:

meu_primeiro_objeto + 2


# Aqui é oportuno falar sobre alguns operadores da linguagem R:

2 + 2   #soma
3 - 1   #subtração
4 * 5   #multiplicação
12 / 3  #divisão
7 ^ 2   #exponenciação
0:100   #sequências

3 == 3  #comparação de igualdade
5 != 0  #comparação de diferenças
2 > 9   #maior do que
1 < 8   #menor do que
5 >= 5  #maior ou igual
4 <= 1  #menor ou igual

# Podemos utilizar esses operadores, tranquilamente, com o nosso primeiro
# objeto.

# Com o R, há que se haver o cuidado sobre o desejo de se sobrescrever
# objetos.

meu_primeiro_objeto <- 160

# Em nível de código, o R nunca vai te perguntar sobre a certeza de se 
# querer fazer algo. Atenção a isso!

# Também podemos guardar valores textuais em objetos:

nome <- usp

# O R reportou um R. Por quê?

nome_1 <- "ufrn"

nome_1

#ou

nome_2 <- 'usp'

nome_2

# Podemos utilizar alguns operadores aprendidos anteriormente:

nome_1 == nome_2

nome_1 != nome_2

# É possível guardar valores lógicos em objetos:

verdadeiro <- nome_1 == nome_2

verdadeiro


falso <- nome_1 != nome_2

falso


# Outros valores importantes:

TRUE #logical
T #logical
FALSE #logical
F #logical
NA #logical
NULL #NULL
Inf #numeric
-Inf #numeric

# Podemos guardar bases de dados inteiras em objetos, porém, antes, devemos
# pensar sobre como guardar mais de uma informação em um objeto.

vetor <- 1 2 3 4 5 6 7 8 9 10

vetor <- 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

vetor <- (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# A resposta está na função concatenate: c()

vetor <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

vetor


# O exposto, de forma análoga, vale para valores textuais

nomes <- c("mariana", "pedro", "daniela")

nomes


# 2. Aplicando Funções -----------------------------------------------------------------

# Funções são tipos especiais de objetos no R, cujo nome vem seguido de 
# parêntesis. Equivalem a ordens diretas à máquina.

# Funções são algoritmos. Cada algoritmo possui suas próprias atribuições
# e carrega dentro de si seu processo decisório. Para a função c(), seu
# objetivo é o de concatenar valores.

# Vamos utilizar outro exemplo para esclarecer o assunto:

round(x = 3.141592)

# No comando anterior, não houve a criação de objeto algum. Houve a 
# declaração de uma função cujo objetivo é o arredondamento numérico, em 
# que "x" é um argumento da função.

# Argumentos são complementos às ordens dadas. Imagine o seguinte caso:

round()

# Por que houve um erro?

# Voltemos ao exemplo:

round(x = 3.141592)

# Por que o R apenas transforma o valor de 3.141592 no valor inteiro 3?

# Devemos complementar a ordem com um novo argumento:

round(x = 3.141592, digits = 3)

# Como saber quais os argumentos de uma dada função?

# Primeira maneira:
?round

#segunda maneira:
args(round)


# 3. Abrindo um Dataset -----------------------------------------------------------------

# Voltando à criação de objetos, é possível inserir um arquivo de banco de dados pré-organizado 
#Formatos como csv, txt ou xlsx podem ser lidos mediante aplicação de funções específicas,
#Primeiro passo é informar um diretório para buscar o arquivo, neste caso, adicione o endereço de onde está a pasta com seus dados
#-> Observe que a barra é invertida
setwd("C:/Users/franc/OneDrive/Documents/CURSO - ABCLIMA")

#Agora aplicamos a função 'read.csv' para abrirmos o arquivo
read.csv("dados.csv")

# Todas as observações internas ao objeto criado viraram textos, certo?
#É preciso inserir o banco em um novo objeto

data=read.csv("dados.csv")

# Podemos checar o tipo de objeto com a função class():

class(data)
class(meu_primeiro_objeto)


# E também o tipo de cada variável -> Observe o cifrão como elemento para direcionar a função a uma variável
class(data$co_ppb)


#Podemo verificar se seus comprimentos:

length(data)

View(data)

#Podemos criar uma variável nova ex.:

data$x1=data$temperatura_c/2

#E também remove-la
data$x1 <- NULL
#
# Salvando objetos carregados no R ----------------------------------------c

# Para salvar objetos, independentemente de sua classe (e.g. gráficos, bases
# de dados, modelos de machine learning, arquivos pdf, arquivos do Microsoft
# Office, etc.), podemos utilizar a função write.csv():

write.csv(data, "dados_2.csv",row.names=F)

# 4. Medidas de Posição -----------------------------------------------------------------

#O Rstudio possui algumas funções básicas para analisar dados.
##funções básicas

#Calculando a Média de uma variável
mean(data$temperatura_c)

#Calculando a Mediana de uma variável
median(data$precipitacao_mmdia)

#Sumário de informações
summary(data)

#Não existe uma função específica para calcular a Moda, mas podemos usar outras com o mesmo fim
table(data$temperatura_c)
#Lembre-se, se não aderirmos o resultado da função a um novo objeto ela não ficará salva e não poderá ser utilizada.
#Vamos criar um novo valor chamado "Moda" e inserir nele os resultados da função anterior
moda=as.data.frame(table(data$temperatura_c))

##Percentis -> Alteramos o argumento "probs" para definir os percentis desejados
quantile(data$temperatura_c, probs = 0.25)
quantile(data$precipitacao_mmdia,probs=0.95)

##Filtrar dados aplicando critérios a uma ou mais de uma variável 
#Note que criaremos novos valores para os valores que criamos
chuva=subset(data, precipitacao_mmdia >= 0.1)
chuva_natal=subset(data, precipitacao_mmdia >= 0.1 & mun_nome == "NATAL")
natal=subset(data,mun_nome == "NATAL")

##O pacote lubridate pode ajudar na criação de variáveis temporais.
install.packages("lubridate")
library(lubridate)

#Quais argumentos da função para criar um vetor com os dias da semana?
?wday

#Segundo os argumentos, o dado precisar estar em um formato de data.
class(natal$Date)

#A coluna Date está no formato character, precisaremos trocar seu formato
natal$Date=as.Date(natal$Date,"%m/%d/%Y")

#Caso esteja trabalhando com dados horários será preciso transformar a coluna com outro código
# observe, neste caso, a data estará no formato Ano/Mês/Dia Hora:Minuto, caso seu arquivo esteja com outra ordem apenas troque o código
#Observe o argumento "tz" ele posiciona a timezone, no meu caso "Fortaleza"
data$Datetime <- as.POSIXct(data$Datetime,
                                    format = "%Y-%m-%dT%H:%M",
                                    tz = "America/Fortaleza")


#Agora sim, podemos criar um coluna com dias da semana
natal$wday=wday(natal$Date)
natal$Mes=month(natal$Date)
natal$Ano=year(natal$Date)
natal$Dia=day(natal$Date)

##Vamos usar um pacote de dados o "Plyr" para melhorar as análises
install.packages("plyr")
library(plyr)
##Vamos acessar a Aba "Packages" para visualizar as funções deste pacote

##Esta função gerará sumariza as variáveis de acordo com três variáveis,municipio, ano e mês
data2 <- ddply(natal, c("mun_nome", "Ano", "Mes"), summarise,precipitacao_mm = sum(precipitacao_mmdia, na.rm=TRUE),
                                      temperatura_c = mean(temperatura_c, na.rm=TRUE))
Sys.timezone()

#5. Medidas de Relação e Modelos básicos--------------------------------------------------
#Calcular Correlação de Pearson entre duas variáveis
cor.test(natal$temperatura_c,natal$umidade_relativa_percentual,method='pearson')

##Plotar Scatterplot de correlações
#Instalar e abrir pacote "PerformanceAnalytics
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
#Plotar Scatterplot -> Gráfico de dispersão + histograma + pearson entre algumas variáveis que selecionamos
chart.Correlation(natal[, 7:16], histogram = TRUE, pch = "+")
## Perceba que o nome das variáveis está igual ao dataframe, podemos altera-las pela função:
colnames(natal)[7]<-'CO(ppb)'

##Calculando Tendências
install.packages("Kendall")
library(Kendall)
MannKendall(natal$precipitacao_mmdia)

#6. Alguns indices de precipitação -> Usaremos o pacote Precintcon--------------------------------
install.packages("precintcon")
library(precintcon)
##Este pacote reconhece dados organizados de uma forma específica, assim, vamos abrir o arquivo 'natal.csv' 
#este pacote possui os dados mensais de chuva em Natal, conforme calculamos na linha 256
#Mantemos ele apenas com três colunas, 'year' 'month' e 'precipitation'

natal_2=read.csv("natal.csv")
natal_2=as.monthly(natal_2)
##Vamos explorar alguns indices do Precintcon -> Perceba que os indices apenas funcionam para escalas específicas
##Calcular indice de Anomalia de Chuvas
rai(natal_2)
##Calcular coeficiente de Standarized Precipitation Index
spi(natal_2)
##Calcular Precipitation Concentration Index
pci(natal_2)

#Ele tem também funções de plotagem
pplot.rai(natal_2)
pplot.pci(natal_2)

#7. Alguns indices de temperatura -> Usaremos o pacote Thermindex--------------------------------
install.packages("ThermIndex")
library(ThermIndex)
#Indice de desconforto térmico de Thom (1959)
di(natal$temperatura_c,natal$umidade_relativa_percentual)
#Indice de Desconforto Humidex
humidex(natal$temperatura_c,natal$umidade_relativa_percentual)
#Indice ETV
etv(natal$temperatura_c,natal$umidade_relativa_percentual,natal$vento_velocidade_ms)


#8. Alguns indices de -> Usaremos o pacote ClimInd--------------------------------

install.packages("ClimInd")
library(ClimInd)

#Será preciso primeiro transformar o valor de temperatura em um vector, e depois adicionar as informações de data
Tmean <- as.vector(natal$temperatura_c)
Prec <- as.vector(natal$precipitacao_mmdia)
names(Tmean) <- as.character(format(natal$Date, format = "%m/%d/%Y"))
names(Prec) <- as.character(format(natal$Date, format = "%m/%d/%Y"))

#Precipitation of wettest month
bio13(data=Prec)
#Precipitation of driest month
bio14(data=Prec)
#Longest Wet Period -> Sequência de dias chuvosos
cwd(data=Prec,time.scale = "year")
#Heavy precipitation days -> Quantidade de dias com precipitação acima de 50mm
d50mm(data=Prec,time.scale = "year")
#Longest Wet Period -> Sequência de dias chuvosos
cwd(data=Prec,time.scale = "year")
#Longest Wet Period -> Sequência de dias chuvosos
cwd(data=Prec,time.scale = "year")
#De Martonne aridity index
mai(pr=Prec,taverage = Tmean)
## Observe que alguns indices dependem de variáveis que não temos no banco atual
#Temp. Max, ETP, Temp Min, entre outros


#9. Possibilidades com o Pacote OpenAir
install.packages("openair")
library(openair)

#Plotr Rosa dos ventos simples
windRose(natal,ws="vento_velocidade_ms",wd="vento_direcao_grau")

#Plotar relação entre concentração de poluentes, direção e velocidade dos ventos
polarPlot(natal,pollutant = "pm25_ugm3",x="vento_velocidade_ms",wd="vento_direcao_grau")

#calendarPlot -> Precisamos criar uma variável chamada "date" com 'd' minusculo que serão as datas
natal$date=natal$Date
calendarPlot(natal, pollutant = "pm25_ugm3", year = 2005)

#Tendências de Theilsen
TheilSen(natal,pollutant="pm25_ugm3")
