# Install required packages for SkinOptics project
# Run this script once to install all necessary packages

# Function to install packages if not already installed
install_if_missing <- function(packages) {
  for (pkg in packages) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      message(paste("Installing package:", pkg))
      install.packages(pkg, dependencies = TRUE)
    } else {
      message(paste("Package already installed:", pkg))
    }
  }
}

# CRAN packages
cran_packages <- c(
  # Core analysis packages
  "knitr",
  "rmarkdown",
  "here",
  
  # Data manipulation and visualization
  "tidyverse",      # includes dplyr, ggplot2, scales, etc.
  "patchwork",
  
  # Specialized packages
  "openxlsx",       # Reading Excel files
  "KernSmooth",     # Kernel smoothing methods
  
  # Spatial analysis packages
  "sf",             # Simple features for spatial data
  "terra",          # Raster data handling
  "rnaturalearth",  # World map data
  "rnaturalearthdata", # Additional map data
  "units",          # Unit conversions
  
  # Reproducible research
  "workflowr"       # Workflow management
)

# Install CRAN packages
message("Installing CRAN packages...")
install_if_missing(cran_packages)

# Check if rnaturalearthhires is needed (optional high-resolution data)
if (!require("rnaturalearthhires", quietly = TRUE)) {
  message("\nOptional: Installing rnaturalearthhires for high-resolution maps...")
  message("This requires installation from rOpenSci's repository")
  tryCatch({
    install.packages("rnaturalearthhires",
                     repos = "https://ropensci.r-universe.dev",
                     type = "source")
  }, error = function(e) {
    message("Note: rnaturalearthhires installation failed, but it's optional.")
  })
}

message("\n======================")
message("Package installation complete!")
message("======================")
