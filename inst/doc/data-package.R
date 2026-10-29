## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(frictionless)
file <- system.file("extdata", "v2", "datapackage.json", package = "frictionless")
package <- read_package(file)

## -----------------------------------------------------------------------------
package

## -----------------------------------------------------------------------------
attributes(package)

## -----------------------------------------------------------------------------
# From scratch
create_package()

# From an existing package
create_package(package)

## -----------------------------------------------------------------------------
my_package <- create_package()
my_package <- add_properties(
  my_package,
  title = "My package",
  keywords = c("minimal", "frictionlessdata"),
  after = 1 # Add after the first property
)
str(my_package)

## ----message = FALSE----------------------------------------------------------
my_package <-
  create_package() |>
  add_properties(
    title = "My package",
    keywords = c("minimal", "frictionlessdata"),
    after = 0
  ) |>
  add_resource(resource_name = "iris", data = iris)
my_package

## -----------------------------------------------------------------------------
package <- example_package()
package$id <- "https://doi.org/10.5281/zenodo.10053702/"
package

