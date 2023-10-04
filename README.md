# Indian Ocean High Seas Conservation Planning

MPA design using the R package 'prioritizr' for spatial optimization. 

This work is based on the Systematic Conservation Planning approach, and optimizes MPA design
to minimize conflicts with the fishing, shipping and deep-sea mining industries simultaneously. This offers two main advantages:
- a more efficient implementation of the protected areas
- comprehensive protection against cumulative negative human impacts on marine ecosystems

You will need to have an external solver, such as Gurobi or cbc. You will also need the spatial data listed below.


Background features:


- World (https://www.naturalearthdata.com/downloads/)

- ABNJ (https://www.marineregions.org/downloads.php)

- ISA leased areas for deep-sea mining (https://isa.org.jm/minerals/reserved-areas)


Conservation features:


- IBAs (http://datazone.birdlife.org/) (you will need to email Birdlife International for access)

- EBSAs (https://www.cbd.int/ebsa/ebsas) (see the SI of the article for names and abbreviations)

- IMMAs (https://www.marinemammalhabitat.org/immas/)

- Deep-sea features (https://www.bluehabitats.org/) with hydrothermal vents: Beaulieu & Szafrański (2020)


Cost layers:


- Fishing cost layer, available in raster format from Jason D. Everett (UQ/CSIRO/UNSW) or Lea Fourchault (UQ/RBINS)

- Shipping cost layer from Halpern et al. (2013 and 2015) (https://knb.ecoinformatics.org/view/doi%3A10.5063%2FF1JW8C4R#urn%3Auuid%3A5266a53d-fc81-478e-ae28-013f21e4e9c1)

The deep-sea mining cost layer is made in the script using spatial data from Petersen et al. (2016) and numeric values from Hein et al. (2013), Li et al. (2022), Mizell et al. (2022) - see SI of the article.
