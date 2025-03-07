####Data load
data<-read.csv(file.choose())

head(data)
tail(data)

str(data)
data$Gen<- as.character(x =data$Gen)
str(data)
head(data)

rownames(data)<-c(data$Gen)

head(data)
data1 <-data[,-1]
head(data1)



###Load the library
library("factoextra")
library("FactoMineR")

#PCA Analysis
res.pca <- PCA(data1, graph = F)
print(res.pca)
summary(res.pca)

res.pca <- PCA(data1, graph = TRUE)



####Eigenvalue Analysis
eig.val <- get_eigenvalue(res.pca)
eig.val


#### Graphical view####

##Scree plot
fviz_eig(res.pca, choice = "eigenvalue", geom.="bar", barfill="green4", addlabels = TRUE)



## Percentage of explained variance
fviz_eig(res.pca, geom.="bar", barfill="green3", addlabels = TRUE, hjust = -0.8, ylim = c(0, 45))


# Contributions of variables to PC1
fviz_contrib(res.pca, choice = "var", axes = 1, top = 7)

# Contributions of variables to PC2
fviz_contrib(res.pca, choice = "var", axes = 2, top = 7)


### Quality check of PCA by Individuals 
fviz_pca_ind(res.pca,col.ind="cos2",gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), repel=TRUE)

### Quality check of PCA by variables
fviz_pca_var(res.pca, arrowsize = 1.5, labelsize = 4, col.var = "contrib",gradient.cols = c("#FC4E07", "#E7B800", "blue"), repel = TRUE)



###Biplot
  
fviz_pca_biplot(res.pca, repel = TRUE,
                  col.var = "#2E9FDF", 
                  col.ind = "#696969" )

###Cos2
fviz_pca_biplot(res.pca,
                label = "var",
                col.ind = "cos2",
                col.var = "black",
                gradient.cols = c("blue","green","red"))

###Contribution
fviz_pca_biplot(res.pca,
                label = "var",
                col.ind = "black",
                col.var = "contrib",
                gradient.cols = c("blue","green","red"))
