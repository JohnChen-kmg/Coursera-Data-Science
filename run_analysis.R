#Already download and unzip the file.
library(data.table)
originalfile <- file.path("./Desktop/UCI HAR Dataset")
list.files(originalfile, recursive=TRUE)

#Q1
testX <- read.table(file.path(originalfile, "test/X_test.txt"), header = F )
testY <- read.table(file.path(originalfile, "test/Y_test.txt"), header = F )
testsubject <- read.table(file.path(originalfile, "test/subject_test.txt"), header = F )
trainX <- read.table(file.path(originalfile, "train/X_train.txt"), header = F )
trainY <- read.table(file.path(originalfile, "train/Y_train.txt"), header = F )
trainsubject <- read.table(file.path(originalfile, "train/subject_train.txt"), header = F )
features <- read.table(file.path(originalfile,"features.txt"))
labels <- read.table(file.path(originalfile,"activity_labels.txt"))

colnames(testX) = features[,2]
colnames(testY) = "ylabel"
colnames(testsubject) = "subject"
datatest <- cbind(testY, testsubject, testX)
colnames(trainX) = features[,2]
colnames(trainY) = "ylabel"
colnames(trainsubject) = "subject"
datatrain <- cbind(trainY, trainsubject, trainX)
mergedata <- rbind(datatest, datatrain)

#Q2
colNames <- colnames(mergedata)
colNames1 <- grepl("ylabel",colNames) | grepl("subject",colNames) |
        grepl("mean..",colNames) | grepl("std..",colNames)
mergedata2 <- mergedata[,colNames1]

#Q3
colnames(labels) = c("subject", "activity")
mergedata3 <- merge(mergedata2, labels, by = "subject", all.x = TRUE)

#Q4 
library(dplyr)
mergedata4 <- mergedata3[, -2]
mergedata5 <- mergedata4  %>% relocate("activity", .after = 1)
mergedata5 <- rename(mergedata5, "Subject" = "subject", "Activity" = "activity")

#Q5
data2 <- aggregate(. ~ Subject + Activity, mergedata5, mean)
data2
