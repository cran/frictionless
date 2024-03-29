#' Get the Table Schema of a Data Resource
#'
#' Returns the [Table Schema](https://specs.frictionlessdata.io/table-schema/)
#' of a Data Resource (in a Data Package), i.e. the content of its `schema`
#' property, describing the resource's fields, data types, relationships, and
#' missing values.
#' The resource must be a [Tabular Data
#' Resource](https://specs.frictionlessdata.io/tabular-data-resource/).
#'
#' @inheritParams read_resource
#' @return List describing a Table Schema.
#' @family edit functions
#' @export
#' @examples
#' # Load the example Data Package
#' package <- example_package
#'
#' # Get the Table Schema for the resource "observations"
#' schema <- get_schema(package, "observations")
#' str(schema)
get_schema <- function(package, resource_name) {
  # Get resource
  resource <- get_resource(package, resource_name)

  # Check resource is tabular-data-resource (expected for resources with schema)
  assertthat::assert_that(
    replace_null(resource$profile, "") == "tabular-data-resource",
    msg = glue::glue(
      "Resource `{resource_name}` must have property `profile` with value",
      "`tabular-data-resource`.",
      .sep = " "
    )
  )

  # Get schema
  assertthat::assert_that(
    !is.null(resource$schema),
    msg = glue::glue("Resource `{resource_name}` must have property `schema`.")
  )
  schema <- read_descriptor(resource$schema, package$directory, safe = TRUE)

  # Check schema
  check_schema(schema)

  schema
}
