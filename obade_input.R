
# Import des librairies ---------------------------------------------------

require(tidyverse)
require(ggplot2)



#  Import des fichiers ----------------------------------------------------

ficheTerrain <- read_delim("./data/enquete/ficheterrain.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","T","t","t","i","t","d","c","c",
                                                           "c","c","c","c","c","c","c","c","c","c",
                                                           "c","c","c","d","d","c","c","c","c","c"))

prepPeche<- read_delim("./data/enquete/enquete_preparation_peche.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","c","c","t","c","c","c",
                       "c","c","i","i","i","i","i","i",
                       "i","c","c","c","c","c","c","c","c"))

pratPeche <- read_delim("./data/enquete/enquete_pratique_peche.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","c","c","c","c",
                                                           "c","c","c","i","c","d",
                                                           "c","d","c","c","c","c",
                                                           "c","c","i","c","c","c","c","c","c"))

jourPeche <- read_delim("./data/enquete/enquete_peche_jour.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types=list("c","c","t","d","d","d","c","c",
                                                    "c","c","c","d","d","d","c","c",
                                                    "d","d","c","d"))

detailPeche <- read_delim("./data/enquete/enquete_detail.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types =list("c","c","c","c","c","c","c","i","c",
                                                         "c","d","c","c","c","i","c","c","i",
                                                       "c","c","c","c","c","c"))


enquetePeche <- full_join(prepPeche,ficheTerrain,by=c("Libellé Sortie"="libellé sortie")) %>% 
  full_join(pratPeche,"Libellé Sortie") %>% full_join(jourPeche,"Libellé Sortie") %>% 
  full_join(detailPeche,"Libellé Sortie")

enquetePeche <- enquetePeche %>% select(-c(`Code Enquète.x.x`,`Code Enquète.y`,`Code Enquète.y.y`))

save(enquetePeche,ficheTerrain,prepPeche,pratPeche,jourPeche,detailPeche,file="./export/table/enquetePeche.Rdata")
