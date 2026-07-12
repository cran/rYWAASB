#' @title The second barplot of the ranks of genotypes
#' @name bar_plot2
#' @author {
#' Ali Arminian <abeyran@gmail.com>
#' }
#' @description
#' `r badge('stable')`
#'
#' * `bar_plot2()` creates the 2nd barplot of the ranks of genotypes
#' using the `graphics` package.
#' @param datap The data set
#' @param lowt A parameter indicating whether lower rates of the trait
#' is preferred or not. For grain yield e.g. Upper values is preferred. For plant height
#' lower values e.g. is preferred.
#' @param verbose If `verbose = TRUE` then some results are printed
#' @importFrom graphics barplot par text
#' @return Returns an object of class `gg, graphics`
#' @usage bar_plot2(datap, lowt = FALSE, verbose = FALSE)
#'
#' @examples
#' # Case 1:  Higher trait values are preferred. For instance grain yield
#' # in cereals is a trait which its higher values are preferred and ranking
#' # is performed from the higher to lower values i.e. 1st, 2nd, 3rd etc
#' # in maize dataset.
#' \donttest{
#' data(maize)
#' bar_plot2(maize) # or: bar_plot2(maize, lowt = FALSE, verbose = FALSE)
#' }
#' @examples
#' # Case 2:  In this case, the lower values of the given trait are preferred.
#' # For instance days to maturity (dm) and plant height are traits where their
#' # lower values are preferred.
#' \donttest{
#' data(dm)
#' bar_plot2(dm, lowt = TRUE, verbose = TRUE)
#' }
#' @export

bar_plot2 <- function(datap, lowt = FALSE, verbose = FALSE)
{
  if (lowt) {
    datap <- ranki(datap, lowt = TRUE) } else {
      datap <- ranki(datap) }

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
