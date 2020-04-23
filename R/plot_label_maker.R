plot_label_maker = function(breaks,unit_MK,unit_scale) {

labels = scales::unit_format(unit = unit_MK, scale = unit_scale,accuracy = 1,sep="")(breaks) %>%
  stringr::str_replace_all(stringr::regex("^0M$"),"0") %>%
  stringr::str_replace_all(stringr::regex("^0K$"),"0") %>%
  stringr::str_replace_all(stringr::regex("^1 000K$"),"1M") %>%
  stringr::str_replace_all(stringr::regex("^2 000K$"),"2M") %>%
  stringr::str_replace_all(stringr::regex("^3 000K$"),"3M") %>%
  stringr::str_replace_all(stringr::regex("^4 000K$"),"4M") %>%
  stringr::str_replace_all(stringr::regex("^5 000K$"),"5M") %>%
  stringr::str_replace_all(stringr::regex("^1 000M$"),"1B") %>%
  stringr::str_replace_all(stringr::regex("^2 000M$"),"2B")

return(labels)
}
