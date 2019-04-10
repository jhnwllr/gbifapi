#' helper function for adding facets to faceted function
#'
#' @param ...
#' @return returns a string of formated values
#' @examples
#'
#'\dontrun{
#'
#' faceter(country="US",taxonkey="212")
#'
#'}
#'


faceter = function(L) {
  facets = names(L) %+% "=" %+% unlist(L)
  facets = "&" %+% paste(facets,collapse="&")
  return(facets)
}



