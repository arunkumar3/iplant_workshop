# ggplot tutorial
# Arun Kumar Jalanila 
# Febraury 22,2014

#install packages ggplot2, plyr, ggthemes, reshape2
install.packages("ggplot2",dependencies = TRUE)
install.packages("plyr")
install.packages("ggthemes")
install.packages("reshape2")

#importing the library
library("ggplot2")
library("plyr")
library("ggthemes")
library("reshape2")

#creating a aesthetics for the iris data using length and width
myplot <- ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width))

summary(myplot) #summary of the ggplot

#creating a geometry using geom_point along with ggplot then it will create a plot 

myplot + geom_point()
