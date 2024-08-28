#' @title Estimation of ranks
#' @name ranki
#' @docType package
#' @author Ali Arminian (Ph.D.) Plant Geneticist and Breeder
#'
#' Maintainer: Ali Arminian <abeyran@gmail.com>
#' @references Olivoto, T., et al. (2019). \emph{Mean Performance and Stability in Multi-Environment Trials I: Combining Features of AMMI and BLUP Techniques}. Agronomy Journal, 111, 1-12. https://doi.org/10.2134/agronj2019.03.0220
#'
#' @keywords package
NULL

#' @description Estimates a new index for simultaneous selection of genotypes for trait and WAASB index. This can be compared with WAASBY index of Olivoto (2019). We suggest users handle the missing data in inputs before considering analyses, due rank codes dose not implement a widespread algorithm to do this task.
#'
#' @details {The \code{rank} function estimates rank of genotypes}
#'
#' @param datap The data set
#'
#' @usage ranki(datap)
#'
#' @examples
#' data(maize)
#' ranki(maize)
#'
#' @export

ranki <- function(datap)
{
  n = length(datap)
 datap <- data.frame(datap)
 datap[, n+1] <- rank(-datap[, n-1], na.last = NA, ties.method = "average") #rY
 datap[, n+2] <- rank(datap[, n], na.last = NA, ties.method = "average") #rWAASB
 datap[, n+3] <- datap[, n+1] +  datap[, n+2]
 datap[, n+4] <- rank(datap[, n+3], na.last = NA, ties.method = "average")
 colnames(datap) <- c("GEN", "Y", "WAASB", "rY", "rWAASB", "rY+rWAASB","Ranks")
 return(datap)
}


