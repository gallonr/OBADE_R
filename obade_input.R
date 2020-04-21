
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

connPeche <- read_delim("./data/enquete/enquete_connaissance_pecheur.csv", 
                        ";", escape_double = FALSE, 
                        locale = locale(encoding = "ISO-8859-1"), 
                        trim_ws = TRUE,col_types =list("c","c","c","c","c","c","i","c","c",
                                                       "c","c","c","c","c","i","c","c","c",
                                                       "c","c","c","c","c"))


detailPeche <- detailPeche %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
jourPeche <- jourPeche %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
prepPeche <- prepPeche %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
pratPeche <- pratPeche %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
connPeche <- connPeche %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)

enquetePeche <- full_join(prepPeche,ficheTerrain,by=c("libelle_sortie"="libellé sortie")) %>% 
  full_join(pratPeche,"libelle_sortie") %>% full_join(jourPeche,"libelle_sortie") %>% 
  full_join(detailPeche,"libelle_sortie") %>% full_join(connPeche,"libelle_sortie")

enquetePeche <- enquetePeche %>% select(-c(`Code Enquète.x.x`,`Code Enquète.y`,`Code Enquète.y.y`,
                                           `Libellé Sortie.y`,`Libellé Sortie.x.x`,`Libellé Sortie.y.y`))

save(enquetePeche,ficheTerrain,prepPeche,pratPeche,jourPeche,detailPeche,connPeche,file="./export/table/enquetePeche.Rdata")
