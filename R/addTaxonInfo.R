#' Add taxon info to a data.frame.
#'
#' @param .data data.frame to be passed in probably through a pipe %>%
#' @param key unquoted column name for taxonkeys to be passed in
#' @return Returns data.frame of results.
#' @examples
#'
#'\dontrun{
#'
#' D %>% addTaxonInfo(specieskey)
#'
#'}
#'


addTaxonInfo = function(.data,key,moreInfo=FALSE) { # adds taxon info to a data.frame with a species key NA if not found
  arguments = as.list(match.call())
  key = eval(arguments$key, .data)

  L = key %>% map(~ gbifapi::gbifapi("http://api.gbif.org/v1/species/" %+% .x))

  kingdom = L %>% map(~ .x$kingdom) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  class = L %>% map(~ .x$class) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  phylum = L %>% map(~ .x$phylum) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  order = L %>% map(~ .x$order) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  family = L %>% map(~ .x$family) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  genus = L %>% map(~ .x$genus) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  species = L %>% map(~ .x$species) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  rank = L %>% map(~ .x$rank) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  scientificName = L %>% map(~ .x$scientificName) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)

  if(moreInfo) {
  nubKey = L %>% map(~ .x$nubKey) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  taxonomicStatus = L %>% map(~ .x$taxonomicStatus) %>% map_if(is_empty, ~ NA_character_) %>% map_chr(~ .x)
  d = data.frame(kingdom,class,phylum,order,family,genus,species,rank,scientificName,nubKey,taxonomicStatus,stringsAsFactors=FALSE)

  } else {
    d = data.frame(kingdom,class,phylum,order,family,genus,species,rank,scientificName,stringsAsFactors=FALSE)
  }

  d = cbind(.data,d)
  return(d)
}






