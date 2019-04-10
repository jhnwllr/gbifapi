


page_api = function(url="http://api.gbif.org/v1/dataset/search?type=CHECKLIST",pluck=NULL,Step=1,maxPages=1,verbose=FALSE) {


  f = function(...) { # anonymous function to be run with page while
    x = list(...) # get Step and Page variables passed in by pageWhile

    x = flatten(x) %>% flatten() # remove double nesting

    # print(x)
    # start general processing
    if(is.null(x$pluck)) {
      out = httr::GET(x$url %+% "&" %+% gbifapi::pager(x$Step,x$Page)) %>% httr::content()
    }
    else {
      out = httr::GET(x$url %+% "&" %+% gbifapi::pager(x$Step,x$Page)) %>% httr::content() %>% pluck(x$pluck)
    }

    return(out)
  }


  dots = list(url=url,pluck=pluck) # more arguments to pass to f

  CL = gbifapi::pageWhile(FUN=f,Step=Step,maxPages=maxPages,verbose=verbose,dots) # get pages while is not done.

  return(CL)
}


page_api_facet = function(url="http://api.gbif.org/v1/dataset/search?type=CHECKLIST",pluck=NULL,Step=1,maxPages=1,verbose=FALSE) {


  f = function(...) { # anonymous function to be run with page while
    x = list(...) # get Step and Page variables passed in by pageWhile

    x = flatten(x) %>% flatten() # remove double nesting

    # print(x)
    # start general processing
    if(is.null(x$pluck)) {
      out = httr::GET(x$url %+% "&" %+% gbifapi::pagerFacet(x$Step,x$Page)) %>% httr::content()
    }
    else {
      out = httr::GET(x$url %+% "&" %+% gbifapi::pagerFacet(x$Step,x$Page)) %>% httr::content() %>% pluck(x$pluck)
    }

    return(out)
  }


  dots = list(url=url,pluck=pluck) # more arguments to pass to f

  CL = gbifapi::pageWhile(FUN=f,Step=Step,maxPages=maxPages,verbose=verbose,dots) # get pages while is not done.

  return(CL)
}



