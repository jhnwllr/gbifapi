
# take get the link between checklist and gbif taxonkeys
sourcekey_to_gbifkey = function(source_datasetkey = "19491596-35ae-4a91-9a98-85cf505f1bd3",extras="",Step=1,maxPages=1) {

  url = "https://www.gbif.org/api/species/search?dataset_key=" %+% source_datasetkey %+% "&origin=SOURCE" %+% extras

  L = gbifapi::page_api(url,pluck="results",Step=Step,maxPages=maxPages,verbose=TRUE)

  rank = L %>%
    map(~ .x$rank) %>%
    gbifapi::empty_fill_chr()

  source_key = L %>%
    map(~ .x$key) %>%
    gbifapi::empty_fill_dbl()

  gbif_taxon_key = L %>%
    map(~ .x$nubKey) %>%
    gbifapi::empty_fill_dbl()

  tibble(gbif_taxon_key,source_key,rank)
}
