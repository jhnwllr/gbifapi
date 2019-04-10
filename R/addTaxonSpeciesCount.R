#' Add taxon specious count to a data.frame.
#'
#' @param .data data.frame to be passed in probably through a pipe %>%
#' @param key unquoted column name for taxonkeys to be passed in
#' @return Returns data.frame of results.
#' @examples
#'
#'\dontrun{
#'
#' D %>% addTaxonSpeciesCount(taxonkey)
#'
#'}
#'

addTaxonSpeciesCount = function(.data,key) {

  arguments = as.list(match.call())
  key = eval(arguments$key, .data)

  speciesCount = key %>%
    map(~ gbifapi::gbifapi("https://www.gbif.org/api/species/search?highertaxon_key=" %+% .x %+% "&limit=0&rank=SPECIES&status=ACCEPTED")) %>%
    map_if(is_empty, ~ NA_character_) %>%
    map_chr(~ .x$count) %>%
    as.numeric()

  d = data.frame(speciesCount)
  d = cbind(.data,d)

  return(d)
}
