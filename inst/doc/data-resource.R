## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(frictionless)
package <- example_package()

# List the resources
resources(package)

## -----------------------------------------------------------------------------
read_resource(package, "deployments")

## -----------------------------------------------------------------------------
remove_resource(package, "deployments")

# This and many other functions return "package", which you can update with
# package <- remove_resource(package, "deployments")

## -----------------------------------------------------------------------------
# Add a resource with data from a data frame
add_resource(package, "iris", data = iris)

# Replace a resource with one where data is stored in a tabular file
path <- system.file("extdata", "deployments.csv", package = "frictionless")
add_resource(package, "deployments", data = path, replace = TRUE)

## -----------------------------------------------------------------------------
deployments <- read_resource(package, resource_name = "deployments")

## -----------------------------------------------------------------------------
add_resource(package, resource_name = "iris", data = iris)

## -----------------------------------------------------------------------------
# The "observations" resource has multiple files in path
package$resources[[2]]$path
# These are combined into a single data frame when reading
read_resource(package, "observations")

## -----------------------------------------------------------------------------
path <- system.file("extdata", "deployments.csv", package = "frictionless")
add_resource(package, "deployments", data = path, replace = TRUE)

## -----------------------------------------------------------------------------
# The "media" resource has inline data
str(package$resources[[3]]$data)
read_resource(package, "media")

## -----------------------------------------------------------------------------
df <- data.frame("col_1" = c(1, 2), "col_2" = c("a", "b"))
package <- add_resource(package, "df", df)
package$resources[[4]]$data

## -----------------------------------------------------------------------------
add_resource(
  package,
  "iris",
  iris,
  title = "Edgar Anderson's Iris Data",
  replace = TRUE
)

## -----------------------------------------------------------------------------
path <- system.file("extdata", "observations_1.tsv", package = "frictionless")
package <- add_resource(package, "observations", data = path, delim = "\t", replace = TRUE)
package$resources[[2]]$format

## -----------------------------------------------------------------------------
path <- system.file("extdata", "observations_1.tsv", package = "frictionless")
package <- add_resource(package, "observations", data = path, delim = "\t", replace = TRUE)
package$resources[[2]]$mediatype

## -----------------------------------------------------------------------------
path <- system.file("extdata", "deployments.csv", package = "frictionless")
package <- add_resource(package, "deployments", data = path, delim = ",", replace = TRUE)
package$resources[[2]]$encoding

