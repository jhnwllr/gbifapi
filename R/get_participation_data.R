get_participation_data = function() {
  library(dplyr)
  library(purrr)

  L = httr::GET("https://www.gbif.org/api/topojson/world/participants") %>%
    httr::content() %>%
    pluck("objects") %>%
    pluck("countries") %>%
    pluck("geometries") %>%
    map(~ .x$properties)

  type = L %>%
    map(~ .x$type) %>%
    map_if(is_empty, ~ NA_character_) %>%
    flatten_chr()

  participationStatus = L %>%
    map(~ .x$participationStatus) %>%
    map_if(is_empty, ~ NA_character_) %>%
    flatten_chr()

  gbifRegion = L %>%
    map(~ .x$gbifRegion) %>%
    map_if(is_empty, ~ NA_character_) %>%
    flatten_chr()

  countryCode = L %>%
    map(~ .x$countryCode) %>%
    map_if(is_empty, ~ NA_character_) %>%
    flatten_chr()

  participation_data = tibble(iso2 = countryCode,gbifRegion,participationStatus,type)

  return(participation_data)
}
