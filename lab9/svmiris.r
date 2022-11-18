install.packages("e1071")
library(e1071)
data("iris")
head(iris)
summary(iris)
library(ggplot2)
qplot(Petal.Length,Petal.Width,data = iris, color = Species)
help("svm")
svm_model1 <- svm(Species~.,data = iris)
summary(svm_model1)
plot(svm_model1, data = iris,Petal.Width~Petal.Length, slice =list(Sepal.Width = 3.000, Sepal.Length = 4.000))
pred1 <- predict(svm_model1, iris)
table1 <- table(Predicted = pred1, Actual = iris$Species)
table1
Model1_accuracyRate = sum(diag(table1))/sum(table1)
Model1_accuracyRate

Model1_MissClassificationRate = 1 - Model1_accuracyRate
Model1_MissClassificationRate

svm_model2 <- svm(Species~., data = iris, kernel = "linear")
plot(svm_model2, data = iris,Petal.Width~Petal.Length, slice = list(Sepal.Width = 3,Sepal.Length = 4))
summary(svm_model2)
pred2 <- predict(svm_model2, iris)
table2 <- table(Predicted = pred2, Actual = iris$Species)
table2
Model2_accuracyRate = sum(diag(table2))/sum(table2)
Model2_accuracyRate
Model2_MissClassificationRate = 1 - Model2_accuracyRate
Model2_MissClassificationRate


svm_model3 <- svm(Species~., data = iris, kernel = "polynomial")
plot(svm_model3, data = iris,Petal.Width~Petal.Length, slice = list(Sepal.Width = 3,Sepal.Length = 4))
summary(svm_model3)
pred3 <- predict(svm_model3, iris)
table3 <- table(Predicted = pred3, Actual = iris$Species)
table3
Model3_accuracyRate = sum(diag(table3))/sum(table3)
Model3_accuracyRate
Model3_MissClassificationRate = 1 - Model3_accuracyRate
Model3_MissClassificationRate

svm_model4 <- svm(Species~., data = iris, kernel = "sigmoid")
plot(svm_model4, data = iris,Petal.Width~Petal.Length, slice = list(Sepal.Width = 3,Sepal.Length = 4))
summary(svm_model4)
pred4 <- predict(svm_model4, iris)
table4 <- table(Predicted = pred4, Actual = iris$Species)
table4
Model4_accuracyRate = sum(diag(table4))/sum(table4)
Model4_accuracyRate
Model4_MissClassificationRate = 1 - Model4_accuracyRate
Model4_MissClassificationRate

