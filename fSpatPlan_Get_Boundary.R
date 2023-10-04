

fSpatPlan_Get_Boundary <- function(Limits, cCRS){
  
  # Create function for creating polygon
  polygon <- function(x){
    x <- x %>% 
      as.matrix() %>%
      list() %>%
      st_polygon() %>%
      st_sfc(crs = "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0") %>%
      st_transform(crs = cCRS)
  }
  
  # if Pacific-centered, two polygons then union them:
  if (is.numeric(Limits) && cCRS == "+proj=robin +lon_0=180 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs"){
    
    Bndry1 <- tibble(x = seq(-180, Limits["xmin"], by = 1), y = Limits["ymin"]) %>%
      bind_rows(tibble(x = Limits["xmin"], y = seq(Limits["ymin"], Limits["ymax"], by = 1))) %>%
      bind_rows(tibble(x = seq(Limits["xmin"], -180, by = -1), y = Limits["ymax"])) %>%
      bind_rows(tibble(x = -180, y = seq(Limits["ymax"], Limits["ymin"], by = -1))) %>% 
      polygon()
    
    Bndry2 <- tibble(x = seq(180, Limits["xmax"], by = -1), y = Limits["ymin"]) %>%
      bind_rows(tibble(x = Limits["xmax"], y = seq(Limits["ymin"], Limits["ymax"], by = 1))) %>%
      bind_rows(tibble(x = seq(Limits["xmax"], 180, by = 1), y = Limits["ymax"])) %>%
      bind_rows(tibble(x = 180, y = seq(Limits["ymax"], Limits["ymin"], by = -1))) %>% 
      polygon()
    
    Bndry <- st_union(Bndry1, Bndry2)

    return(Bndry)
  }
  
  if (is.numeric(Limits)){
    Bndry <- tibble(x = seq(Limits["xmin"], Limits["xmax"], by = 1), y = Limits["ymin"]) %>%
      bind_rows(tibble(x = Limits["xmax"], y = seq(Limits["ymin"], Limits["ymax"], by = 1))) %>%
      bind_rows(tibble(x = seq(Limits["xmax"], Limits["xmin"], by = -1), y = Limits["ymax"])) %>%
      bind_rows(tibble(x = Limits["xmin"], y = seq(Limits["ymax"], Limits["ymin"], by = -1))) %>%
      polygon()
    
    return(Bndry)
  }
  
  if (Limits == "Global"){
    Bndry <- tibble(x = seq(-180, 180, by = 1), y = -90) %>%
      bind_rows(tibble(x = 180, y = seq(-90, 90, by = 1))) %>%
      bind_rows(tibble(x = seq(180, -180, by = -1), y = 90)) %>%
      bind_rows(tibble(x = -180, y = seq(90, -90, by = -1))) %>%
      polygon()
    
    return(Bndry)
  }
  
  # Add Pacific
  
  
  # Add Indian
  
 if (Limits == "IO"){
   Bndry <- tibble(x = seq(18, 130, by = 1), y = -39) %>%
      bind_rows(tibble(x = 130, y = seq(-39, 34, by = 1))) %>%
     bind_rows(tibble(x = seq(130, 18, by = -1), y = 34)) %>%
      bind_rows(tibble(x = 18, y = seq(34, -39, by = -1))) %>%
     polygon()
    
    return(Bndry)
  }
  
  # Add Atlantic
  
  
  # Add EEZs
  
  if (Limits == "Australia"){
    # Get Australia's EEZ
    Bndry <- st_read("Data/World_EEZ_v11/eez_v11.shp", quiet = TRUE) %>% 
      filter(TERRITORY1 == "Australia") %>% 
      st_transform(cCRS)
    return(Bndry)
  }
  
  
}
