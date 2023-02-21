## GRINFISH project

### Description of metadata

## Loading

# Boot and functions
source("boot.R")

# Specific definitions
commerSamps <- c("Kuummiut", "Nuuk", "Qaanaaq", "Narsaq")
survSamps <- c("Davis Strait", "Greenland Southeast", "Baffin Bay", "Disko Bay", "Uummannaq", "Upernavik")

# Load data
metadata <- read_csv("10-19_Data/10_Raw-data/10.01_Ind-metadata/GRINFISH-metadata.csv", col_names = TRUE)

##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##
##----------------------------------------------------------------------------##

# Distribution of samples (map)

p <- ggOceanMaps::basemap(
  limits = c(-80, 37.5, 50 ,81), 
  bathymetry = T, 
  lon.interval = 10, 
  lat.interval = 10, 
  bathy.style = "poly_greys",
  land.col = "#eeeac4",
  legends = FALSE,
  grid.col = NA,
  base_size = 8)

lims <- attributes(p)$limits
graticule <- sf::st_graticule(c(lims[1], lims[3], lims[2], lims[4]), 
                              crs = attributes(p)$proj,
                              lon = seq(-180, 180, 10),
                              lat = seq(-90, 90, 10))

p <- ggOceanMaps::reorder_layers(p) +
  ggspatial::layer_spatial(data = graticule, color = "grey70", size = LS(0.1)) +
  coord_sf(xlim = lims[1:2], ylim = lims[3:4],
           crs = attributes(p)$proj, default = TRUE) +
  new_scale_fill() +
  geom_point(data = transform_coord(metadata, bind = TRUE), 
             aes(x = lon.proj, y = lat.proj, fill = Location), 
             shape = 21, size = 2, stroke = LS(0.5)) +
  scale_fill_manual(values = give_cols(numCat = 9)) +
  labs(fill = "Location", x = NULL, y = NULL)

png("30-39_Figures/31_Graphs/31.01_Maps/temp.png", width = pagewidth_in, height = pagewidth_in*0.5, 
    units = "in", res = 300)
print(p)
dev.off()

# Descriptive analysis

summary(metadata)