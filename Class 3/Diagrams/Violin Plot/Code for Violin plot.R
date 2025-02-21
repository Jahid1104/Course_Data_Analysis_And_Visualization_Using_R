## Code For Violin Plot By Yousuf Islam
# load your data table
#find the sample data to organize your data table

data1<-read.csv(file.choose())

#Check the data
head(data1)


# Usage: Install and load all required packages


# Create a violin plot
library(ggplot2)
library(tidyverse)
library(hrbrthemes)
library(viridis)

# Violin basic
data1 %>%                                  ##data1 to be passed directly into ggplot() for better readability
ggplot( aes(x=Gen, y=weight, fill=Gen)) + ## modify X and Y axis as you need for Your data 
  geom_violin() +
  scale_fill_viridis(discrete = T, alpha=0.1, option="A") +
                                   # alpha value define Transparency (here 0.1= 10%) of the graph Change it O to 1 
  theme_ipsum() +                  ## Applies the modern and minimalist theme and remove Unnecessary grid line
  theme(
    
    plot.title = element_text(size=11) # change plot title size
  ) +
  ggtitle("") + ## Add you title of the graph in quotation mark
  xlab("")      ## Add X axis level

# saving the final figure
ggsave("barplot.png", width = 4, height = 3, dpi = 1000)


####Violin+Dot

# Load ggplot2
library(ggplot2)

# Read the data
data1 <- read.csv(file.choose()) ## load Data from Violin Plot 2
head(data1)
 ## Copy Group and  Protein..aa. from the head result and  modify AA with  and  BB with to Group and  Protein..aa.
ggplot(data1, aes(x = AA, y = BB, fill = Group)) +
  geom_violin(alpha = 1, trim = FALSE) +   ## remove trim = FALSE and and see the result
  geom_dotplot(binaxis = "y",
               stackdir = "center",
               dotsize = 1.1, ##change dot size to fit the dot to plot area
               fill=1) +
  theme(
    panel.background = element_blank(),  # Remove only the plot area background
    plot.background = element_blank(),    # Remove the background of the whole plot
    axis.line = element_line(color = "black", size = 0.7),  # Keep axis lines
    axis.ticks = element_line(color = "black", size = 0,7)  # Keep axis ticks
  )

# saving the final figure
ggsave("barplot.png", width = 4, height = 3, dpi = 1000)

## Go Back to ggplot(data1, aes(x = AA, y = BB, fill = Group))
## Channge Protein..aa.   to    Mol.Weight..kDa.,   pI  and  GRAVY one by one and see the results


##Thank You