#' @title Draw the first barplot of ranks of genotypes
#' @name bar_plot1
#' @docType package
#' @author Ali Arminian (Ph.D.) Plant Geneticist and Breeder
#'
#' Maintainer: Ali Arminian <abeyran@gmail.com>
#' @references Olivoto, T., et al. (2019) Mean Performance and Stability in Multi-Environment Trials I: Combining Features of AMMI and BLUP Techniques. Agronomy Journal, 111, 1-12. https://doi.org/10.2134/agronj2019.03.0220

#' @keywords package
NULL

#' @description Creates the bar plot for a new index for simultaneous selection of genotypes for trait and WAASB index.
#'
#' @details {The \code{bar_plot} function creates the barplot of rank of genotypes}
#'
#' @param datap The data set
#' @import ggplot2
#' @importFrom ggplot2 ggplot
#' @references
#' H. Wickham. ggplot2: Elegant Graphics for Data Analysis. Springer-Verlag New York, 2016.
#' @usage bar_plot1(datap)
#'
#' @examples
#' data(maize)
#' bar_plot1(maize)
#'
#' @export
#'

bar_plot1 <- function(datap)
{
  n = length(datap)
  datap <- data.frame(datap)
  datap$GEN <- factor(datap$GEN, levels = datap$GEN) # GEN
  datap$rY <- rank(-datap[, 2], na.last = NA, ties.method = "average") # rY
  datap$rWAASB <- rank(datap[, 3], na.last = NA, ties.method = "average") # rWAASB
  datap$"rY+rWAASB" <-  datap$rY + datap$rWAASB # rY + rWAASB
  datap$Ranks <- rank(datap$"rY+rWAASB", na.last = NA, ties.method = "average")

  x <- datap$GEN; y= datap$Ranks
  ggplot2::ggplot(data=datap, aes(x, y, fill=x)) +
    geom_bar(stat="identity", width = 0.5) +
    geom_text(aes(label = signif(y)), nudge_y = 3) +
    labs(x= "GEN", y="Ranks") +
    theme(axis.text.x = element_text(face="bold", color="black", size=6, angle=90),
          axis.text.y = element_text(face="bold", color="black", size=6, angle=0),
          axis.title=element_text(size=14)) +
    theme(legend.position = "none")
}
