# Levantar datos:
rm(list = ls())
setwd('.....')
load('Colisiones.RData')
dim(Colisiones) # Datos para el TP

table(Colisiones$VAR_OBJETIVO) # Variable a predecir.


load('Test.RData')
dim(Test)       # Datos para las predicciones de tu mejor modelo.

head(Test, 2)
