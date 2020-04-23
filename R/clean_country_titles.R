
clean_country_titles = function(title) {

    tibble::tibble(title) %>%
    mutate(title = stringr::str_replace_all(title,", Republic of the","")) %>%
    mutate(title = stringr::str_replace_all(title,", United Republic of","")) %>%
    mutate(title = stringr::str_replace_all(title,"Congo, Democratic Republic of the","DR Congo")) %>%
    mutate(title = stringr::str_replace_all(title,", Islamic Republic of","")) %>%
    mutate(title = stringr::str_replace_all(title,", Bolivarian Republic of","")) %>%
    mutate(title = stringr::str_replace_all(title,", Plurinational State of","")) %>%
    mutate(title = stringr::str_replace_all(title,"Korea, Republic of","South Korea")) %>%
    mutate(title = stringr::str_replace_all(title,"United Arab Emirates","UAE")) %>%
    pull(title)

}
