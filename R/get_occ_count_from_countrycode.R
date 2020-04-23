get_occ_count_from_countrycode = function(countrycode) {

  countrycode %>%
    map(~
          gbifapi::page_api("https://api.gbif.org/v1/occurrence/search?country=" %+% .x) %>%
          pluck("count")
    ) %>%
    flatten_dbl()

}
