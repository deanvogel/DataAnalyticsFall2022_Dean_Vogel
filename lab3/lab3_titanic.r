require(rpart)
Titan_rpart = rpart(Survived ~., data= Titanic)
Titan_rpart 
plot(Titan_rpart,margin = 0.5)
text(Titan_rpart,use.n=TRUE, all=TRUE, cex=.8)

tree_Titan<-ctree(Survived ~., data=Titanic)
plot(tree_Titan)

titan_h = hclust(dist(as.matrix(Titanic)))
titan_h
plot(titan_h)
