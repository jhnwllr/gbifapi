


empty_fill = function(x) {

  x %>% purrr::map_if(is_empty, ~ NA_character_)

}

empty_fill_chr = function(x) {

  x %>% purrr::map_if(is_empty, ~ NA_character_) %>% purrr::flatten_chr()

}

empty_fill_dbl = function(x) {

  x %>% purrr::map_if(is_empty, ~ NA_real_) %>% purrr::flatten_dbl()

}


