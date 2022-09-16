EPI_data <- read.csv("2010EPI_data.csv")
View(EPI_data)
attach(EPI_data) 	# sets the default object
#fix(EPI_data)	# launches a simple data editor
#EPI_data$EPI prints out values EPI_data$EPI
names(EPI_data) <- as.matrix(EPI_data[1,])
EPI_data=EPI_data[-1,]
View(EPI_data)
EPI
#tf <- is.na(EPI) # records True values if the value is NA
#E <- EPI[!tf]
#E#filters out NA values, new array
E <- as.numeric(as.character(EPI))
tf <- is.na(E)
E <- E[!tf]
E
summary(E)
fivenum(E,na.rm=TRUE)
stem(E)
hist(E)
hist(E, seq(30., 95., 1.0), prob=TRUE)
lines(density(E,na.rm=TRUE,bw=1.)) # or try
#bw="SJ"
rug(E)
plot(ecdf(E), do.points=FALSE, verticals=TRUE) 
par(pty="s")
qqnorm(E); qqline(E)

x<-seq(30,95,1)
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)
boxplot(E,as.numeric(as.character(DALY)))
qqplot(E,as.numeric(as.character(DALY)))

EPI_Land = EPI[!as.numeric(as.character(Landlock))]
EPI_Land
Eland <- EPI_Land[!is.na(EPI_Land)]
hist(as.numeric(Eland))
