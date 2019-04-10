# gbifapi package

This package does **one thing**. It calls the gbif api from a url and returns a list. 

It might not work for every api call but should return a big ugly list. Not to be taken too seriously.  

### Usage

```
url = "https://api.gbif.org/v1/occurrence/search?limit=0&taxonKey=797&facet=issue&facetLimit=100" 

library(gbifapi)
gbifapi(url)

```

### Installation

```
library(devtools)
install_github("jhnwllr/gbifapi")
```

