## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(frictionless)
package <- example_package()

# List the resources
resource_names(package)

## -----------------------------------------------------------------------------
# Get the resource "deployments"
resource <- resource(package, "deployments")
str(resource)

## -----------------------------------------------------------------------------
resource(package, "deployments") <- resource

## -----------------------------------------------------------------------------
read_resource(package, "deployments")

## -----------------------------------------------------------------------------
# Add a resource with data from a data frame
add_resource(package, "iris", data = iris)

# Replace a resource with one where data is stored in a tabular file
path <- system.file("extdata", "v2", "deployments.csv", package = "frictionless")
add_resource(package, "deployments", data = path, replace = TRUE)

## -----------------------------------------------------------------------------
remove_resource(package, "deployments")

# This and many other functions return "package", which you can update with
# package <- remove_resource(package, "deployments")

## -----------------------------------------------------------------------------
resource <- add_properties(
  resource,
  licenses = list(
    name = "CC0-1.0"
  ),
  after = 0 # Add as the first property
)
str(resource)

# Overwrite the resource in the package with the updated one
resource(package, "deployments") <- resource

## -----------------------------------------------------------------------------
deployments <- read_resource(package, resource_name = "deployments")

## -----------------------------------------------------------------------------
add_resource(package, resource_name = "iris", data = iris)

## -----------------------------------------------------------------------------
# The "observations" resource has multiple files in path
resource(package, "observations")$path
# These are combined into a single data frame when reading
read_resource(package, "observations")

## -----------------------------------------------------------------------------
path <- system.file("extdata", "v2", "deployments.csv", package = "frictionless")
add_resource(package, "deployments", data = path, replace = TRUE)

## -----------------------------------------------------------------------------
# The "media" resource has inline data
str(resource(package, "media")$data)
read_resource(package, "media")

## -----------------------------------------------------------------------------
df <- data.frame("col_1" = c(1, 2), "col_2" = c("a", "b"))
package <- add_resource(package, "df", df)
resource(package, "df")$data

## -----------------------------------------------------------------------------
package <- add_resource(
  package,
  "iris",
  iris,
  title = "Edgar Anderson's Iris Data",
  replace = TRUE
)
resource(package, "iris")$title

## -----------------------------------------------------------------------------
path <- system.file("extdata", "v2", "observations_1.tsv", package = "frictionless")
package <- add_resource(package, "observations", data = path, delim = "\t", replace = TRUE)
resource(package, "observations")$format

## -----------------------------------------------------------------------------
path <- system.file("extdata", "v2", "observations_1.tsv", package = "frictionless")
package <- add_resource(package, "observations", data = path, delim = "\t", replace = TRUE)
resource(package, "observations")$mediatype

## -----------------------------------------------------------------------------
path <- system.file("extdata", "v2", "deployments.csv", package = "frictionless")
package <- add_resource(package, "deployments", data = path, delim = ",", replace = TRUE)
resource(package, "observations")$encoding

