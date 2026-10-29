## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(frictionless)
package <- example_package()

path <- system.file("extdata", "v2", "observations_1.tsv", package = "frictionless")
package <- add_resource(package, "observations", data = path, delim = "\t", replace = TRUE)
resource(package, "observations")$dialect$delimiter

