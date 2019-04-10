# add publishingOrganization



addPublishingOrganization = function(.data,key) {

  arguments = as.list(match.call())
  keys = eval(arguments$key, .data)

  publishingOrganizationKey = keys %>%
    purrr::map(~httr::GET("http://api.gbif.org/v1/dataset/" %+% .x)) %>%
    purrr::map(~ httr::content(.x)) %>%
    purrr::map_if(purrr::is_empty, ~ NA_character_) %>%
    purrr::map_chr(~ .x$publishingOrganizationKey)

  d = data.frame(publishingOrganizationKey)
  .data = cbind(.data,d)

  publishingOrganizationInfo = d$publishingOrganizationKey %>%
    purrr::map(~httr::GET("http://www.gbif.org/api/publisher/" %+% .x)) %>%
    purrr::map(~ httr::content(.x))

  publishingOrganizationTitle =
    publishingOrganizationInfo %>%
    purrr::map_if(purrr::is_empty, ~ NA_character_) %>%
    purrr::map_chr(~ .x$title)

  d = data.frame(publishingOrganizationTitle)
  .data = cbind(.data,d)

  return(.data)
}


