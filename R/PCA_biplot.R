#' @title The PCA biplot with loadings
#' @name PCA_biplot
#' @author {
#' Ali Arminian <abeyran@gmail.com>
#' }
#' @description
#' `r lifecycle::badge("stable")`
#'
#' * `PCA_biplot()` creates the PCA (Principal Component
#'  Analysis) biplot with loadings for the new index `rYWAASB`
#'  for simultaneous selection of genotypes by trait and WAASB index.
#'  It shows `rYWAASB`, `rWAASB` and `rWAASBY` indices (r: ranked) in a
#'  biplot, simultaneously for a better differentiation of genotypes.
#'  In PCA biplots controlling the color of variable using their
#'  contrib i.e. contributions and cos2 takes place.
#'
#' @details
#' *PCA* is a machine learning method and dimension
#' reduction technique.
#' It is utilized to simplify large data sets by extracting
#' a smaller set that preserves significant patterns and
#' trends(1).
#' According to Johnson and Wichern (2007), a PCA explains
#' the var-covar structure of a set of variables
#' \loadmathjax
#' \mjseqn{X_1, X_2, ..., X_p} with a less `linear`
#' combinations of such variables. Moreover the common
#' objective of PCA is 1) data reduction and 2) interpretation.
#'
#' *Biplot and PCA*:
#' The biplot is a method used to visually represent
#' both the rows and columns of a data table. It involves
#' approximating the table using a two-dimensional matrix
#' product, with the aim of creating a plane that represents
#' the rows and columns.
#' The techniques used in a biplot typically involve an eigen
#' decomposition, similar to the one used in PCA. It is common
#' for the biplot to be conducted using mean-centered and scaled
#' data(2).
#'
#' *Algebra of PCA:*
#' As Johnson and Wichern (2007) stated(3), if the random vector
#' \mjseqn{\mathbf{X'} = \{X_1, X_2,...,X_p \}} have the
#' covariance matrix \mjseqn{\sum} with eigenvalues
#' \mjseqn{
#' \lambda_1 \ge \lambda_2 \ge ... \ge \lambda_p \ge 0}.
#'
#' Regarding the linear combinations:
#' \mjsdeqn{Y_1 = a'_1X = a_{11}X_1 + a_{12}X_2 + ... + a_{1P}X_p }
#' \mjsdeqn{Y_2 = a'_2X = a_{21}X_1 + a_{22}X_2 + ... + a_{2p}X_p}
#' \mjsdeqn{...}
#' \mjsdeqn{Y_p = a'_pX = a_{p1}X_1 + a_{p2}X_2 + ... + a_{pp}X_p}
#'
#' where \mjseqn{Var(Y_i) = \mathbf{a'_i\sum{a_i}}} ,
#' i = 1, 2, ..., p
#' \mjseqn{Cov(Y_i, Y_k) = \mathbf{a'_i\sum{a_k}}} ,
#' i, k = 1, 2, ..., p
#'
#' The principal components refer to the uncorrelated
#' linear combinations
#' \mjseqn{Y_1, Y_2, ..., Y_p} which aim to have the
#' largest possible variances.
#'
#' For the random vector \mjseqn{\mathbf{X'}=\left [ X_1, X_2, ...,
#' X_p \right ]},
#' if \mjseqn{\mathbf{\sum}} be the associated covariance matrix, then
#' \mjseqn{\mathbf{\sum}} have the eigenvalue-eigenvector pairs
#' \mjseqn{(\lambda_1, e_1), (\lambda_2, e_2), ..., (\lambda_p, e_p)},
#' and as said \mjseqn{\lambda_1 \ge \lambda_2 \ge ... \ge \lambda_p \ge 0}.
#'
#' Then the \mjseqn{\it{i}}th principal component is as follows:
#' \mjsdeqn{Y_i = \mathbf{e'_iX} = e_{i1}X_1 + e_{i2}X_2 + ... + e_{ip}X_p,
#' i = 1, 2, ..., p}, where \mjseqn{Var(Y_i) =\mathbf(e'_i\sum{e_i}) = \lambda_i,
#' i = 1, 2, ..., p}
#' \mjseqn{Cov(Y_i, Y_k) = \mathbf{e'_i\sum e_i = 0, i \not\equiv k}}, and:
#' \mjseqn{\sigma_{11} + \sigma_{22} + ... + \sigma_{pp} =
#' \sum_{i=1}^p{Var(X_i)} = \lambda_1 +
#' \lambda_2 + ... + \lambda_p = \sum_{i=1}^p{Var(Y_i)}}.
#'
#' Interestingly, Total population variance = \mjseqn{\sigma_{11} + \sigma_{22}
#' + ... + \sigma_{pp} = \lambda_1 + \lambda_2 + ... + \lambda_{p}}.
#'
#' Another issues that are significant in PCA analysis are:
#' 1) The proportion of total variance due to (explained by)
#' the \mjseqn{\mathit{k}}th principal component:
#' \mjsdeqn{\frac{\lambda_k}{(\lambda_1 + \lambda_2 + ... +
#' \lambda_p)},  k=1, 2, ..., p}
#'
#' 2) The correlation coefficients between the components \mjseqn{Y_i}
#' and the variables \mjseqn{X_k} is as follows:
#' \mjseqn{\rho_{Y_i, X_k} = \frac{e_{ik}\sqrt{\lambda_i}}{\sqrt{\sigma_{kk}}}},
#' i,k = 1, 2, ..., p
#'
#' Please note that PCA can be performed on `Covariance` or
#' `correlation matrices`.
#' And before PCA the data should be centered, generally.
#'
#' @param datap The data set
#' @importFrom FactoMineR PCA
#' @importFrom graphics par
#' @importFrom stats setNames
#' @importFrom factoextra get_eigenvalue fviz_eig fviz_pca_biplot get_pca_var
#' @return Returns a a list of dataframes
#' @usage PCA_biplot(datap)
#'
#' @examples
#' \donttest{
#' data(maize)
#' PCA_biplot(maize)
#' }
#' @references
#' (1) <https://builtin.com>
#'
#' (2) <https://pca4ds.github.io/biplot-and-pca.html>.
#'
#' (3) Johnson, R.A. and Wichern, D.W. 2007. Applied
#' Multivariate Statistical Analysis. Pearson Prentice
#' Hall. 773 p.
#'
#' @export

