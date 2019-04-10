\name{gbifapi}
\alias{gbifapi}
\title{Returns list from gbif api url}
\usage{
gbifapi(url)
}
\description{
Just returns a list from a gbif api url.
}
\examples{
\dontrun{

url = "https://api.gbif.org/v1/occurrence/search?limit=0&taxonKey=797&facet=issue&facetLimit=100"
library(gbifapi)
gbifapi(url)
}
}
