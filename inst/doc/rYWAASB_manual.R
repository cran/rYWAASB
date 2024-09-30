## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  out.width = '70%'
)

## ----Installing rYWAASB package-----------------------------------------------
if(!require('rYWAASB')){
    install.packages('rYWAASB') # call the package
}
library('rYWAASB')

## ----setup,warning=FALSE,message=FALSE----------------------------------------
## For graphical displays
library(metan)
library(ggplot2)
library(graphics)
library(factoextra)
library(FactoMineR)

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

## ----echo = TRUE, fig.height = 14, fig.width = 18, fig.align = "center", message=F, warning=F----
plot_scores(waasb_model, type = 3)

## ----Showing the maize dataset------------------------------------------------
data(maize)
head(maize)

## ----apply package by ranking the genotypes-----------------------------------
data(maize)
ranki(maize)

## ----echo = TRUE, fig.height = 14, fig.width = 20, fig.align = "center", message=F, warning=F----
data(maize)
bar_plot1(maize)

## ----echo = TRUE, fig.height = 14, fig.width = 20, fig.align = "center", message=F, warning=F----
data(maize)
bar_plot2(maize, verbose=TRUE)

## ----echo = TRUE, fig.height = 14, fig.width = 20, fig.align = "center", message=F, warning=F----
data(maize)
PCA_biplot(maize)

## ----echo = TRUE, fig.height = 15, fig.width = 30, fig.align = "center", message=F, warning=F----
 data(maize)
 maize <- as.data.frame(maize)
 row.names(maize) <- maize[, 1]
 maize[, 1] = NULL
 GEN <- row.names(maize)
 maize <- scale(maize)
 nbclust(maize, verbose = FALSE)

 # Perform bootstrap or jackknife clustering by shipunov package. 
 # The examples should be run in the console manually due to 
 # problems occurs in the ORPHANED package "shipunov".
 #
 # 1- Bootstrap clustering:
 # data.jb <- Jclust(maize,
 #  method.d = "euclidean",
 #   method.c = "average", n.cl = 2,
 #    bootstrap = TRUE)
 #
 # plot.Jclust(data.jb, top=TRUE, lab.pos=1,
 #   lab.offset=1, lab.col=2, lab.font=2)
 # Fence(data.jb$hclust, GEN)
 #
 # data.jb <- Jclust(maize,
 #  method.d = "euclidean",
 #   method.c = "ward.D", n.cl = 2,
 #    bootstrap = TRUE)
 #
 # plot.Jclust(data.jb, top=TRUE, lab.pos=1,
 #  lab.offset=1, lab.col=2, lab.font=2)
 # Fence(data.jb$hclust, GEN)
 #
 #
 # if(verbose = TRUE):
 # cat("\nnumber of iterations:\n", data.jb$iter, "\n")
 #
 # For "bootstrap":
 # data.jb$mat <- as.matrix((data.jb$mat))
 # cat("\nmatrix of results:\n", data.jb$mat, "\n")
 # cat("clustering info, by eucledean distance measure:\n")
 # print(data.jb$hclust)
 # cat("groups:\n", data.jb$gr, "\n")
 # cat("\nsupport values:\n", data.jb$supp, "\n")
 # cat("\nnumber of clusters used:\n", data.jb$n.cl, "\n")
 #
 # 2- Jackknife clustering:
 # data.jb <- Bclust(maize,
 #   method.d = "euclidean", method.c = "average",
 #    bootstrap = FALSE)
 # plot(data.jb)
 #
 # data.jb <- Bclust(maize,
 #   method.d = "euclidean", method.c = "ward.D",
 #    bootstrap = FALSE)
 # plot(data.jb)
 #
 # if(verbose = TRUE):
 # For"jackknife":
 # cat("Consensus:\n", data.jb$consensus, "\n")
 # cat("Vlaues:\n", data.jb$values, "\n")

