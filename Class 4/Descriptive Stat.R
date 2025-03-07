
###### Descriptive statistics in R by Md Jahid Hasan Jone #######

# load the iris data set and renamed it data
data <- iris 

head(data) # first 6 observations
tail(data) # last 6 observations

str(data) # structure of data set
View(data)


max(data$Sepal.Length)             # Maximum value
min(data$Sepal.Length)             # Minimum value
rng <- range(data$Sepal.Length)    # Maximum and Minimum values of data
rng


max(data$Sepal.Length) - min(data$Sepal.Length) #Difference between maximum & minimum data




range2 <- function(x) {
        range <- max(x) - min(x)
        return(range)
}


range2(data$Sepal.Length)


mean(data$Sepal.Length)
median(data$Sepal.Length)

tab <- table(data$Sepal.Length) # number of occurrences for each unique value
sort(tab, decreasing = TRUE) # sort highest to lowest

sort(table(data$Species), decreasing = TRUE)

summary(data$Sepal.Length)


quantile(data$Sepal.Length, 0.5)
quantile(data$Sepal.Length, 0.25) # first quartile
quantile(data$Sepal.Length, 0.75) # third quartile
quantile(data$Sepal.Length, 0.4) # 4th decile
quantile(data$Sepal.Length, 0.98) # 98th percentile


#Interquartile range (difference between first & third quartile)
IQR(data$Sepal.Length) 
quantile(data$Sepal.Length, 0.75) - quantile(data$Sepal.Length, 0.25)


sd(data$Sepal.Length) # standard deviation
lapply(data[, 1:4], var)
var(data$Sepal.Length) # variance



#min, first quartile, median, mean, third quartile and max
summary(data)
by(data, data$Species, summary)




data <- read.csv(file.choose())
library(pastecs)
stat.desc(data)


#Correlation
cor(data$Sepal.Length, data$Sepal.Width)


#Contingency table
data$size <- ifelse(data$Sepal.Length < median(data$Sepal.Length),
                   "small", "big"
)

table(data$size)
table(data$Species, data$size)
xtabs(~ data$Species + data$size)


#relative frequencies
prop.table(table(data$Species, data$size))

# percentages by row:
round(prop.table(table(data$Species, data$size), 1), 2) # round to 2 digits with round()

# percentages by column:
round(prop.table(table(data$Species, data$size), 2), 2) # round to 2 digits with round()





#Barplot
barplot(table(data$size)) # table() is mandatory
barplot(prop.table(table(data$size)))

library(ggplot2) 
# needed each time you open RStudio
# The package ggplot2 must be installed first

ggplot(data) +
        aes(x = size) +
        geom_bar()


#Histogram
hist(data$Sepal.Length)

ggplot(data) +
        aes(x = Sepal.Length) +
        geom_histogram()

#Boxplot
boxplot(data$Sepal.Length)
boxplot(data$Sepal.Length ~ data$Species)

ggplot(data) +
        aes(x = Species, y = Sepal.Length) +
        geom_boxplot()


#Dotplot
library(lattice)
dotplot(data$Sepal.Length ~ data$Species)

ggplot(data) +
        aes(x = Species, y = Sepal.Length) +
        geom_dotplot(binaxis = "y", stackdir = "center")

#Scatterplot
plot(data$Sepal.Length, data$Petal.Length)

ggplot(data) +
        aes(x = Sepal.Length, y = Petal.Length) +
        geom_point()

ggplot(data) +
        aes(x = Sepal.Length, y = Petal.Length, colour = Species) +
        geom_point() +
        scale_color_hue()

#Line plot
plot(data$Sepal.Length,
     type = "l") # "l" for line


#QQ-plot, For a single variable
# Draw points on the qq-plot:
qqnorm(data$Sepal.Length)
# Draw the reference line:
qqline(data$Sepal.Length)

library(car) # package must be installed first
qqPlot(data$Sepal.Length)

library(ggpubr)
ggqqplot(data$Sepal.Length)

qqPlot(data$Sepal.Length, groups = data$size) #By groups

qplot(
        sample = Sepal.Length, data = data,
        col = size, shape = size
)

#Density plot
plot(density(data$Sepal.Length))

ggplot(data) +
        aes(x = Sepal.Length) +
        geom_density()