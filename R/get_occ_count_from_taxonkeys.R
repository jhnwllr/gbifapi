

get_occ_count_from_taxonkeys = function(taxonkeys) {

  taxonkeys %>%
  map(~
  gbifapi::page_api("https://api.gbif.org/v1/occurrence/search?taxon_key=" %+% .x) %>%
  pluck("count")
  ) %>%
  flatten_dbl()

  }

get_occ_count_from_taxonkeys_year = function(taxonkeys,year_range) {

  taxonkeys %>%
    map(~
          gbifapi::page_api("https://api.gbif.org/v1/occurrence/search?taxon_key=" %+% .x %+% "&year=" %+% year_range) %>%
          pluck("count")
    ) %>%
    flatten_dbl()

}




