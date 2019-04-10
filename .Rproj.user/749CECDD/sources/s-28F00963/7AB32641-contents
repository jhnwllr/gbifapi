addFacetedSpeciesCount = function(.data,L,Step=1000,maxPages=100,verbose=TRUE) {

  L = .data %>% select(attr(.data,"var")) %>% purrr::transpose() # get a list to pass to faceter

  f = function(...) { # anonymous function to be run with page while
    x = list(...) # get Step and Page variables passed in by pageWhile
    prefix = "http://api.gbif.org/v1/occurrence/search?limit=0&facet=speciesKey"
    gbifapi::gbifapi(prefix %+% gbifapi::faceter(x[[3]][[1]]) %+% "&" %+% gbifapi::pagerFacet(x$Step,x$Page))$facets[[1]]$counts
  }

  speciesCount = c()
  for(i in 1:length(L)) {
      CL = try(gbifapi::pageWhile(FUN=f,Step=Step,maxPages=maxPages,verbose=verbose,L[[i]]))
      if(class(CL) == "try-error") speciesCount[i] = NA; next
      speciesCount[i] = map_if(is_empty, ~ NA_character_) %>% purrr::map_chr(~.x$name)
      save(speciesCount,file = "C:/Users/ftw712/Desktop/image data/data/species counts/" %+% i %+% ".rda")
      print("saved")
      }

  # d = cbind(as.data.frame(.data),data.frame(speciesCount))

  #return(d)
}
