## ----global_options, include = FALSE------------------------------------------
knitr::opts_chunk$set(comment = "#", collapse = TRUE)

## ----setup,warning=FALSE,message=FALSE----------------------------------------

## To extract *WAASB* index values and construct a biplot using `Y*WAASB` or Y*WAASB.
library(metan)

## For graphical displays
library(ggplot2)
library(graphics)


## -----------------------------------------------------------------------------
waasb_model <- 
  waasb(data_ge,
        env = ENV,
        gen = GEN,
        rep = REP,
        resp = everything(),
        random = "gen", #Default
        verbose = TRUE) #Default

data <- waasb_model$GY$model
print(data)

## ----echo = TRUE, fig.height = 5, fig.width = 10, fig.align = "center", message=F, warning=F, fig.cap="Fig. 1: Y*WAASB biplot of 'metan' package built-in oat data"----

plot_scores(waasb_model, type = 3)


## ----Installing rYWAASB package-----------------------------------------------
if(!require("rYWAASB")){
    install.packages("rYWAASB") # call the package
}

## ----Showing the maize dataset------------------------------------------------
library(rYWAASB)
data(maize)
head(maize)

## ----apply package by ranking the genotypes-----------------------------------
library(rYWAASB)
data(maize)
ranki(maize)

## ----Showing the first plot---------------------------------------------------
data(maize)
bar_plot1(maize)

## ----Showing the second plot--------------------------------------------------
data(maize)
bar_plot2(maize)

