
get_nodes_data = function() {

  L = httr::GET("https://api.gbif.org/v1/node?limit=1000") %>%
    httr::content() %>%
    pluck("results")

  tibble(
    node_title = L %>% map(~.x$title) %>% gbifapi::empty_fill_chr(),
    gbif_region = L %>% map(~.x$gbifRegion) %>% gbifapi::empty_fill_chr(),
    participation_status = L %>% map(~.x$participationStatus) %>% gbifapi::empty_fill_chr(),
    type = L %>% map(~.x$type) %>% gbifapi::empty_fill_chr(),
    country = L %>% map(~.x$country) %>% gbifapi::empty_fill_chr()
  )

}

