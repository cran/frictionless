## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(frictionless)

## -----------------------------------------------------------------------------
# Show content of the data frame "iris"
dplyr::as_tibble(iris)

## -----------------------------------------------------------------------------
# Load dplyr or magrittr to support %>% pipes
library(dplyr) # or library(magrittr)

my_package <-
  create_package() %>%
  add_resource(resource_name = "iris", data = iris)

## -----------------------------------------------------------------------------
resources(my_package)

## -----------------------------------------------------------------------------
iris_schema <-
  my_package %>%
  get_schema("iris")

str(iris_schema)

## -----------------------------------------------------------------------------
iris_schema <- create_schema(iris)

str(iris_schema)

## -----------------------------------------------------------------------------
iris_schema$fields[[1]]$description <- "Sepal length in cm."
# Show result
str(iris_schema$fields[[1]])

## -----------------------------------------------------------------------------
# Remove description for first field
iris_schema$fields[[1]]$description <- NULL

# Set descriptions for all fields
descriptions <- c(
  "Sepal length in cm.",
  "Sepal width in cm.",
  "Pedal length in cm.",
  "Pedal width in cm.",
  "Iris species."
)
iris_schema$fields <- purrr::imap(
  iris_schema$fields,
  ~ c(.x, description = descriptions[.y])
)

str(iris_schema)

## -----------------------------------------------------------------------------
my_package <-
  my_package %>%
  remove_resource("iris") %>% # Remove originally added resource
  add_resource(
    resource_name = "iris",
    data = iris,
    schema = iris_schema # Your customized schema
  )

## -----------------------------------------------------------------------------
my_package <- append(my_package, c(name = "my_package"), after = 0)
# Or with purrr::prepend(): prepend(my_package, c(name = "my_package))
my_package <- append(my_package, c(title = "My package"), after = 1)

## -----------------------------------------------------------------------------
write_package(my_package, "my_directory")

## ---- include = FALSE---------------------------------------------------------
unlink("my_directory", recursive = TRUE)

