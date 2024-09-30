#' @title The first barplot of the ranks of genotypes
#' @name bar_plot1
#' @author {
#' Ali Arminian <abeyran@gmail.com>
#' }
#' @description
#' `r lifecycle::badge("stable")`
#'
#' * `bar_plot1()` creates a bar plot for the new index (rYWAASB
#' for individuals) for simultaneous selection of genotypes by
#' trait and WAASB index using ggplot2.
#' @param datap The data set
#' @import ggplot2
#' @return Returns an object of class `gg, ggmatrix`.
#' @usage bar_plot1(datap)
#' @examples
#' \donttest{
#' data(maize)
#' bar_plot1(maize)
#' }
#' @references
#' H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
#' Springer-Verlag New York, 2016.
#' @export



bar_plot1 <- function(datap)
{
  datap <- ranki(datap)

  x <- datap$GEN; y= datap$rYWAASB

  p1 <- ggplot2::ggplot(data=datap, aes(x, y, fill=x)) +
    geom_bar(stat="identity", width = 0.50) +

    ## adjust bar labels (ranks)
    geom_text(aes(label = signif(y)), nudge_y = 3,
              hjust = 1.0, nudge_x = -.3, size = 4.0, angle=90) +
    labs(x= "Individuals", y="rYWAASB index") +

    theme(
      axis.text.x = element_text(face="bold",
                                 color="black", size=6, angle=90),
      axis.text.y = element_text(face="bold",
                                 color="black", size=6, angle=0),
      axis.title=element_text(size=16)) +

    theme(text = element_text(),
          axis.text.x = element_text(angle = 90, hjust = 1,
                                     vjust = 0.4, size = 12),
          axis.text.y = element_text(angle = 0.0, hjust = 1,
                                     size = 12)) +

    theme(
      legend.position = "none") +

    theme(
      panel.border = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = 'white'),
      plot.background = element_rect(fill = "#FFFFCC")

    )

  return(p1)
}