PCA_biplot <- function(datap)
{
  datap <- ranki(datap)

  row.names(datap) <- datap$GEN
  datap[, 1] <- NULL
  datap <- datap[, c(1, 3, 5, 6, 8)]

  res.pca <- FactoMineR::PCA(datap, graph = FALSE)

  var <- get_pca_var(res.pca)

  eignv <- factoextra::get_eigenvalue(res.pca)

  fvzeign <- factoextra::fviz_eig(res.pca, addlabels = TRUE, ylim = c(0, 50))

  varout <- list(var$coord, var$cos2, var$contrib, eignv)
  class(varout) <- "list"

  varout <- setNames(varout, c("Coordinates of variables making a scatter plot", "Squaring the variable coordinates: var.cos2 = var.coord^2", "The % contributions of the variables to the PCs", "eigenvalues data"))
  print(varout)


  old.par <- par(no.readonly = TRUE)
  par(mar=rep(1, 4))
  on.exit(par(old.par))

  p1 <- factoextra::fviz_pca_biplot(res.pca, axes = c(1, 2), geom = c("point", "text"), geom.ind = c("point", "text"), geom.var = c("arrow", "text"), col.ind = "black", fill.ind = "white", col.var = "red", fill.var = "white", gradient.cols = NULL, label = "all", invisible = "none", repel = TRUE, habillage = "none", palette = NULL, addEllipses = FALSE)
  print(p1)



  p2 <- factoextra::fviz_pca_var(res.pca, axes = c(1, 2), geom = c("point", "text"), geom.ind = c("point", "text"), geom.var = c("arrow", "text"), col.ind = "black", fill.ind = "white", col.var = "contrib", fill.var = "white", gradient.cols = c("white", "blue", "red"), ggtheme = theme_minimal())
  print(p2)



  p3 <- factoextra::fviz_pca_ind(res.pca, col.ind="cos2", geom = c("point", "text"), gradient.cols = c("white", "#2E9FDF", "#FC4E07" ))
  print(p3)

}
