get_fuzzy_animals_dataframe = function() {

common_names = data.frame(stringsAsFactors=FALSE,
                          sci_name = c("Amphibia", "Animalia", "Arachnida", "Ascomycota",
                                       "Aves", "Basidiomycota", "Bryophyta", "Fungi", "Insecta",
                                       "Mammalia", "Mollusca", "Plantae", "Reptilia"),
                          common_name = c("Amphibians", "Animals", "Arachnids", "Sac fungi",
                                          "Birds", "Basidiomycota", "Mosses", "Fungi", "Insects",
                                          "Mammals", "Molluscs", "Plants", "Reptiles"),
                          taxonkey = c(131L, 1L, 367L, 95L, 212L, 34L, 35L, 5L, 216L, 359L, 52L,
                                       6L, 358L),
                          scientificname = c("Amphibia", "Animalia", "Arachnida", "Ascomycota",
                                             "Aves", "Basidiomycota", "Bryophyta", "Fungi", "Insecta",
                                             "Mammalia", "Mollusca", "Plantae", "Reptilia"),
                          rank = c("class", "kingdom", "class", "phylum", "class", "phylum",
                                   "phylum", "kingdom", "class", "class", "phylum",
                                   "kingdom", "class")
)

}
