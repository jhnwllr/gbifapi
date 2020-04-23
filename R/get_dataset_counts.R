


get_dataset_counts = function(keys) {

  keys %>%
    map(~
          gbifapi::page_api("https://api.gbif.org/v1/occurrence/search?dataset_key=" %+% .x) %>%
          pluck("count")
    ) %>%
    flatten_dbl()

}


