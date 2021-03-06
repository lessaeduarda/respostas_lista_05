
# Lista 5
# Professor: Davi Moreira
# Disciplina: Análise de Dados
# Aluna: Maria Eduarda R. N. Lessa

# LISTA 1

  # Quest�o 5:

# Criar vetores com os valores da quest�o:
meses <- c(8,9,4,5,3,6,8,6,6,8,5,5,6,4,4) 
setor <- c("C", "C", "I", "I", "I", "C", "C", "I", "I", "C", "C", "I", "C", "I", "I")
tamanho <- c("G", "M", "G", "M", "M", "P", "G", "M", "P", "M", "P", "P", "M", "M", "G")

# Transformar em data frame, nomear base "empresas":
empresas <- data.frame(meses,
                       setor,
                       tamanho)

## letra a)

# Verificar tipo de cada vari�vel:
is.numeric(meses)
is.numeric(setor)
is.numeric(tamanho)

## letra b)

# Dividir empresas em dois grupos (C e I):
empresas_c <- subset(empresas, setor == "C")
empresas_i <- subset(empresas, setor == "I")

# Comparar m�dia e mediana dos meses de crescimento:
summary(empresas_c$meses)
summary(empresas_i$meses)

## letra c)

# Calcular desvio padr�o de cada grupo:
sd(empresas_c$meses)
sd(empresas_i$meses)

#### O grupo das empresas da ind�stria (I) � mais homog�neo em rela��o ao do com�rcio (C).

## letra d)

# A medida descritiva que fornece a informa��o sobre 25% das empresas com menor 
# crescimento em meses � o primeiro quartil, portanto:
summary(empresas$meses)

# O n�mero m�ximo de meses apresentando crescimento para que a empresa receba o incentivo fiscal seria de 4 meses e meio, nos dados analisados, 
# no entanto, os n�meros de meses s�o discretos, o que significa que as empresas que apresentam at� 4 meses de crescimento receber�o o benef�cio.

## letra e)

# Dividir empresas em tr�s grupos (P, M e G):
empresas_p <- subset(empresas, tamanho == "P")
empresas_m <- subset(empresas, tamanho == "M")
empresas_g <- subset(empresas, tamanho == "G")

# Calcular m�dia, mediana e dp dos meses de crescimento das empresas 
# de acordo com o tamanho (P, M ou G):

# Empresas P:
summary(empresas_p$meses)
sd(empresas_p$meses)

# Empresas M:
summary(empresas_m$meses)
sd(empresas_m$meses)

# Empresas G:
summary(empresas_g$meses)
sd(empresas_g$meses)

#### Parece haver uma rela��o entre o tamanho da empresa e o n�mero de meses com crescimento, j� que as m�dias para as empresas P, M e G foram,
#### respectivamente, 5.5, 5.86 e 6. Nas empresas pequenas houve menor vari�ncia entre os meses de crescimento, enquanto nas empresas grandes, maior.


---
  
  
  # Quest�o 6:
  
# Criar vetores com os valores da quest�o:
cidades <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J") 
investimento <- c(26, 16, 14, 10, 19, 15, 19, 16, 19, 18)

# Transformar em data frame, nomear base "cid_invest":
cid_invest <- data.frame(cidades,
                         investimento)

## letra a)

# Calcular m�dia de investimento:
mean(investimento)

## letra b)

# Calcular desvio padr�o:
sd(investimento)

# Calcular valor da m�dia menos 2*dp:
mean(investimento) - (2*(sd(investimento)))

# Checar se existe algum valor abaixo de 8.830744 na base de dados:
investimento < 8.830744

#### Nenhuma cidade receber� o programa.

## letra c)

# Calcular m�dia original (17.2) mais 2 dp e m�dia original menos 2 dp:
mean(investimento) + 2*(sd(investimento)) 
mean(investimento) - 2*(sd(investimento))

# Criar nova base apenas com valores > 8.830744 e < 25.56926:
cid_invest_novo <- subset(cid_invest, investimento <= 25.56926)
# J� foi visto na letra b) que n�o h� valor abaixo de 8.830744 na base, por isso � necess�rio apenas criar filtro para eliminar valores acima de 25.56926.

# Calcular m�dia da nova base:
mean(cid_invest_novo$investimento)

#### A m�dia � uma medida sens�vel a valores extremos, por isso, com a elimina��o do investimento da cidade A, de 26, a nova m�dia obtida � menor
#### do que a original.


---
  
  
  # Quest�o 7:
  
## letra a)
  
# Criar vetores com os valores da quest�o:
A <- c(55, 2, 13, 11, 23, 2, 15, 12, 14, 28, 12, 45, 19, 30, 16, 12, 7, 13, 1, 7)
B <- c(20, 7, 6, 5, 3, 25, 5, 3, 3, 10, 8, 5, 1, 35, 9, 8, 12, 2, 26, NA)

# Transformar em data frame, nomear base "estimulos":
estimulos <- data.frame(A,B)

