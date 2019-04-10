# match country

geocodeCountryInString = function(string) {

  # countrycode::codelist # consider using this

  countries = GET("https://raw.githubusercontent.com/mledoze/countries/master/countries.json") %>%
    content() %>%
    jsonlite::fromJSON(simplifyVector = FALSE)

  official = countries %>%
    map(~ .x$name) %>%
    map_chr(~ .x$official) %>%
    tolower()

  common = countries %>%
    map(~ .x$name) %>%
    map_chr(~ .x$common) %>%
    tolower()

  commonName = string %>%
    map(~ common[stringr::str_detect(.x, common)]) %>%
    map_if(is_empty, ~ NA_character_)

  officialName = string %>%
    map(~ official[stringr::str_detect(.x, official)]) %>%
    map_if(is_empty, ~ NA_character_)

  return(list(commonName=commonName,officialName=officialName))
}
