
library(mlbench)
install.packages("kernlab")
library(kernlab)
#K MEANS# 


set.seed(20)
irisCluster <- kmeans(iris[, 3:4], 3, nstart = 20)
irisCluster
table(irisCluster$cluster, iris$Species)


train1 <- read.csv("../Split_Data2/training[1].csv")

# select variables v1, v2, v3

myvars <- c("FAMILY", "CHECK", "RM_GRP", "YIELD", "CLASS_OF", "GRAD")
train1 <- train1[myvars]


train1$CHECK <- as.numeric(train1$CHECK)
train1$RM_GRP <- as.numeric(train1$RM_GRP)
train1$YIELD <- as.numeric(train1$YIELD)
set.seed(12)
soybeanCluster <- kmeans(train1[,c("CHECK", "YIELD", "CLASS_OF")], 4, nstart = 20)
soybeanCluster
table(soybeanCluster$cluster, train1$RM_GRP)

soybeanCluster$cluster <- as.factor(soybeanCluster$cluster)
ggplot(iris, aes(train1$RM_GRP, train1$YIELD, color = train1$GRAD)) + geom_point()

nrow(train1)
nrow(soybeanCluster)
soybeanCluster$cluster

#########################################

set.seed(111)
obj <- mlbench.spirals(100,1,0.025)
obj
my.data <-  4 * obj$x
plot(my.data)

data(spirals)
str(spirals)
spirals[1,2]
spirals[2]
dim(spirals)
sc <- specc(spirals, centers=2)
sc
centers(sc)

size(sc)
withinss(sc)
plot(spirals, col=sc,pch=5)

######################################


data("Cassini")
nr <- NROW(Cassini$x)
ind <- sample(nr, 0.9 * nr, replace = FALSE)
party <- kmeans(Cassini$x[ind, ], 3)
table(cl_predict(party, Cassini$x[-ind, ]),
      Cassini$classes[-ind])



##########################################
ml <- read.dta("http://www.ats.ucla.edu/stat/data/hsbdemo.dta")
with(ml, table(ses, prog))

with(ml, do.call(rbind, tapply(write, prog,
                               function(x) c(M = mean(x), SD = sd(x)))))
ml$prog2 <- relevel(ml$prog, ref = "academic")
test <- multinom(prog2 ~ ses + write, data = ml)

summary(test)
unique(train1$LOCATION)

#####################################################

data(HouseVotes84)
model <- naiveBayes(Class ~ ., data = HouseVotes84)
predict(model, HouseVotes84[1:10,-1])
predict(model, HouseVotes84[1:10,-1], type = "raw")

pred <- predict(model, HouseVotes84[,-1])
table(pred, HouseVotes84$Class)
pred

data(Titanic)
m <- naiveBayes(Survived ~ ., data = Titanic)
m
predict(m, as.data.frame(Titanic)[,1:3]) # Leave out survived and frequency



data(iris)
m <- naiveBayes(Species ~ ., data = iris)
## alternatively:
m
table(predict(m, iris[,-5]), iris[,5])

ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()



##SPECTRAL##

library(kernlab)
setwd("C:/Users/User/Dropbox/SoybeanProject4741/Clara_Exp")



train2 <- read.csv("../Temp_Data/training[2].csv")
myvars <- c("CHECK", "RM", "YIELD", "CLASS_ABSENT", "FAM_SEGMENT1", "FAM_SEGMENT2", "FAM_SEGMENT3", "FAM_SEGMENT4", "FAM_SEGMENT5", "GRAD")
myvars <- c("RM", "YIELD", "CLASS_ABSENT", "GRAD")


train2<-train2[myvars]


train2$CLASS_ABSENT<-as.numeric(train2$CLASS_ABSENT)
train2$GRAD<-as.numeric(train2$GRAD)
train2$CHECK <- as.numeric(train2$CHECK)

str(train2)

df <- matrix(nrow=698,ncol=4)
df


for (i in 1:nrow(train2)){
  for (j in 1:ncol(train2)){
    df[i,j] = train2[i,j]
  }
}

train2<-df
str(train2)


library(kernlab)
sc <- specc(train2[,1:3], centers=2)
sc
centers(sc)
size(sc)
withinss(sc)
plot(train1, col=sc)
###PCA####

library(pca)
##KMEANS##

library(cluster)
library(HSAUR)
data(pottery)
km    <- kmeans(pottery,3)
dissE <- daisy(pottery) 
dE2   <- dissE^2
sk2   <- silhouette(km$cl, dE2)
plot(sk2)

