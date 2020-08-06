get_sampling_event_datasetkeys = function(verbose=FALSE) {

  L = gbifapi::page_api("https://api.gbif.org/v1/dataset/?type=SAMPLING_EVENT",pluck="results",Step=1000,maxPages=30,verbose=verbose) # long nested list of dataset info

  datasetkeys = L %>% map_chr(~ .x$key)

  datasetkeys
}
