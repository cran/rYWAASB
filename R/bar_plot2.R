#' @title Draw the second barplot of ranks of genotypes
#' @name bar_plot2
#' @docType package
#' @author Ali Arminian (Ph.D.) Plant Geneticist and Breeder
#'
#' Maintainer: Ali Arminian <abeyran@gmail.com>
#' @references Olivoto, T., et al. (2019) Mean Performance and Stability in Multi-Environment Trials I: Combining Features of AMMI and BLUP Techniques. Agronomy Journal, 111, 1-12. https://doi.org/10.2134/agronj2019.03.0220

#' @keywords package
NULL

#' @description Creates the bar plot for a new index for simultaneous selection of genotypes for trait and WAASB index.
#'
#' @details {The \code{bar_plot2} function creates the barplot of rank of genotypes}
#'
#' @param datap The data set
#' @importFrom  graphics barplot
#' @usage bar_plot2(datap)
#' @examples
#' data(maize)
#' bar_plot2(maize)
#'
#' @export

bar_plot2 <- function(datap)
{
  n = length(datap)
  datap <- data.frame(datap)
  datap$GEN <- factor(datap$GEN, levels = datap$GEN) # GEN
  datap$rY <- rank(-datap[, 2], na.last = NA, ties.method = "average") # rY
  datap$rWAASB <- rank(datap[, 3], na.last = NA, ties.method = "average") # rWAASB
  datap$"rY+rWAASB" <-  datap$rY + datap$rWAASB # rY + rWAASB
  datap$Ranks <- rank(datap$"rY+rWAASB", na.last = NA, ties.method = "average")


  A <- datap$Ranks
  B <- datap$GEN

  # Plot the bar chart with text features
  barplot(A, names.arg = B,
          xlab = "GEN",
          ylab = "Ranks", col = "steelblue",
          main = "Ranking gneotypes",
          cex.main = 1.0, cex.lab = 1.2, cex.axis = 1.1)
}
