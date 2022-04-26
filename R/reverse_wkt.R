reverse_wkt = function(x) {
  wellknown::wkt2geojson(x)$geometry$coordinates[[1]] %>%
    apply(2, rev) %>%
    round(4) %>%
    list(.) %>%
    list(Polygon = .) %>%
    wellknown::geojson2wkt(fmt=6,digits=6)
}

