
# reduces the size of ggplot2::map_data for plotting with svg

ggplot2_small_map_data = function(dTolerance=1.1) {

countries = ggplot2::map_data("world") %>%
  sf::st_as_sf(coords = c("long", "lat")) %>%
  group_by(group) %>%
  summarize(do_union=FALSE) %>%
  sf::st_cast("POLYGON") %>%
  ungroup() %>%
  mutate(geometry = sf::st_simplify(geometry, dTolerance=dTolerance)) %>%
  mutate(is_empty = sf::st_is_empty(geometry)) %>%
  filter(!is_empty) %>%
  select(-is_empty) %>%
  glimpse() %>%
  sf::as_Spatial() %>%
  ggplot2::fortify()

}
