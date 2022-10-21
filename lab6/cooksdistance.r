r1 = c(1,7,30,60,72,98,145,212,240,399,400,450,3000,3333,5000)
summary(r1)

mtcars
head(mtcars)
model1 <- lm(mpg~cyl + wt,data = mtcars)
plot(model1,pch=18,col='red',which=c(4))

CooksDistance <- cooks.distance(model1)
cookround <- round(CooksDistance, 5)
sort(cookround)

library(ISLR)
head(Hitters)
dim(Hitters)
HittersData <- na.omit(Hitters)
dim(HittersData)
head(HittersData)
SalaryPredict1<- lm(Salary~.,data =HittersData)
summary(SalaryPredict1)

cooksD<- cooks.distance(SalaryPredict1)
influential <- cooksD[(cooksD> (3 * mean(cooksD,na.rm=TRUE)))]
influential

influentialnames <- names(influential)
influentialnames

library(dplyr)
outliers<- HittersData[influentialnames,]
HittersWithoutOutliers <- HittersData %>% anti_join(outliers)

SalaryPredict2 <- lm(Salary~.,data = HittersWithoutOutliers)
summary(SalaryPredict2)
