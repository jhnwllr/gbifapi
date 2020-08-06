# save ggplot formats function

save_ggplot_formats = function(
  p,
  save_dir = "C:/Users/ftw712/Desktop/",
  plot_name = "plot",
  width= 7,
  height = 7,
  formats = c("pdf","svg","jpg"),
  dpi = 600,
  subfolder = FALSE
) {

  if(subfolder) {
    dirs = paste0(save_dir,formats,"/") # save dir
    dirs_to_create = dirs[!dir.exists(dirs)]
    if(length(dirs_to_create) > 0) dirs_to_create %>% map(~dir.create(.x))
    image_paths = paste0(save_dir,formats,"/",plot_name,".",formats)
    image_paths %>% map(~ ggsave(.x,plot=p,width=width,height=height,dpi=dpi))
  } else {
    image_paths = paste0(save_dir,plot_name,".",formats)
    image_paths %>% map(~ ggsave(.x,plot=p,width=width,height=height,dpi=dpi))
  }

}












