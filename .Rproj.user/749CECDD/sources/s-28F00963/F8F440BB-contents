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
getCountryTaxonKeyCounts = function(country="AU",taxonkey="212",facet = "facet=speciesKey",verbose = TRUE,maxPages = 100,Step = 1000) {

  f = function(...) { # anonymous function to be run with page while
    x = list(...) # get Step and Page variables passed in by pageWhile

    prefix = "http://api.gbif.org/v1/occurrence/search?limit=0&"

    query = prefix %+% facet %+% "&" %+% "taxonKey=" %+% taxonkey %+% "&" %+% "country=" %+% country %+% "&" %+% gbifapi::pagerFacet(x$Step,x$Page)
    print(query)
    gbifapi::gbifapi(query)$facets[[1]]$counts
  }

  CL = gbifapi::pageWhile(FUN=f,Step=Step,maxPages=maxPages,verbose=verbose) # get pages while is not done.

  print(length(CL))

  if(!length(CL) == 0) {
    key = CL %>% map(~ .x$name) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
    occCount = CL %>% map(~ .x$count) %>% map_if(is_empty, ~ NA_character_) %>% map_dbl(~ .x)
    d = data.frame(key,occCount,country,taxonkey,facet) # data.frame of taxonKey and species count for dataset
  }

  if(length(CL) == 0){
    d = data.frame(key=NA,occCount=NA,country=NA,taxonkey=NA,facet=NA)
  }

  return(d)
}
