iris <- read.csv("C:/Users/박준형/Documents/기초통계실습1/iris.csv", header=T)

summary(iris)

head(iris)

colnames(iris)

mean(iris$Petal.Length, na.rm=T)

iris$Petal.Length[is.na=T]<- mean(iris$Petal.Length, na.rm=T)


iris$size <- "low"

iris$size[iris$Sepal.Length>6]<- "high"

range(iris$Sepal.Length,na.rm=T)

range_iris_SEpal.lenth<-range(iris$Sepal.Length,na.rm=T)[2]-range(iris$Sepal.Length,na.rm=T)[1]
range_iris_SEpal.lenth


stripchart(iris$Sepal.Length)



