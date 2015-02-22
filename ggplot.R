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

#creating a plot with adding color to each group using color attribute
myplot <- ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,color =Species)) 
myplot + geom_point(size=3)

#creating a plot with adding shape to each group using shape attribute in geom point
myplot <- ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,color =Species)) 
myplot + geom_point(aes(shape =Species),size=5)


#sampling thousand rows from diamonds data set and plotting using ggplot and geom_point
d2 <- diamonds[sample(1:dim(diamonds)[1],1000),] #sampling 1000 rows from total number of rows of diamonds data set
d2plot <- ggplot(data=d2,aes(x=carat,y=price,color=color))
d2plot + geom_point(size =3)

##########        STATS               ###############

#import MASS library
library(MASS)
#creating a boxplot using geom_boxplot
ggplot(birthwt,aes(factor(race),bwt)) +geom_boxplot()


##########         FACETS                ###############
#creating a facet grouping by species using facet_grid
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,color =Species)) +
  geom_point(size =3) +
  facet_grid(Species ~.)

#creating a facet grouping by species vertically using facet_grid
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,color =Species)) +
  geom_point(size =3) +
  facet_grid(.~ Species)

#creating a facet grouping by species using facet_wrap
ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width,color =Species)) +
  geom_point(size =3) +
  facet_wrap(~ Species)


##########       Colors             ###################
library("RColorBrewer")
library("reshape2")

#creating plots based on 
df <- melt(iris,id.vars="Species") #melt is used for pivoting the rows based on the columns specified 
ggplot (df,aes(Species,value,fill = variable)) +
  geom_bar(stat ="identity",position = "dodge") + # dodge species is used for stacking up the bars side by side
  scale_fill_brewer(palette = "Set1")

#creating plots based on 
df <- melt(iris,id.vars="Species") #melt is used for pivoting the rows based on the columns specified 
ggplot (df,aes(Species,value,fill = variable)) +
  geom_bar(stat ="identity",position = "dodge") + # dodge species is used for stacking up the bars side by side
  scale_fill_manual(values=c("red","yellow","brown","black"))
