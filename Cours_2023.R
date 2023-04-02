#Cours_004
#Importation de données
  #Type CSv
Chemin="C:/Users/user/Desktop/mtn/ENSAE/ISE/ISEP2/SEMESTRE 2/Informatique/R_2023/cours/R ISEP 2 2023"
file=paste0(Chemin,"/Base_Travail_2023.csv")
Base=read.csv2(file)
View(Base)
#Selectionner les variables nom et age
NOM= Base$Nom
AGE=Base$Age
#Filtrage des donnés suivant le sexe
femme=Base[Base$Sexe=="F",]
homme=Base[Base$Sexe=="M",]
View(femme)
View(homme)
#Agrégation de données suivant la mention pour calculer l'age moyen
Moyenne_par_age= aggregate(Base$Age, by =list(Base$Mention), FUN = mean)
View(Moyenne_par_age)
#Importation de données
#Type CSv
file1=paste0(Chemin,"/Base1.csv")
Base1=read.csv2(file1)
View(Base1)
#Fusion de données, fusion des bases ( Base et Base1)
Base_complet=merge(Base, Base1, by = "Nom")
View(Base_complet)
#Statistiques descriptives
summary(Base_complet$Salaire)
sd(Base_complet$Age)
sd(Base_complet$Salaire)
#Manipulation de données avec dplyr et tidyr
library(dplyr)
Bon_Travail =filter(Base_complet, Mention == "Bien" & Salaire < mean(Base_complet$Salaire))
#Visualisation de données avec ggplot2
# Histogramme de l'âge des clients
#ggplot(donnees, aes(x = age)) + 
  #geom_histogram()
# Diagramme en barres de la région des clients
#ggplot(donnees, aes(x = region)) + 
  #geom_bar()
library(ggplot2)
# Nuage de points de la note par rapport à l'age
ggplot(Base_complet, aes(x = Age, y = Note)) + 
  geom_point()
# Diagramme en boite 
boxplot(Base_complet$Age, main = "Diagramme en boîtes des ages", ylab = "Valeurs")
boxplot(Base_complet$Salaire, main = "Diagramme en boîtes des salaires", ylab = "Valeurs")
#Exportation de données
write.csv2(Base_complet, "Base_complet.csv", row.names = FALSE)

