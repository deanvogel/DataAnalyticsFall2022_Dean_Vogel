data(economics, package="ggplot2")  # load data
economics$index <- 1:nrow(economics)  # create index variable
economics <- economics[1:80, ]  # retail 80rows for better graphical understanding
loessMod10 <- loess(uempmed ~ index, data=economics, span=0.10) # 10% smoothing span
loessMod25 <- loess(uempmed ~ index, data=economics, span=0.25) # 25% smoothing span
loessMod50 <- loess(uempmed ~ index, data=economics, span=0.50) # 50% smoothing span
smoothed10 <- predict(loessMod10) 
smoothed25 <- predict(loessMod25) 
smoothed50 <- predict(loessMod50)
plot(economics$uempmed, x=economics$date, type="l", main="Loess Smoothing and Prediction", xlab="Date", ylab="Unemployment (Median)")
lines(smoothed10, x=economics$date, col="red")
lines(smoothed25, x=economics$date, col="green")
lines(smoothed50, x=economics$date, col="blue")



data("cars")
plot(cars$dist, cars$speed)
lowess(cars$speed ~ cars$dist)
lines(lowess(cars$speed ~ cars$dist, f = .5), col = "blue")
lines(lowess(cars$speed ~ cars$dist, f = .4), col = "red")
lines(lowess(cars$speed ~ cars$dist, f = .7), col = "green")
lines(lowess(cars$speed ~ cars$dist, f = .8), col = "yellow")
lines(lowess(cars$speed ~ cars$dist, f = .95), col = "orange")


library(MASS)
set.seed(555)
Train <- sample(1:nrow(iris), nrow(iris)/2)
iris_Train <- iris[Train,]
iris_test <- iris[-Train,]
fit1 <- lda(Species ~ Sepal.Length + Sepal.Width +
              Petal.Length + Petal.Width, data = iris_Train)
predict1 <- predict(fit1,iris_Train)
predict1class <- predict1$class
