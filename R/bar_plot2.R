#' @title The second barplot of the ranks of genotypes
#' @name bar_plot2
#' @author {
#' Ali Arminian <abeyran@gmail.com>
#' }
#' @description
#' `r lifecycle::badge("stable")`
#'
#' * `bar_plot2()` creates the 2nd barplot of the ranks of genotypes
#' using the `graphics` package.
#' @param datap The data set
#' @param verbose If `verbose = TRUE` then some results are printed
#' @importFrom graphics barplot par text
#' @return Returns an object of class `gg, graphics`
#' @usage bar_plot2(datap, verbose = FALSE)
#'
#' @examples
#' \donttest{
#' data(maize)
#' bar_plot2(maize, verbose = FALSE)
#' }
#' @export

bar_plot2 <- function(datap, verbose = FALSE)
{
  datap <- ranki(datap)

  A <- datap$rYWAASB
  B <- datap$GEN

  if (verbose) {
    cat("Plot the bar chart with text features:", "\n")
  }

  op <- par(no.readonly=TRUE)
  par(mar=c(6, 4, 2, 0.5))

  p1 <- barplot(A, names.arg = B,
          xlab = NULL, space=0.75,
          ylab = "rYWAASB index", col = "steelblue",
          ylim = c(0, (max(A) + 1)),
          main = "Ranking by trait and WAASB index",
          cex.main = 1.0, cex.lab = 1.2, #cex.lab: axis titles font
          cex.axis = 1.0, las=2) # cex.axis: y.axis scale font

          text(x = p1, y = A+0.5, labels = A)
  return(p1)
          par(op)

}
