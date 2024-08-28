## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## -----------------------------------------------------------------------------
library(frictionless)
package <- example_package()

# Get the Table Schema for the resource "observations"
schema <- get_schema(package, "observations")
str(schema)

## -----------------------------------------------------------------------------
str(schema$fields[[3]])

## -----------------------------------------------------------------------------
observations <- read_resource(package, "observations")
observations$timestamp

## -----------------------------------------------------------------------------
str(schema$fields[[6]])

## -----------------------------------------------------------------------------
class(observations$life_stage)
levels(observations$life_stage)

## -----------------------------------------------------------------------------
# Create a schema from the built-in dataset "iris"
iris_schema <- create_schema(iris)
str(iris_schema)

## -----------------------------------------------------------------------------
package <- add_resource(
  package,
  resource_name = "iris",
  data = iris,
  schema = iris_schema
)

