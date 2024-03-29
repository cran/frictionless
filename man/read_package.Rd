% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_package.R
\name{read_package}
\alias{read_package}
\title{Read a Data Package descriptor file (\code{datapackage.json})}
\usage{
read_package(file = "datapackage.json")
}
\arguments{
\item{file}{Path or URL to a \code{datapackage.json} file.}
}
\value{
List describing a Data Package.
The function will add a custom property \code{directory} with the directory the
descriptor was read from.
It is used as a base path to access resources.
}
\description{
Reads information from a \code{datapackage.json} file, i.e. the
\href{https://specs.frictionlessdata.io/data-package/#descriptor}{descriptor} file
that describes the Data Package metadata and its Data Resources.
}
\examples{
# Read a datapackage.json file
package <- read_package(
  system.file("extdata", "datapackage.json", package = "frictionless")
)

# Access the Data Package properties
package$name
package$created

# List resources
resources(package)
}
\seealso{
Other read functions: 
\code{\link{read_resource}()},
\code{\link{resources}()}
}
\concept{read functions}
