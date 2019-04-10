# This function is just so that I don't have to remember these steps everytime I make a
# call to the gbif api.
# Usage:
# url = "https://api.gbif.org/v1/occurrence/search?limit=0&taxonKey=797&facet=issue&facetLimit=100"
# gbifapi(url) # should return big list


gbifapi <- function(url) {

  Call = curl::curl_fetch_memory(url)$content %>% rawToChar() # make initial call

  if(Call == "") { # check if empty string
    Call = list(0) # return empty list instead of raw(0)
    return(Call)
  } else {
    Call = Call %>% jsonlite::fromJSON(simplifyVector = FALSE)
    return(Call)
  }
}


# gbifapi <- function(url) {
#   L = curl::curl_fetch_memory(url)$content %>%
#       rawToChar() %>%
#       jsonlite::fromJSON(simplifyVector = FALSE)
#   return(L)
# }
