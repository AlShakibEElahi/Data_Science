dataframe <- read.csv("D:/Codes/Data_Science/Datasets/Iris.csv")
str(dataframe)

#custom normalize function
normali<-function(x) {(x-min(x))/(max(x)-min(x))}

#lapply returns as a list
iris_norm<-as.data.frame((lapply(dataframe[,c(2,3,4,5)], normali)))
iris_norm
summary(iris_norm)

#random selection of 70% of data
random <-sample(1:nrow(iris_norm),0.7*nrow(iris_norm))
iris_train <-iris_norm[random,]
iris_test <- iris_norm[-random,]
iris_train_labels <- dataframe[random,6]
iris_test_labels <- dataframe[-random,6]


library(class)
#k=ceil(sqrt(total number of instances))
ml <- knn(iris_train,iris_test,cl=iris_train_labels,k=13)
ml

#confusion matrix
tab <-table (ml,iris_test_labels)
tab

