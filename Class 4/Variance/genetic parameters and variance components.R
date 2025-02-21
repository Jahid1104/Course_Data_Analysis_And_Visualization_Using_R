
library(variability)

a <- read.csv(file.choose())

View(a)

head(a)
tail(a)

####Analysis of Covariance####

ancova(a[3:9],a$Gen,a$Rep)



##### Estimation of Genetic Parameters#####
gen.var(a[3:9],a$Gen,a$Rep)



#####Genotypic Correlation Analysis#####
geno.corr(a[3:9],a$Gen,a$Rep)

#### Phenotypic Correlation Analysis####
pheno.corr (a[3:9],a$Gen,a$Rep)




####Estimation of direct and indirect effect####

#### Genotypic Path Analysis####
geno.path(a[9],a[3:8],a$Gen,a$Rep)

#### Phenotypic Path Analysis####
pheno.path(a[9],a[3:8],a$Gen,a$Rep)
