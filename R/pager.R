#' Page through api calls.
#'
#' @param Step The step size. Something like 100, 1000, ect. Not 10,000.
#' @param Page The page number.
#' @return A string of "&facetLimit=10&facetOffset=1000" to stick on the end of an api call.
#' @examples
#'
#'\dontrun{
#' gbifapi::gbifapi(prefix %+% "&" %+% "datasetKey=" %+% datasetKey %+% "&" %+% pager(Step,Page))
#'}
#'

pagerFacet = function(Step,Page) {
  string =  "facetLimit=" %+% Step %+% "&" %+% "facetOffset=" %+% format(Page*Step, scientific=F) # prevents string from going 1e6
  return(string)
}

pager = function(Step,Page) {
  string =  "limit=" %+% Step %+% "&" %+% "offset=" %+% format(Page*Step, scientific=F) # prevents string from going 1e6
  return(string)
}


