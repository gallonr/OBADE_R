
# Import des librairies ---------------------------------------------------

require(tidyverse)
require(ggplot2)



#  Import des fichiers ----------------------------------------------------

ficheTerrainVal <- read_delim("./data/enquete/valide/ficheterrain.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","T","t","t","i","t","d","c","c",
                                                           "c","c","c","c","c","c","c","c","c","c",
                                                           "c","c","c","d","d","c","c","c","c","c"))

prepPecheVal<- read_delim("./data/enquete/valide/enquete_preparation_peche.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","c","c","t","c","c","c",
                       "c","c","i","i","i","i","i","i",
                       "i","c","c","c","c","c","c","c","c"))

pratPecheVal <- read_delim("./data/enquete/valide/enquete_pratique_peche.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","c","c","c","c",
                                                           "c","c","c","i","c","d",
                                                           "c","d","c","c","c","c",
                                                           "c","c","i","c","c","c","c","c","c"))

jourPecheVal <- read_delim("./data/enquete/valide/enquete_peche_jour.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types=list("c","c","t","d","d","d","c","c",
                                                    "c","c","c","d","d","d","c","c",
                                                    "d","d","c","d"))

detailPecheVal <- read_delim("./data/enquete/valide/enquete_detail.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types =list("c","c","c","c","c","c","c","i","c",
                                                         "c","d","c","c","c","i","c","c","i",
                                                       "c","c","c","c","c","c"))

connPecheVal <- read_delim("./data/enquete/valide/enquete_connaissance_pecheur.csv", 
                        ";", escape_double = FALSE, 
                        locale = locale(encoding = "ISO-8859-1"), 
                        trim_ws = TRUE,col_types =list("c","c","c","c","c","c","i","c","c",
                                                       "c","c","c","c","c","i","c","c","c",
                                                       "c","c","c","c","c","c"))


detailPecheVal <- detailPecheVal %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
jourPecheVal <- jourPecheVal %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
prepPecheVal <- prepPecheVal %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
pratPecheVal <- pratPecheVal %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
connPecheVal <- connPecheVal %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)

enquetePecheVal <- full_join(prepPecheVal,ficheTerrainVal,by=c("libelle_sortie"="libellé sortie")) %>% 
  full_join(pratPecheVal,"libelle_sortie") %>% full_join(jourPecheVal,"libelle_sortie") %>% 
  full_join(detailPecheVal,"libelle_sortie") %>% full_join(connPecheVal,"libelle_sortie")

enquetePecheVal <- enquetePecheVal %>% select(-c(`Code Enquète.x.x`,`Code Enquète.y`,`Code Enquète.y.y`,
                                           `Libellé Sortie.y`,`Libellé Sortie.x.x`,`Libellé Sortie.y.y`))


ficheTerrainTerm <- read_delim("./data/enquete/termine/ficheterrain.csv", 
                              ";", escape_double = FALSE, 
                              locale = locale(encoding = "ISO-8859-1"), 
                              trim_ws = TRUE,col_types = list("c","c","T","t","t","i","t","d","c","c",
                                                              "c","c","c","c","c","c","c","c","c","c",
                                                              "c","c","c","d","d","c","c","c","c","c"))

prepPecheTerm<- read_delim("./data/enquete/termine/enquete_preparation_peche.csv", 
                          ";", escape_double = FALSE, 
                          locale = locale(encoding = "ISO-8859-1"), 
                          trim_ws = TRUE,col_types = list("c","c","c","c","t","c","c","c",
                                                          "c","c","i","i","i","i","i","i",
                                                          "i","c","c","c","c","c","c","c","c"))

pratPecheTerm <- read_delim("./data/enquete/termine/enquete_pratique_peche.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types = list("c","c","c","c","c","c",
                                                           "c","c","c","i","c","d",
                                                           "c","d","c","c","c","c",
                                                           "c","c","i","c","c","c","c","c","c"))

jourPecheTerm <- read_delim("./data/enquete/termine/enquete_peche_jour.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types=list("c","c","t","d","d","d","c","c",
                                                         "c","c","c","d","d","d","c","c",
                                                         "d","d","c","d"))

detailPecheTerm <- read_delim("./data/enquete/termine/enquete_detail.csv", 
                             ";", escape_double = FALSE, 
                             locale = locale(encoding = "ISO-8859-1"), 
                             trim_ws = TRUE,col_types =list("c","c","c","c","c","c","c","i","c",
                                                            "c","d","c","c","c","i","c","c","i",
                                                            "c","c","c","c","c","c"))

connPecheTerm <- read_delim("./data/enquete/termine/enquete_connaissance_pecheur.csv", 
                           ";", escape_double = FALSE, 
                           locale = locale(encoding = "ISO-8859-1"), 
                           trim_ws = TRUE,col_types =list("c","c","c","c","c","c","i","c","c",
                                                          "c","c","c","c","c","i","c","c","c",
                                                          "c","c","c","c","c","c"))


detailPecheTerm <- detailPecheTerm %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
jourPecheTerm <- jourPecheTerm %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
prepPecheTerm <- prepPecheTerm %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
pratPecheTerm <- pratPecheTerm %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)
connPecheTerm <- connPecheTerm %>% unite("libelle_sortie",'Libellé Sortie':'Code Enquète',na.rm = TRUE, remove = FALSE)

enquetePecheTerm <- full_join(prepPecheTerm,ficheTerrainTerm,by=c("libelle_sortie"="libellé sortie")) %>% 
  full_join(pratPecheTerm,"libelle_sortie") %>% full_join(jourPecheTerm,"libelle_sortie") %>% 
  full_join(detailPecheTerm,"libelle_sortie") %>% full_join(connPecheTerm,"libelle_sortie")

enquetePecheTerm <- enquetePecheTerm %>% select(-c(`Code Enquète.x.x`,`Code Enquète.y`,`Code Enquète.y.y`,
                                                 `Libellé Sortie.y`,`Libellé Sortie.x.x`,`Libellé Sortie.y.y`))

ficheTerrain <- bind_rows(ficheTerrainVal,ficheTerrainTerm)
prepPeche <- bind_rows(prepPecheVal,prepPecheTerm)
pratPeche <- bind_rows(pratPecheVal,pratPecheTerm)
jourPeche <- bind_rows(jourPecheVal,jourPecheTerm)
detailPeche <- bind_rows(detailPecheVal,detailPecheTerm)
connPeche <- bind_rows(connPecheVal,connPecheTerm)
enquetePeche <- bind_rows(enquetePecheVal,enquetePecheTerm)

save(enquetePeche,ficheTerrain,prepPeche, pratPeche, jourPeche, detailPeche,connPeche,
     enquetePecheVal,ficheTerrainVal,prepPecheVal,pratPecheVal,jourPecheVal,detailPecheVal,connPecheVal,
     enquetePecheTerm,ficheTerrainTerm,prepPecheTerm,pratPecheTerm,jourPecheTerm,detailPecheTerm,connPecheTerm,
     file="./export/table/enquetePeche.Rdata")
