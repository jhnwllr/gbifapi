reverse_wkt = function(x) {
  wellknown::wkt2geojson(x)$geometry$coordinates[[1]] %>%
    apply(2, rev) %>%
    round(4) %>%
    list(.) %>%
    list(Polygon = .) %>%
    wellknown::geojson2wkt(fmt=4,digits=4)
}

