---
title: 'OBADE : Pêche à pieds'
author: "Régis GALLON & Aurélie GARCIA"
date: "22/01/2020"
knit: (function(inputFile, encoding) { 
      rmarkdown::render(inputFile,
                        encoding=encoding, 
                        output_file=file.path(dirname(inputFile), 'export/Rmd', 'obade_descriptbase.html')) })
output:
  html_document: 
    df_print: kable
    keep_md: yes
    theme: paper
    toc: yes
subtitle: Description des jeux de données
---






## Contexte (à developper)

- observatoire de la pêche à pieds
- base de données ESTAMP
- description de la base
- si lacunes -> localisation spatio-temporelle

On se focalise principalement sur les données de "pêche à pieds"


### 1 `enquete_detail.csv`

#### 1.1 Description de la base

Le jeu de données `enquete_detail.csv` est composé de 1418 lignes (= observations) et 24 colonnes (= variables)

<div class="kable-table">

                                 Class        Nombre_Elements   Nombre_NA  Description                                                                                                                                                                
-------------------------------  ----------  ----------------  ----------  ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Libellé Sortie                   character               1237           0  2018-04-16-EGMP-SEN-004                                                                                                                                                    
Code Enquète                     character               1249           0  2018-04-16_EGMP_116_355807                                                                                                                                                 
Commune résidence                character                321         482  ST CAST LE GUILDO                                                                                                                                                          
Département                      character                  9        1406  13 - Bouches-du-Rhône : 1 - 14 - Calvados : 4 - 27 - Eure : 2 - 37 - Indre-et-Loire : 1 - 50 - Manche : 1 - 77 - Seine-et-Marne : 1 - 78 - Yvelines : 1 - 91 - Essonne : 1 
Pays                             character                  3        1415  Allemagne : 1 - France : 2                                                                                                                                                 
De passage                       character                  4         623  en séjour sur une commune : 638 - Non renseigné : 12 - pour la journée : 145                                                                                               
Commune séjour                   character                 49        1149  ST CAST LE GUILDO                                                                                                                                                          
Durée séjour                     numeric                   29        1217  7                                                                                                                                                                          
Hebergement                      character                  8        1291  Bateau : 2 - Camping : 13 - Camping car : 39 - Famille/Amis : 11 - Location/Hotel : 9 - Résidence secondaire : 43 - Terrain privé : 10                                     
Premier Séjour                   character                  4        1276  Non : 98 - Non renseigné : 29 - Oui : 15                                                                                                                                   
Fréquence Visites                numeric                   18        1349  12                                                                                                                                                                         
Influence Destination            character                  4        1337  Non, secondaire : 63 - Oui, déterminant : 1 - Oui, en partie : 17                                                                                                          
Influence Date                   character                  3        1337  Non, secondaire : 76 - Oui, en partie : 5                                                                                                                                  
Sexe - Pécheur                   character                  4         477  F : 369 - M : 551 - Non renseigné : 21                                                                                                                                     
Annee Naissance - Pécheur        numeric                   66         506  1950                                                                                                                                                                       
CSP - Pécheur                    character                 21         477  7_Retraités                                                                                                                                                                
Sexe - Autre membre              character                  3         939  F : 263 - M : 216                                                                                                                                                          
Annee Naissance - Autre membre   numeric                   81         960  1954                                                                                                                                                                       
CSP - Autre membre               character                 20        1145  7_Retraités                                                                                                                                                                
Tri récolte                      character                  7         616  Non Triée : 72 - Panier vide : 88 - Récolte conforme : 278 - Récolte non vérifiée : 117 - Tri complet : 199 - Tri partiel : 48                                             
Accueil                          character                  5         139  Bon : 1202 - Mauvais : 10 - Moyen : 60 - Refus : 7                                                                                                                         
Sensibilisation                  character                  5         612  Moyen : 85 - Non : 23 - Non renseigné : 2 - Oui : 696                                                                                                                      
Remarques pécheur                character                 14        1177  Réglementation                                                                                                                                                             
Précisions remarques             character                144        1238  pêche conforme 100%                                                                                                                                                        

</div>

# ```{r detailPeche.na, echo=FALSE}
# ggplot(detailPeche.resum,aes(x = row.names(detailPeche.resum),y=(Nombre_NA/nrow(detailPeche))*100))+
#   geom_bar(stat="identity") + ylab("% de données non renseignées") + xlab("")+
#   theme_bw()+
#   theme(axis.text.x = element_text(angle=90,vjust=0.5,hjust=1))
# ```




#### 1.2 Emprise spatiale et temporelle




enquetePeche.resum <- descript.database(enquetePeche)
jourPeche.resum <- descript.database(jourPeche)
pratPeche.resum <- descript.database(pratPeche)
prepPeche.resum <- descript.database(prepPeche)
ficheTerrain.resum <- descript.database(ficheTerrain)





