  
# add dataset info   

library(dplyr)
library(httr)

httr::GET("https://www.gbif.org/api/country/CG") %>% httr::content()


# $participant$abbreviatedName



# library(purrr)
# library(dplyr)
# library(roperators)
# library(httr)

# keys = gbifapi::getDatasetKeys(Step = 1,maxPages = 0) 


  
# keys %>% map(~ GET("http://api.gbif.org/v1/dataset/" %+% .x) %>% content())

# $type
# $title
	
	
	# %>%
    # map_if(is_empty, ~ NA_character_) %>%
    # flatten_chr()