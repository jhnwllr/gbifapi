#' Add iso2 code to a data.frame.
#'
#' @param .data data.frame with decimallatitude and decimallongitude columns
#' @return Returns data.frame with a iso2 column added
#' @examples
#'
#'\dontrun{
#'
#'
#'
#'}
#'

reverseGeocode = function(.data) {

  Call = .data %>% purrr::transpose() %>%  # turn in list to put in geocoder
    map(~ gbifapi::gbifapi("http://api.gbif.org/v1/geocode/reverse?" %+% "lat=" %+% .x$decimallatitude %+% "&" %+% "lng=" %+% .x$decimallongitude))

  iso2 = Call %>% map(~ flatten(.x)) %>% # go up one level in the list
    map(~ .x$isoCountryCode2Digit) %>%
    map_if(is.null, ~ NA_character_) %>% # remove missing null
    flatten_chr() # output character

  d = data.frame(iso2 = iso2)
  d = cbind(.data, d)
  return(d)
}
