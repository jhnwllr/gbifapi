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
#'
#'
#'




# add_country_name
add_gbif_country_name = function(.data,countrycode) {

  gbifapi::get_gbif_countries() %>%
    mutate(countrycode=iso2) %>%
    select(countrycode,country=title) %>%
    merge(.data,id="countrycode")

}


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



get_continent_name = function (countrycode) {
  continent = countrycode::countrycode(countrycode, "iso2c", "continent", nomatch = NA)
  return(continent)
}




