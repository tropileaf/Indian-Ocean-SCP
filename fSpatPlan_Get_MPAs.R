
# Status <- c("Designated", "Adopted", "Inscribed", "Established")
# Parent <- 
# Desig <- c("National", "Regional", "International", "Not Applicable")

# Get locked in areas ----
fSpatPlan_Get_MPAs <- function(PUs, 
                               cCRS = "+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0", 
                               Status = "Designated", 
                               Desig = c("National", "Regional", "International", "Not Applicable")){
  
  MPAs <- read_rds(file.path("Data", "MPAs.rds")) %>% 
    st_transform(cCRS) %>% # Transform if need to
    filter(STATUS %in% Status & DESIG_TYPE %in% Desig)
  
  LockedIn <- PUs %>% 
    st_centroid() %>% #Second, get all the pu's with < 50 % area on land (approximated from the centroid)
    st_within(MPAs, sparse = FALSE) %>%
    rowSums() %>% 
    as.logical()
  
  LockedIn <- PUs %>% 
    mutate(locked_in = LockedIn)
  
  return(LockedIn)
  
}
