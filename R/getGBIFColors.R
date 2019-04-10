
getGBIFColors = function() {

GBIFcolors = dplyr::tribble(
  ~name, ~hex,
  "GBIF Green", "#509E2F",
  "GBIF Solid Black", "#231F20",
  "Azure", "#175CA1",
  "Aqua", "#40BFFF",
  "Purple", "#636FB4",
  "Sky Blue", "#E5FFFF",
  "Orange Peel", "#FDAF02",
  "Plum", "#7D466A",
  "Mist", "#E8E8E8",
)

return(GBIFcolors)
}
