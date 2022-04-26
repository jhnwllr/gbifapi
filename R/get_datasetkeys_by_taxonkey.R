
get_datasetkeys_by_taxonkey = function(taxonkey,Step = 1000,maxPages = 30) {
  url = "http://api.gbif.org/v1/occurrence/search?limit=0&facet=datasetKey&taxonKey=" %+% taxonkey

  gbifapi::page_api_facet(url,pluck="facets",Step=Step,maxPages=maxPages,verbose=TRUE) %>%
    map(~ .x$counts ) %>%
    flatten() %>%
    map_chr(~ .x$name)

}
