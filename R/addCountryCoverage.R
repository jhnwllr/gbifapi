
# add country coverage meta data to a datasetkey. useful for finding checklist country coverages

addCountryCoverage = function(.data,key) {

  arguments = as.list(match.call())
  keys = eval(arguments$key, .data)

  countryCoverage = keys %>%
    map(~
          GET("https://www.gbif.org/api/dataset/" %+% .x) %>%
          content() %>%
          pluck("countryCoverage")
    ) %>%
    map_if(is_empty, ~ NA_character_) %>%
    flatten_chr()

  d = data.frame(countryCoverage)
  d = cbind(.data,d)
  return(d)
}
