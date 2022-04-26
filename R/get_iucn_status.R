# must use IUCN key
get_iucn_status = function(key = 176596775) {

  url = paste0("https://api.gbif.org/v1/species/", key ,"/verbatim")

  tryCatch(
    expr = {

      httr::GET(url) %>%
        httr::content() %>%
        pluck("extensions") %>%
        pluck("http://rs.gbif.org/terms/1.0/Distribution") %>%
        flatten() %>%
        pluck("http://iucn.org/terms/threatStatus")

    },
    error = function(e){
      message('error distribution found')
      return(NA_character_)
    },
    warning = function(w){
      print(w)
      return(NA_character_)
    },
    finally = {
    }
  )

}
