getFacetedSpeciesCountByCountry = function(taxonKey = "1496", country = "US",Step=1,maxPages=10) {

  facet = taxonKey %+% "&" %+% "country=" %+% country
  print(country)
  url = "http://api.gbif.org/v1/occurrence/search?limit=0&facet=speciesKey&taxonKey=" %+% facet

  count = gbifapi::page_api_facet(url,pluck="facets",Step=Step,maxPages=maxPages,verbose=TRUE) %>%
    map(~ .x$counts) %>%
    flatten() %>%
    map(~ .x$name) %>%
    flatten_chr() %>%
    unique() %>%
    length()

  return(count)
}
