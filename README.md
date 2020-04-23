# gbifapi package

Various utility functions useful for working with GBIF data. 
Most functions use the GBIF api is some way. 

### Examples 

```
gbifapi::get_nodes_data() # returns all information about GBIF nodes in tibble
gbifapi::get_dataset_counts(keys) # returns occurrences counts for dataset key
gbifapi::get_gbif_countries() # returns dataframe of all GBIF recognized countries
gbifapi::get_occ_count_from_taxonkeys(taxonkeys) # 
```

### Installation

```
devtools::install_github("jhnwllr/gbifapi")
```

