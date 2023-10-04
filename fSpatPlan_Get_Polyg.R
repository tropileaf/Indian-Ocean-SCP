## to cross a polygon with PUs

# load polygons (.shp)

filen <- "~/Documents/MscThesis/GitHub/SpatialPlanning_copy/Shp/Costs/Mining_resources/Crust/Crust_areas_Hein2013.shp" 
out <- fSpatPlan_Get_Polyg(filen, PUs)  # function returns out as a logical vector
PUs <- PUs %>% 
  mutate(Mine1 = out) # Add logical vector to variable called Mine1

filen2 <- "~/Documents/MscThesis/GitHub/SpatialPlanning_copy/Shp/Costs/Mining_resources/Nodules/Nodules_Hein2013.shp"
out2 <- fSpatPlan_Get_Polyg(filen2, PUs)  
PUs <- PUs %>% 
  mutate(Mine2 = out2)

# cross polygons with PUs

fSpatPlan_Get_Polyg <- function(filen, PUs){
  
  polyg_crs <- st_crs(PUs) 
  Polyg1 <- st_read(filen) %>% 
    st_transform(polyg_crs) #assign crs of PUs to polygon
  
  Polyg1PUs <- PUs %>% 
    st_centroid() %>% 
    st_within(Polyg1, sparse = FALSE) %>% 
    rowSums() %>%
    as.logical()
  
  # Polyg1PUs <- PUs %>% 
  #   mutate(Name = Polyg1PUs) ##assign new column to PUs (call it name of shp)
  # 
  return(Polyg1PUs)
}