library(dplyr)
library(stats)
library(ggplot2)
library(NbClust)
library(ggfortify)
library(cluster)

data <- read.csv("D:/Codes/Data_Science/Datasets/College_Data.csv")
summary(data)

data$Private <- ifelse(data$Private == "Yes", 1, 0)
total_Types_Count<-table(data$Private)
print(total_Types_Count)

boxplot(data$Grad.Rate)
outliers <- boxplot.stats(data$Grad.Rate)$out
cat("Outliers: ", outliers, "\n")
outlier_row <- which(data$Grad.Rate == 118)
data <- data[-outlier_row,]

significant_vars <- c()
for (col in names(data)[3:length(names(data))]) {
  table <- table(data$Private, data[[col]])
  res <- chisq.test(table)
  p_val <- res$p.value
  cat("P value for: ", col, " = ", p_val, "\n")
  if (p_val < 0.05) {
    significant_vars <- c(significant_vars, col)
  }
}


features <- data[, significant_vars]
scaled_data <- scale(features)
wss_values <- c()
for (i in 1:10) {
  kmeans_model <- kmeans(scaled_data, centers=i, nstart=10)
  wss_values[i] <- kmeans_model$tot.withinss
}

ggplot(data.frame(k=1:10, wss=wss_values), aes(x=k, y=wss)) + 
  geom_point(size=3) + 
  geom_line() + 
  labs(x="Number of clusters K", y="Within-cluster sum of squares")

k_means_model <- kmeans(scaled_data, 2)
autoplot(k_means_model,features,frame = TRUE)

features$cluster <- k_means_model$cluster

cross_tab <- table(data$Private, features$cluster)
print(cross_tab)

