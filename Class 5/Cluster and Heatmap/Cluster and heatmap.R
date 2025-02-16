
###Load the library
library("pheatmap")

###Load the data
data<-read.csv(file.choose()) #without cluster

head(data)
str(data)

rownames(data)<-c(data$Name)
head(data)

newdata<-data [ , -1]
head(newdata)


matx <- scale(newdata)
heatmap(matx, scale = "row")

###Draw Heatmap with Row & Column Clusters (Euclidean", "ward.D2", method )
pheatmap(matx, 
         color=colorRampPalette(c("navy", "white", "red"))(50))


pheatmap(matx, 
         clustering_distance_rows = "euclidean",
         clustering_distance_cols = "euclidean", clustering_method = "ward.D2",
         cutree_rows = 5, cutree_cols =5, 
         legend = T,
         fontsize = 11,
         color=colorRampPalette(c("navy", "white", "red"))(50))
