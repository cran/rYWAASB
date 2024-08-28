#' @title Simultaneous Selection of Trait and WAASB Index
#' @name rYWAASB
#' @aliases rYWAASB-package
#' @docType package
#' @author Ali Arminian (Ph.D.), Plant Geneticist and Breeder
#'
#' @Maintainer: Ali Arminian <abeyran@gmail.com>
#' @references Olivoto, T., et al. (2019) Mean Performance and Stability in Multi-Environment Trials I: Combining Features of AMMI and BLUP Techniques. Agronomy Journal, 111, 1-12. https://doi.org/10.2134/agronj2019.03.0220
#' @keywords package
NULL

 .onAttach <- function(libname, pkgname) {
  # just to show a startup message
  message <- paste('rYWAASB', utils::packageVersion('rYWAASB'), 'loaded')
  packageStartupMessage(message, appendLF = TRUE)
}

#' Dataset1: a tibble containing GEN, Trait and WAASB index columns.
#'
#' @name maize
#' @docType data
#' @usage data(maize)
#' @keywords datasets
#' @format A \code{data.frame} with 20 observations (genotypes) in rows in and 2 columns of the trait and WAASB index values.
#' \describe{
#' \item{\code{GEN}}{a character vector}
#' \item{\code{Y}}{a numeric vector}
#' \item{\code{WAASB}}{a numeric vector}
#' }
#' @examples
#' library(rYWAASB)
#' data(maize)
#'
#' # ranking genotypes:
#' ranki(maize)
#'
#' # first plot by ggplot2:
#' bar_plot1(maize)
#'
#' # second plot by R:
#' bar_plot2(maize)
#'
NULL

#' Dataset2: a tibble containing ENV, GEN, REP variables and GY(grain yield) and HM traits from the metan package.
#'
#' @name data_ge
#' @docType data
#' @usage data(data_ge)
#' @keywords datasets
#' @format A \code{data.frame} with 420 rows in and 5 columns.
#' \describe{
#' \item{\code{ENV}}{a character vector}
#' \item{\code{GEN}}{a character vector}
#' \item{\code{REP}}{a character vector}
#' \item{\code{GY}}{a numeric vector}
#' \item{\code{HM}}{a numeric vector}
#' }
#' @examples
#' library(rYWAASB)
#' data(data_ge)
#'
NULL
