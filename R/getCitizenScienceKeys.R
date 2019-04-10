#' Get all citizen science keys.
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
getCitizenScienceKeys = function() {
  citizenSciencekeys = gbifapi::gbifapi("http://api.gbif.org/v1/dataset?machineTagNamespace=citizenScience.mgrosjean.gbif.org&limit=1000")$results %>% map_chr(~.x$key)
  return(citizenSciencekeys)
}


getGriddedDataSetKeys = function() {
  griddedKeys = gbifapi::gbifapi("http://api.gbif.org/v1/dataset?machineTagNamespace=griddedDataSet.jwaller.gbif.org&limit=1000")$results %>% map_chr(~.x$key)
  return(griddedKeys)
}



