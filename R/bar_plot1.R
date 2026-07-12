#' @title The first barplot of the ranks of genotypes
#' @name bar_plot1
#' @author {
#' Ali Arminian <abeyran@gmail.com>
#' }
#' @description
#' `r badge('stable')`
#'
#' * `bar_plot1()` creates a bar plot for the new index (rYWAASB
#' for individuals) for simultaneous selection of genotypes by
#' trait and WAASB index using ggplot2.
#' @param datap The data set
#' @param lowt A parameter indicating whether lower rates of the trait
#' is preferred or not. For grain yield e.g. Upper values is preferred. For plant height
#' lower values e.g. is preferred.
#' @import ggplot2
#' @return Returns an object of class `gg, ggmatrix`.
#' @usage bar_plot1(datap, lowt = FALSE)
#' @examples
#' # Case 1:  Higher trait values are preferred. For instance grain yield
#' # in cereals is a trait which its higher values are preferred and ranking
#' # is performed from the higher to lower values i.e. 1st, 2nd, 3rd etc
#' # in maize dataset.
#' \donttest{
#' data(maize)
#' bar_plot1(maize) # or: bar_plot1(maize, lowt = FALSE)
#' }
#' @examples
#' # Case 2:  In this case, the lower values of the given trait are preferred.
#' # For instance days to maturity (dm) and plant height are traits where their
#' # lower values are preferred.
#' \donttest{
#' data(dm)
#' bar_plot1(dm, lowt = TRUE)
#' }
#' @references
#' H. Wickham. ggplot2: Elegant Graphics for Data Analysis.
#' Springer-Verlag New York, 2016.
#' @export



bar_plot1 <- function(datap, lowt = FALSE)
{
  if (lowt) {
  datap <- ranki(datap, lowt = TRUE) } else {
  datap <- ranki(datap)
  }

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
