

addDatasetTitle = function(.data,key) {
  arguments = as.list(match.call())
  keys = eval(arguments$key, .data)

  datasettitle = keys %>%
    map(~ httr::GET("http://api.gbif.org/v1/dataset/" %+% .x) %>% httr::content() %>% pluck("title")) %>%
    map_if(is_empty, ~ NA_character_) %>%
    flatten_chr()

  d = data.frame(datasettitle)
  d = cbind(.data,d)
  return(d)
}
