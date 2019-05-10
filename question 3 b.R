library(randomForest)

#Importing the dataset
Traindataset <- read.csv('question-2 (copy).csv')

Testdataset <- read.csv('question-3-b.csv')
Testdataset <-  subset(Testdataset,select = -c(credit))
  
#Initial look at the data
names(Traindataset)
summary(Traindataset)
dim(Traindataset)
str(Traindataset)

names(Testdataset)
summary(Testdataset)
dim(Testdataset)
str(Testdataset)


# Converting ‘Survived’ to a factor

Traindataset$age <- factor(Traindataset$age)

Testdataset$age <- factor(Testdataset$age)


# Set a random seed
set.seed(51)
rfmodel1<- randomForest(credit ~ ., data = Traindataset, ntree=3, mtry=1, nodesize = 1, importance=TRUE)
summary(rfmodel1)
rfmodel1
plot(rfmodel1)
varImpPlot(rfmodel1)

print(rfmodel1)

prediction <-predict(rfmodel1, Testdataset)


tree <- getTree(rfmodel1,k=1, labelVar = TRUE)
tree
plot(tree)