# Calcular m�dia, mediana e desvio padr�o do est�mulo "A":
summary(A)
sd(A)

# Calcular m�dia, mediana e desvio padr�o do est�mulo "B":
summary(B)
sd(B, na.rm = TRUE)

#### Em m�dia, para o est�mulo "B" o tempo de rea��o � menor. Os valores de rea��o para o est�mulo "A" variaram mais em rela��o � m�dia e tamb�m
#### est�o mais dispersos que os valores de "B", como � poss�vel notar a partir do desvio padr�o.

## letra b)

# gerar boxplot do data frame "estimulos":
boxplot(estimulos)

# Identificar valores extremos do est�mulo "A":
boxplot(estimulos$A, plot=FALSE)$out

# Identificar valores extremos do est�mulo "B":
boxplot(estimulos$B, plot=FALSE)$out

#### No est�mulo "A" os tempos de rea��o foram maiores e seus valores est�oo mais dispersos do que no est�mulo "B". N�o existe assimetria acentuada 
#### em "A" ou "B", visto que a linha da mediana est� pr�xima do meio da caixa nos dois casos (ainda assim, "A" apresenta maior assimetria do que "B"). 
#### Para o est�mulo "A" foram observados 2 resultados extremos (45 e 55), enquanto para "B", 3 (25, 26 e 35).


---
  
  
  # Quest�o 8:
  

## letra a)

# Criar vetores com os valores da quest�o:
fam <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J") 
renda_sm <- c(12, 16, 18, 20, 28, 30, 40, 48, 50, 54) 
saude_perc <- c(7.2, 7.4, 7, 6.5, 6.6, 6.7, 6, 5.6, 6, 5.5) 

# Transformar em data frame, nomear base "gasto_fam_saude":
gasto_fam_saude <- data.frame(fam,
                              renda_sm,
                              saude_perc)

  
# Calcular m�dia e desvio padr�o de renda (em sal�rios m�nimos ["renda_sm"])  e percentual gasto com sa�de ("saude_perc"):
summary(renda_sm)
sd(renda_sm)

summary(saude_perc)
sd(saude_perc)

# Calcular covari�ncia e correla��o:
cov(renda_sm, saude_perc, method = c("pearson"))
cor(renda_sm, saude_perc, method = c("pearson"))

## letra b)

# Gerar diagrama de dispers�o:
plot(gasto_fam_saude$renda_sm, gasto_fam_saude$saude_perc)

#### As vari�veis apresentam forte correla��o negativa, ou seja, � poss�vel observar que quanto maior a renda da fam�lia, menor o gasto percentual 
#### dessa renda com sa�de.


---
  
  
  # Quest�o 9:

## letra a)  

# Criar vetores com os valores da quest�o:
alunos <-  c("A", "B", "C", "D", "E", "F", "G", "H", "I")
P1 <- c(7.5, 8.2, 8.5, 8.7, 8.8, 9.1, 9.2, 9.3, 10)
P2 <- c(8.2, 8, 8.3, 8.5, 9.4, 9.6, 9, 9.3, 9.7) 

# Transformar em data frame, nomear base "alunos_provas":
alunos_provas <- data.frame(alunos,
                            P1,
                            P2)

## letra a)

# Calcular coeficiente de correla��o entre P1 e P2:
cor(P1, P2, method = c("pearson"))

## letra b)

# Gerar diagrama de dispers�o:
plot(alunos_provas$P1, alunos_provas$P2)

#### � poss�vel observar uma forte correla��o positiva (0.83) entre as notas dos estudantes nas duas provas.


# LISTA 2 

  # Quest�o 5:

## letra a) 

# 1000 eleitores
# 620 afirmaram jamais votar no candidato x (sucesso = 1)
# 380 n�o responderam ou votariam em x (fracasso = 0)

# Criar vetor com a resposta dos eleitores:
votos <- rep(c(1,0), times = c(620,380)) 

# Calcular a m�dia da amostra:
mean(votos)

## letra b)

# Calcular desvio padr�o da amostra:
sd(votos)

## letra c)

# Verificar intervalo de confian�a de 95%:
t.test(votos)


---
  
  
  # Quest�o 6:
  
## letra a)
  
# Instalar e requerer pacote "samplingbook":
install.packages("samplingbook")
require(samplingbook)

# Utilizar fun��o "sample.size.prop" para descobrir n�mero necess�rio de eleitores consultados para erro de 0.05: 

sample.size.prop(0.05, P = 0.5, N = Inf, level = 0.95)

## letra b)

# Utilizar fun��o "sample.size.prop" para descobrir n�mero necess�rio de eleitores consultados para erro de 0.02: 
sample.size.prop(0.02, P = 0.5, N = Inf, level = 0.95)

#### Comparando resultados de a) e b): Quanto maior o tamanho da amostra, mais pr�ximas suas medidas ser�o dos par�metros populacionais, 
#### por isso, quanto menor o erro, maior o tamanho da amostra. 

## letra c)

