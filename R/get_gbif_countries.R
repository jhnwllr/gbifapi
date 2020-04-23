
get_gbif_countries = function() {

  gbif_countries = httr::GET("http://api.gbif.org/v1/enumeration/country") %>%
    httr::content() %>%
    map(~ tidyr::unnest(tibble::enframe(.x))) %>%
    map(~ .x %>% tidyr::spread(name,value)) %>%
    dplyr::bind_rows()

  return(gbif_countries)
}


