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

getKey = function(name,rank) {
  keys = name %>% purrr::map_chr(~ rgbif::name_lookup(query=.x, rank=rank, limit = 20)$data$nubKey)
  key = key[1] # get first key
  return(key)
}
