library(devtools)
devtools::create(path=file.path(getwd(), "seed") ,check=TRUE, description=list(
  "Title" = "Synthesizing Information Across Collaborating Research",
  "Description" = "Synthesizing information across collaborating research. Created for Integrative Analysis of Longitudinal Studies of Aging (https://www.ialsa.org).",
  "Date" = "2015-04-29",
  "Author" = "Will Beasley",
  "Maintainer" = "'Will Beasley' <wibeasley@hotmail.com>"
))

use_travis(pkg = ".")
use_testthat(pkg = ".")
use_rstudio(pkg = ".")
use_package_doc(pkg = ".")
use_revdep(pkg = ".")
use_cran_comments(pkg = ".")

use_vignette(name, pkg = ".")
#use_rcpp(pkg = ".")
use_appveyor(pkg = ".")
