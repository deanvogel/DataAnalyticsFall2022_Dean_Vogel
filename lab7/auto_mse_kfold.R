library(ISLR)
library(MASS)
install.packages("boot")
library(boot)
set.seed(1)
??cv.glm
train = sample(392,196)
lm.fit <- lm(mpg~horsepower, data = Auto, subset = train)
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
lm.fit2 <- lm(mpg~poly(horsepower,2),data = Auto, subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit3 <- lm(mpg~poly(horsepower,3),data = Auto, subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)
lm.fit4 <- lm(mpg~poly(horsepower,4),data = Auto, subset = train)
mean((mpg-predict(lm.fit4,Auto))[-train]^2)
lm.fit5 <- lm(mpg~poly(horsepower,5),data = Auto, subset = train)
mean((mpg-predict(lm.fit5,Auto))[-train]^2)
set.seed(2)
train = sample(392,196)
lm.fit <- lm(mpg~horsepower, data = Auto, subset = train)
attach(Auto)
mean((mpg-predict(lm.fit,Auto))[-train]^2)
lm.fit2 <- lm(mpg~poly(horsepower,2),data = Auto, subset = train)
mean((mpg-predict(lm.fit2,Auto))[-train]^2)
lm.fit3 <- lm(mpg~poly(horsepower,3),data = Auto, subset = train)
mean((mpg-predict(lm.fit3,Auto))[-train]^2)





set.seed(17)
cv.error.10 = rep(0,10) # read documentation, help("rep")
for(i in 1:10){
  glm.fit = glm(mpg ~ poly(horsepower, i), data = Auto)
  cv.error.10[i] = cv.glm(Auto,glm.fit, K=10) $delta[1]
}
cv.error.10
