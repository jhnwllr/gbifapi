
replace_gbif_region = function(gbif_region,shorten=FALSE) {

gbif_region =
  gbif_region %>%
  tolower() %>%
  stringr::str_replace_all("_"," ") %>%
  stringr::str_replace_all("antarctica","Antarctica") %>%
  stringr::str_replace_all("africa","Africa") %>%
  stringr::str_replace_all("asia","Asia") %>%
  stringr::str_replace_all("europe","Europe and Central Asia") %>%
  stringr::str_replace_all("latin america","Latin America and The Caribbean") %>%
  stringr::str_replace_all("north america","North America") %>%
  stringr::str_replace_all("oceania","Oceania")

if(shorten) {
  gbif_region =
    gbif_region %>%
    stringr::str_replace_all("Europe and Central Asia","Europe &\nCentral Asia") %>%
    stringr::str_replace_all("Latin America and The Caribbean","Latin America &\nThe Caribbean")
}


# Africa
# Asia
# Europe & Central Asia
# Latin America &\nThe Caribbean
# North America
# Oceania

return(gbif_region)
}


