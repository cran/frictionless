## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(frictionless)
file <- system.file("extdata", "datapackage.json", package = "frictionless")
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

## ----error = TRUE-------------------------------------------------------------
invalid_package <- example_package()
invalid_package$resources <- NULL
check_package(invalid_package)

## ----message = FALSE----------------------------------------------------------
library(dplyr) # Or library(magrittr)
my_package <-
  create_package() %>%
  add_resource(resource_name = "iris", data = iris) %>%
  append(c("title" = "my_package"), after = 0) %>%
  create_package() # To add the datapackage class again
my_package

## -----------------------------------------------------------------------------
package <- example_package()
package$id <- "https://doi.org/10.5281/zenodo.10053702/"
package

