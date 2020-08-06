
get_all_dataset_citations = function(Step = 1000,maxPages = 200) {
  # this might take a while

  datasetkey = gbifapi::getDatasetKeys(Step = Step,maxPages = maxPages)

  api = "https://www.gbif.org/api/resource/search?"
  query = "contentType=literature&gbifDatasetKey="

  citations = datasetkey %>%
    map(~ httr::GET(api %+% query %+% .x) %>% httr::content()) %>%
    map_dbl(~ .x$count)

  tibble(datasetkey,citations)
}

