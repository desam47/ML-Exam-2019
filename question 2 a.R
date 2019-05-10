library(randomForest)

#Importing the dataset
dataset <- read.csv('question-2 (copy).csv')

#Initial look at the data
names(dataset)
summary(dataset)
dim(dataset)
str(dataset)

# Converting ‘Survived’ to a factor

dataset$age <- factor(dataset$age)

# Set a random seed
set.seed(51)
rfmodel1<- randomForest(credit ~ ., data = dataset, ntree=3, mtry=1, nodesize = 1, importance=TRUE)
summary(rfmodel1)
rfmodel1
plot(rfmodel1)
varImpPlot(rfmodel1)

tree <- getTree(rfmodel1,k=1, labelVar = TRUE)
tree
plot(tree)