rm(list=ls()) # Clears workspace

#system("sudo apt install librsvg2-dev libv8-dev -y") # Install linux dependency for rsvg 


PKG <- c("sf","renv","tidyverse","raster")

for (p in PKG) {
  if(!require(p,character.only = TRUE)) {  
    install.packages(p)
    require(p,character.only = TRUE)}
}
rm(PKG,p)
renv::snapshot()

# Unzip code function -----------------------------------------------------
decompress_file <- function(file, directory, .file_cache = FALSE) {
  
  if (.file_cache == TRUE) {
    print("decompression skipped")
  } else {
    
    # Set working directory for decompression
    # simplifies unzip directory location behavior
    wd <- getwd()
    setwd(directory)
    
    # Run decompression
    decompression <-
      system2("unzip",
              args = c("-o", # include override flag
                       file),
              stdout = TRUE)
    
    # uncomment to delete archive once decompressed
    file.remove(file) 
    
    # Reset working directory
    setwd(wd); rm(wd)
    
    # Test for success criteria
    # change the search depending on 
    # your implementation
    if (grepl("Warning message", tail(decompression, 1))) {
      print(decompression)
    }
  }
}

## Download NLCD 2016 data
dir.create(file.path('Data'), recursive = TRUE)
setwd("./Data")
download.file("https://s3-us-west-2.amazonaws.com/mrlc/NLCD_2016_Land_Cover_L48_20190424.zip","NLCD2016.zip")
system.time(decompress_file("NLCD2016.zip", "."))


