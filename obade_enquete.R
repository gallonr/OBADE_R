require(tidyverse)
require(pillar)
source("internal_function.R")

# Chargement de la table enquete ------------------------------------------

load("./export/table/enquetePeche.Rdata")

detailPeche.resum <- descript.database(detailPeche)
enquetePeche.resum <- descript.database(enquetePeche)
jourPeche.resum <- descript.database(jourPeche)
pratPeche.resum <- descript.database(pratPeche)
prepPeche.resum <- descript.database(prepPeche)
ficheTerrain.resum <- descript.database(ficheTerrain)


ficheTerrain %>% group_by(territoire) %>% count(`site`)






enquetePeche%>% group_by(territoire) %>% count(Observateurs)



enquetePeche.resum %>% filter(pourc_NA>50)


output:
  html_document: 
  df_print: kable
fig_caption: yes
theme: paper
toc: yes
toc_depth: 4