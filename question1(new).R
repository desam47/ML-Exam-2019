library(caret)

Traindataset<- read.csv(file = "question1.csv",header = TRUE, sep = ",")

boxplot(Traindataset$x)$out
boxplot(Traindataset$x, plot=TRUE)$out
outliers <- boxplot(Traindataset$x, plot=TRUE)$out
Traindataset[which(Traindataset$x %in% outliers),]
Traindataset <- Traindataset[-which(Traindataset$x %in% outliers),]
boxplot(Traindataset$x)


boxplot(Traindataset$y)$out
boxplot(Traindataset$y, plot=TRUE)$out
outliers <- boxplot(Traindataset$y, plot=TRUE)$out
Traindataset[which(Traindataset$y %in% outliers),]
Traindataset <- Traindataset[-which(Traindataset$y %in% outliers),]
boxplot(Traindataset$y)


?preProcess

# Selected Normalize since Data values can be scaled into the range of [0, 1] which is called normalization.

prep_first <- preProcess(Traindataset[,1:2], method = c("range"))
predict(prep_first, Traindataset)

Traindataset_new <- predict(prep_first, Traindataset)
Traindataset_new$z <- Traindataset_new$x + Traindataset_new$y
Traindataset_new


# C= 0.01 When z < 0.01 r= 1 else r = 0 
