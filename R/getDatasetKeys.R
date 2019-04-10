#' Get all or a sample of datasetkeys
#'
#' @param Step anonymous function with api call to pass.
#' @param maxPages
#' @return A character vector of dataset uuids
#' @examples
#'
#'\dontrun{
#'
#'  getDatasetKeys(Step = 100,maxPages = 200) # get 2000 datasetKeys
#'
#'}
#'


getDatasetKeys = function(Step = 100,maxPages = 200) { # get all datasetkeys



  f = function(...) { # anonymous function to be run with page while
    x = list(...) # get Step and Page variables passed in by pageWhile
    gbifapi::gbifapi("http://api.gbif.org/v1/dataset" %+% "?" %+% gbifapi::pager(x$Step,x$Page))$results %>% map_chr(~ .x$key)
  }

  datasetKeys = gbifapi::pageWhile(f,Step = Step,maxPages = maxPages,verbose=FALSE) %>% map_chr(~ .x)

  return(datasetKeys)
}
