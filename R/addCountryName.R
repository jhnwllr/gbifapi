#' Get all or a sample of datasetkeys
#'
#' @param Step anonymous function with api call to pass.
#' @param maxPages
#' @return A character vector of dataset uuids
#' @examples
#'
#'\dontrun{
#'
#'  getKey(name="Aves",rank="class")
#'
#'}
#'
#'
addCountryName = function (.data,countrycode) {

  arguments = as.list(match.call())
  countrycode = eval(arguments$countrycode, .data)
  countrycode = countrycode::countrycode(countrycode, "iso2c", "country.name", nomatch = NA)

  d = data.frame(country = countrycode)
  d = cbind(.data, d)
  return(d)
}


addContinentName = function (.data,countrycode) {

  arguments = as.list(match.call())
  countrycode = eval(arguments$countrycode, .data)
  countrycode = countrycode::countrycode(countrycode, "iso2c", "continent", nomatch = NA)

  d = data.frame(continent = countrycode)
  d = cbind(.data, d)
  return(d)
}


