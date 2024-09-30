## Summary

<!-- README.md is generated from README.Rmd. Please edit that file -->

# rYWAASB

```{r, include = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "man/figures/README-",
  out.width = "100%"
)
```
**rYWAASB** is an R package estimating the rank of genotype based on a trait and *WAASB* stability index obtained following a stability analysis. **rYWAASB** is very easy to use and permits the simultaneously selection of genotypes based on a trait and WAASB index according to a **Y*WAASB** plot from 'metan' package.

For examples, see its [online vignette](https://github.com/abeyran/rYWAASB).

This package is licensed under the MIT license.

## Basic examples
## Download and Install

To download the release version of the package on CRAN, type the following at the R command line:

```r
install.packages('rYWAASB')
```

T run the package:

```r
library(rYWAASB)
data(maize)
ranki(maize)
```

## Reporting bugs and other issues

If you encounter a clear bug, please file a minimal reproducible example on 
[github](https://github.com/abeyran/rYWAASB).

^vignetted
