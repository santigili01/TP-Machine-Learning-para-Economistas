# Levantar datos:
rm(list = ls())
setwd('C:/Users/Santiago/Desktop/UTDT/S6/MLE/Tp/Materiales para el TP-20221003')
load('Colisiones.RData')
dim(Colisiones) # Datos para el TP

table(Colisiones$VAR_OBJETIVO) # Variable a predecir.


load('Test.RData')
dim(Test)       # Datos para las predicciones de tu mejor modelo.

head(Test, 2)

#################3Analizamos nuestros datos
## require(Amelia) || install.packages(Amelia)
require(car) || install.packages('car'); library(car)


####NAS
dim(Colisiones)

#Dropeamos toda las colineales de los siniestros
#which(colnames(Colisiones) == 'FREC_SINIESTRO_TOTAL_ANYO_1')
#which(colnames(Colisiones) == "FREC_SINIESTRO_SIN_CULPA_ANYO_4")
Colisiones[,which(colnames(Colisiones) == 'FREC_SINIESTRO_TOTAL_ANYO_1'):which(colnames(Colisiones) == "FREC_SINIESTRO_SIN_CULPA_ANYO_4")] <- NULL
Colisiones[,which(colnames(Colisiones) == 'SUMA_COLISION_4_ANYOS'):which(colnames(Colisiones) == "ANYOS_SIN_SINIESTRO_SIN_CULPA")] <- NULL




colnas = c()
for (i in 1:dim(Colisiones)[2]){
  colnas[i]=length(which(is.na(Colisiones[,i])))}
colnas

colnames(Colisiones[,which(colnas>0)])

#Tomo media de peso y cilindrada por TIPO_VEHICULO
summary(Colisiones$TIPO_VEHICULO)
w_mono = mean(Colisiones$PESO[Colisiones$TIPO_VEHICULO == "monovolumen"], na.rm = TRUE)
w_suv = mean(Colisiones$PESO[Colisiones$TIPO_VEHICULO == "todoterreno"], na.rm = TRUE)
w_tur = mean(Colisiones$PESO[Colisiones$TIPO_VEHICULO == "turismo"], na.rm = TRUE)

c_mono = mean(Colisiones$CILINDRADA[Colisiones$TIPO_VEHICULO == "monovolumen"], na.rm = TRUE)
c_suv = mean(Colisiones$CILINDRADA[Colisiones$TIPO_VEHICULO == "todoterreno"], na.rm = TRUE)
c_tur = mean(Colisiones$CILINDRADA[Colisiones$TIPO_VEHICULO == "turismo"], na.rm = TRUE)

summary(Colisiones$NMARCA)

##library(data.table)
#####MULTICOLINEARIDAD



#####AMELIA AYUDAME



###        impute_data = amelia(Colisiones[,-1], m=5, maxit=5, idvars=c('SEXO_TR', 'TURBO', 'COMBUSTIBLE', 'NMARCA', 'TIPO_PRODUCTO', 'TIPO_VEHICULO', 'TIPOPERSONA', 'PROVINCIA'))


##

