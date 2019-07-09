


getTaxonKeysCountry = function(countrycode,Step=10,maxPages=1,keyRank = "speciesKey") {

  taxonkeys = page_api_facet(url="http://api.gbif.org/v1/occurrence/search?limit=0&facet=" %+% keyRank %+% "&country=" %+% countrycode,pluck="facets",Step=Step,maxPages=maxPages,verbose=TRUE) %>%
    map(~ .x$counts) %>%
    flatten() %>%
    map_chr(~ .x$name)

  return(taxonkeys)
}

getGenusKeysCountry = function(countrycode,Step=10,maxPages=1) {

  taxonkeys = page_api_facet(url="http://api.gbif.org/v1/occurrence/search?limit=0&facet=genusKey&country=" %+% countrycode,pluck="facets",Step=Step,maxPages=maxPages,verbose=TRUE) %>%
    map(~ .x$counts) %>%
    flatten() %>%
    map_chr(~ .x$name)

  return(taxonkeys)
}