# Utilizar fun��o "sample.size.prop" para descobrir n�mero necess�rio de eleitores consultados para erro de 0.02, quando j� sabemos o posicionamento
# de 25% dos indiv�duos da amostra:
sample.size.prop(0.02, P = 0.75, N = Inf, level = 0.95)

### Sim, � poss�vel diminuir o tamanho da amostra em aproximadamente 25%.

---
  
  
  # Quest�o 11:
  
# Criar tabela "descr_partido" com os dados da quest�o:
descr_partido <- matrix(c(450, 150,
                          100, 300), ncol = 2, byrow = TRUE)
colnames(descr_partido) <- c("Esquerda",
                             "Direita")
rownames(descr_partido) <- c("Favoravel",
                             "Contrario")
descr_partido <- as.table(descr_partido)

# Checar tabela:
descr_partido

## letra a)

#### Hip�tese nula (H0): N�o existe rela��o entre a ideologia do partido e o posicionamento dos seus integrantes quanto a descrimininaliza��o das drogas.
#### Hip�tese alternativa (H1): Existe rela��o entre a ideologia do partido e o posicionamento dos seus integrantes quanto a descrimininaliza��o das drogas.

## letra b)

#### Erro do tipo 1: A hip�tese nula � rejeitada quando �, de fato, verdadeira. Nesse caso, um erro do tipo 1 seria cometido se, de fato, n�o houvesse 
#### rela��o entre a ideologia do partido e o posicionamento dos seus integrantes quanto a descriminaliza��o das drogas e fosse assumido no estudo que 
#### h� uma rela��o.

#### Erro do tipo 2: A hip�tese nula N�O � rejeitada, quando, na verdade, deveria ser. No exemplo da quest�o o erro do tipo 2 seria assumir que a ideologia
#### do partido n�o tem rela��o com o posicionamento de seus representantes quanto a descriminaliza��o das drogas, quando, na verdade, esta rela��o existe.

## letra c)

# Realizar teste do qui-quadrado: 
chisq.test(descr_partido, correct = FALSE)

#### Ao analisar o valor do qui-quadrado (242,42) e compar�-lo com o seu valor cr�tico (3,841), levando em conta os graus de liberdade 
#### (neste caso igual a 1), � poss�vel concluir que existe forte associa��o entre as vari�veis, com o p valor < 0,05.


---
  
  
  # Quest�o 12:
  
# Criar vetores com os valores da quest�o, para a "c�mara" (house):
pre_water_house <- c(87,88,97,85,94)
pos_water_house <- c(88,96,94,91,90,95,98,98,96,88,90,94,98,98,96,98,94)

# Realizar Teste-t para comparar as m�dias anteriores e posteriores ao 
# esc�ndalo de Watergate:
t.test(pre_water_house, pos_water_house, var.equal = TRUE)

# Criar vetores com os valores da quest�o, para o senado (senate): 
pre_water_senate <- c(85,88,71,77,74) 
pos_water_senate <- c(85,64,60,55,93,90,75,85,96,83,92,91,90,79,86,96,79)

# Realizar Teste-t para comparar as m�dias anteriores e posteriores ao 
# esc�ndalo de Watergate:
t.test(pre_water_senate, pos_water_senate, var.equal = TRUE)

#### � poss�vel observar que em ambos os casos o valor p � > 0.05, por isso N�O � poss�vel rejeitar a hip�tese nula.


---
  
  
  # Quest�o 13:
  
# Criar vetores com os valores da quest�o:
ano <- c(1876,1880,1884,1888,1892,1896,1900,1904,1908,1912,1916,1920,1924,1928,1932)
var_PIB <- c(5.11,3.879,1.589,-5.553,2.736,-10.024,-1.425,-2.421,-6.281,4.164,2.229,-11.463,-3.872,4.623,-14.586) 
var_votos <- c(48.516,50.22,49.846,50.414,48.268,47.76,53.171,60.006,54.483,54.708,51.682,36.148,58.263,58.756,40.851)

# Transformar em data frame "ano_PIB_votos":
ano_PIB_votos <- data.frame(ano, var_PIB, var_votos)

## letra a)

#### Hip�tese nula (H0): N�o existe rela��o entre a varia��o do PIB e o percentual de votos recebidos pelo candidato do partido incumbente.
#### Hip�tese alternativa (H1): Existe rela��o entre a varia��o do PIB e o percentual de votos recebidos pelo candidato do partido incumbente.

## letra b)

# Calcular o coeficiente de correla��o, a estat�stica-t, os graus de liberdade e o p-valor:
cor.test(var_PIB, var_votos, method = c("pearson"))

#### � poss�vel concluir, a partir dos dados apresentados acima, que h� rela��o entre as vari�veis.

## letra c)

#### � poss�vel observar que a an�lise da rela��o entre a varia��o do PIB e o percentual de votos recebidos pelo candidato do partido incumbente,
#### entre os anos de 1876 e 2008, permitiu rejeitar a hip�tese nula, apresentando maior coeficiente de correla��o e menor p-valor do que a an�lise 
#### dos anos 1876 a 1932.
