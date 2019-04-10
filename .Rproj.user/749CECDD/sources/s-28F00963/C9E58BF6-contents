#' Get occ counts by speciesKey and datasetkey.
#'
#' @param datasetkey gbif datasetkey uuid string.
#' @param Step The step size. Something small like 100, 1000.
#' @param maxPages The max number of pages to go through.
#' @param verbose logical indicating printing or not.
#' @return Returns data.frame of results.
#' @examples
#'
#'\dontrun{
#'
#' getTaxonKeyCounts(datasetkey = "181eab51-9399-4baa-a0df-8de01a3acf19",Step=1000,maxPages=100,verbose=TRUE)
#'
#'}
#'

getSpeciesKeyCounts = function(datasetkey,Step=1000,maxPages=100,verbose=TRUE) {

  key = datasetkey #

  f = function(datasetkey=key, ...) { # anonymous function to be run with page while
    x = list(...) # get Step and Page variables passed in by pageWhile
    prefix = "http://api.gbif.org/v1/occurrence/search?limit=0&facet=speciesKey"
    gbifapi::gbifapi(prefix %+% "&" %+% "datasetKey=" %+% datasetkey %+% "&" %+% gbifapi::pager(x$Step,x$Page))$facets[[1]]$counts
  }

  CL = gbifapi::pageWhile(FUN=f,Step=Step,maxPages=maxPages,verbose=verbose) # get pages while is not done.

  if(!length(CL) == 0) {
    specieskeys = CL  %>% purrr::map_chr(~.x$name) # grab the taxonKey name
    occCounts = CL %>% purrr::map_dbl(~.x$count) # grab the occurrence count
    d = data.frame(specieskeys,occCounts,datasetkey=key) # data.frame of taxonKey and species count for dataset
  } else {
    d = NULL
  }

  return(d)
}
