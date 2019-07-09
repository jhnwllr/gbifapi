#' Utility function to page through results until done.
#'
#' @param FUN anonymous function with api call to pass.
#' @param Step numeric step size.
#' @param maxPages numeric maximum number of pages to go through.
#' @param verbose logical indicating whether to print page output.
#' @return A list all the pages called.
#' @examples
#'
#'\dontrun{
#'
#'
#' key = datasetkey #
#'
#' f = function(datasetkey=key, ...) { # anonymous function to be run with page while
#'  x = list(...) # get Step and Page variables passed in by pageWhile
#'  prefix = "http://api.gbif.org/v1/occurrence/search?limit=0&facet=taxonKey"
#'  gbifapi::gbifapi(prefix %+% "&" %+% "datasetKey=" %+% datasetkey %+% "&" %+% gbifapi::pager(x$Step,x$Page))$facets[[1]]$counts
#' }
#'
#' CL = pageWhile(FUN=f,Step=100,maxPages=1) # get pages while is not done.
#'
#'}
#'

pageWhile = function(FUN = f,Step = 100,maxPages = 10,verbose=TRUE,...) { # utility function to page through until done


  # Step = 100,maxPages = 10,verbose=TRUE,
  x = list(...) # additional arguments to pass to the function

  Page = 0
  Done = FALSE

  f = match.fun(FUN)

  CL = list() # save call list
  while(!Done) { # While not done
    Call = f(Step=Step,Page=Page,x) # call anonymous function passed through FUN
    CL = c(CL,Call) # just add the list to the other list
    Done = length(Call) == 0 # check if done. returns no records. might want to change
    Page = Page + 1 # go to next page
    if(Page > maxPages) break
    if(verbose) print("On page: " %+% Page)
  }

  return(CL) # return call list

}


pageWhileFacet = function(FUN = f,Step = 100,maxPages = 10,verbose=TRUE,...) { # utility function to page through until done


  # Step = 100,maxPages = 10,verbose=TRUE,
  x = list(...) # additional arguments to pass to the function

  Page = 0
  Done = FALSE

  f = match.fun(FUN)

  CL = list() # save call list
  while(!Done) { # While not done
    Call = f(Step=Step,Page=Page,x) # call anonymous function passed through FUN
    CL = c(CL,Call) # just add the list to the other list
    check = Call %>% map(~ .x$counts) %>% flatten() %>% map(~ .x$count) %>% flatten_chr()
    # print(check)
    Done = length(check) == 0 # check if done. returns no records. might want to change
    # Done = length(Call) == 0 # check if done. returns no records. might want to change
    Page = Page + 1 # go to next page
    if(Page > maxPages) break
    if(verbose) print("On page: " %+% Page)
  }

  return(CL) # return call list

}


