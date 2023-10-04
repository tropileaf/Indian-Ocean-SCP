fSpatPlan_Get_Cost <- function(PUs, cCRS){
  
  # TODO Add some filtering ability to get the cost only for specific groups
  
  Cost <- terra::rast("/Users/jason/GitHub/SpatialPlanning/Data/Cost/Cost_Raster_Sum.grd") %>% #remove personal path?
    terra::as.polygons(trunc = FALSE, dissolve = FALSE, na.rm=FALSE) %>% # Convert to polygon data
    st_as_sf() %>% # Convert to sf
    st_transform(cCRS) %>% # Transform to robinson
    st_interpolate_aw(PUs, extensive = FALSE) %>% ## intersect with PUs
    rename(Cost = layer)
}

##############
#Lea


fSpatPlan_Get_Cost <- function(PUs, cCRS){
  
  # TODO Add some filtering ability to get the cost only for specific groups
  
  FishingCost <- terra::rast("Data/Cost/Cost_Raster_Sum.grd") %>% 
    terra::as.polygons(trunc = FALSE, dissolve = FALSE, na.rm=FALSE) %>% # Convert to polygon data
    st_as_sf() %>% # Convert to sf
    st_transform(cCRS) %>% # Transform 
    st_interpolate_aw(PUs, extensive = FALSE) %>% ## intersect with PUs
    rename(FishingCost = layer)
}
