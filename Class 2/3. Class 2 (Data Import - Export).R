##########Data Analysis & Visualization for Plant Breeding Research#############
##########################Md Jahid Hasan Jone###################################

####Data Import####
D1 <- read.csv(file.choose())
View(D1)

##### Data Writing #####
write.csv (D1, file = "Out1.csv")
write.csv (D1, file = "Out1.csv", row.names = F)




D1 <- read.table("TestData.txt", header = TRUE)
D1 <- read.table("TestData.txt", header = TRUE, na.string="NA")
D1


# READ.CSV FOR CSV FILES ###################################

D2 <-read.csv('TestData.csv', header = T, sep = ",")
D2 <-read.csv('TestData.csv', header = T, sep = ",", row.names = 1)
D3 <-read.csv('TestData.csv', header = T, sep = ",", row.names = 1)


################## READ.xlsx FOR excel FILES ###################################

library(xlsx)
D3 <- read.xlsx("TestData.xlsx", header = T, 1)
D3 <- read.xlsx("TestData.xlsx", header = T, 1, row.names = 1)

# read in the worksheet named mysheet
mydata <- read.xlsx("c:/myexcel.xlsx", sheetName = "mysheet")