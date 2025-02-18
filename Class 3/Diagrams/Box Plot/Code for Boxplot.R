## Box Plot By Yousuf Islam
# load your data table
#find the sample data to organize your data table

data1<-read.csv(file.choose())

#Check the data
head(data1)

# Create a boxplot by using geom_boxplot() function of ggplot2 package
library(ggplot2)

#modify the name of x and y axis as required 
crop = ggplot(data = data1, mapping = aes(x=Gen, y=weight))+ geom_boxplot()
crop



# add mean to ggplot2 boxplot, legend position
ggplot(data1, aes(x = Gen, y = weight, fill = Gen)) +
  geom_boxplot() + theme(legend.position = "top") +
  stat_summary(fun = "mean", geom = "point", shape = 1,
               size = 2, color = "black")

# saving the final figure
ggsave("barplot.png", width = 4, height = 3, dpi = 1000)



# add mean to ggplot2 boxplot, legend position
ggplot(data1, aes(x = Gen, y = weight, fill = Gen)) +
  geom_boxplot() + theme(legend.position = "top") +
  stat_summary(fun = "mean", geom = "point", shape = 1,
               size = 2, color = "black")+
  ### modify You theme and Tittle 
  theme_minimal() +  # Clean theme
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+ ## remove grids and BG
  theme(legend.position = "", # blank position if you want to remove the legends
        axis.text.x = element_text(angle = 45, hjust = 1, size = 12),  # Rotate x-axis labels
        axis.title = element_text(size = 14, face = "bold"),
        plot.title = element_text(size = 16, face = "bold", hjust = 0.5)) +  # Title customization
  labs(title = "Weight Distribution by Genotype",  
       x = "Genotype",  
       y = "Weight (g)",  
       fill = "Genotype",  
       color = "Genotype")  # Customized labels

# saving the final figure
ggsave("barplot2.png", width = 6, height = 4, dpi = 1000)


## Let's Fun With R##
library(ggplot2)
library(ggpubr)  # For statistical significance annotation
library(ggsignif) # For adding significance brackets

ggplot(data1, aes(x = Gen, y = weight, fill = Gen)) +
  
  # Violin plot for density representation
  geom_violin(alpha = 0.3, trim = FALSE, color = "gray40") + 
  
  # Boxplot overlay with transparency
  geom_boxplot(alpha = 0.6, outlier.shape = NA, width = 0.3) +  
  
  # Jittered raw data points with transparency
  geom_jitter(aes(color = weight), width = 0.2, size = 1.8, alpha = 0.6) +  
  
  # Mean point as a white-filled circle with black border
  stat_summary(fun = mean, geom = "point", shape = 21, size = 3, 
               fill = "white", color = "black", stroke = 1.5) +  
  
  # Median point as a red-filled diamond with black border
  stat_summary(fun = median, geom = "point", shape = 23, size = 3, 
               fill = "red", color = "black", stroke = 1.5) +  
  
  
  # Custom fill and color gradients
  scale_fill_viridis_d(option = "C") +  
  scale_color_viridis_c(option = "B") +  
  
  # Facet wrap for additional grouping (if needed, e.g., location, treatment)
  # facet_wrap(~ Location, scales = "free") +  
  
  # Custom theme modifications
  theme_classic() +  
  theme(
    legend.position = "top",
    axis.text.x = element_text(angle = 45, hjust = 1, size = 12),  # Rotate x-axis labels
    axis.title = element_text(size = 14, face = "bold"),
    plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
    panel.grid.major = element_line(color = "gray90", linetype = "dashed")  # Soft grid lines
  ) +
  
  # Labels
  labs(title = "Weight Distribution by Genotype",  
       x = "Genotype",  
       y = "Weight (g)",  
       fill = "Genotype",  
       color = "Weight Gradient") 
ggsave("barplot+ Violin+ dot.png", width = 10, height = 8, dpi = 1000)

## Thank You
