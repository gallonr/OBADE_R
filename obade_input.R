
# Import des librairies ---------------------------------------------------

require(tidyverse)
require(ggplot2)



#  Import des fichiers ----------------------------------------------------

ficheTerrain <- read_delim("./data/enquete/ficheterrain.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE)

