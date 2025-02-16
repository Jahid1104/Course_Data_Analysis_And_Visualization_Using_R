##Bar Plot With lettering By Yousuf Islam

# loading the appropriate libraries
library(readr)
library(ggplot2)

# loading and checking the data
data1 <- read.csv(file.choose())
print(data1)
str(data1)

## $ D    : num see the D colum from str the column is in Numerical 
## We should Convert it to categorical Data 
data1$D1<-as.factor(data1$D) ## Convert numerical D to a new D1 column which is categorical
View(data1) #$#A new D1 column Created

# Gray-scale barplot
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.6, alpha=1) ## change width and alpha from 0 t0 1 to change width and Transperancy ( here 60% and 100%)
                                                  ##(To counts occurrences of categorical values. stat = "count")

# Adding error bars
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=0.2) # Adding error bars

#Customizing x and y titles
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)")  ##Customizing x and y titles


#Formating the overall visualisation
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) ## remove BG and major and minor Grid

#Adding the compact letter display from Tukey’s test
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey)) ## Add lettering

#Define their position
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3) ## replace left and upper, respectively

##Adding colors to the barplots
ggplot(data1, aes(D1, mean)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8, fill = "steelblue") +   # change color to add another color
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2, color = "steelblue4") + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3, color = "steelblue4")

##Barplots colored according Tukey’s test results
ggplot(data1, aes(D1, mean, fill = Tukey)) + ## fill color according to lettering
  geom_bar(stat = "identity", width=0.8, alpha=0.8) +
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3)

# colored barplot according Tukey's test results
ggplot(data1, aes(D1, mean, fill = Tukey)) + 
  geom_bar(stat = "identity", width=0.8, alpha=0.8, show.legend = FALSE) +
  scale_fill_brewer(palette = "BrBG") +  ## change color palette for better visualization
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width = 0.2) + 
  labs(x="Diameter (mm)", y="Radon Released (%)") +
  theme_bw() + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  geom_text(aes(label=Tukey), nudge_x = 0.25, nudge_y = 5, size = 3)


# saving the final figure
ggsave("barplot.png", width = 4, height = 3, dpi = 1000)

##Thank You
