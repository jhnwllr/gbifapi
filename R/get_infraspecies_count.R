get_infraspecies_count = function(taxonkeys) {

  taxonkeys %>%
    map(~
          gbifapi::page_api("https://www.gbif.org/api/species/search?highertaxon_key=" %+% .x %+% "&status=ACCEPTED&status=DOUBTFUL") %>%
          pluck("count")
    ) %>%
    flatten_dbl()

}

