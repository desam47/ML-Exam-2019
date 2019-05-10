#Importing the dataset
install.packages("caret")

require(caret)

Traindataset <- read.csv('question1.csv')

PreprocessedData <- preProcess(Traindataset, method = c("scale"), thresh = 1, rangeBounds = c(0, 1))

predict(PreprocessedData,Traindataset)