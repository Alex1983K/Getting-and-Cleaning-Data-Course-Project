## 1. Merging test set and training set to create one data set.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "ProgAssign")
data <- unzip("ProgAssign", exdir = getwd())
filepath1 <- file.path(getwd(), "UCI HAR Dataset", "test", "X_test.txt")
filepath2 <- file.path(getwd(), "UCI HAR Dataset", "test", "y_test.txt")
filepath3 <- file.path(getwd(), "UCI HAR Dataset", "test", "subject_test.txt")
Xtest <- read.table(filepath1, header = F, stringsAsFactors = F, fill = T)
ytest <- read.table(filepath2, header = F, stringsAsFactors = F, fill = T)
subjecttest <- read.table(filepath3, header = F, stringsAsFactors = F, fill = T)
filepath4 <- file.path(getwd(), "UCI HAR Dataset", "train", "X_train.txt")
filepath5 <- file.path(getwd(), "UCI HAR Dataset", "train", "y_train.txt")
filepath6 <- file.path(getwd(), "UCI HAR Dataset", "train", "subject_train.txt")
Xtrain <- read.table(filepath4, header = F, stringsAsFactors = F, fill = T)
ytrain <- read.table(filepath5, header = F, stringsAsFactors = F, fill = T)
subjecttrain <- read.table(filepath6, header = F, stringsAsFactors = F, fill = T)
DataSet <- cbind(rbind(subjecttest, subjecttrain), rbind(ytest, ytrain), rbind(Xtest, Xtrain))
filepath7 <- file.path(getwd(), "UCI HAR Dataset", "features.txt")
features <- read.table(filepath7, header = F, stringsAsFactors = F, fill = T)
colnames(DataSet)[1:2] <- c("Subject", "Activity")
colnames(DataSet)[3:563] <- features[, 2]

## 2. Extracting only the measurements on the mean and standard deviation for each measurement.
DataSet1 <- DataSet[, grepl("mean|std|Subject|Activity", colnames(DataSet)) & !grepl("meanFreq", colnames(DataSet))] 

## 3. Using descriptive activity names to name the activities in the data set.
filepath8 <- file.path(getwd(), "UCI HAR Dataset", "activity_labels.txt")
activity <- read.table(filepath8, header = F, stringsAsFactors = F, fill = T)
colnames(activity)[1:2] <- c("Activity#", "Activity")
q3DataSet <- merge(DataSet1, activity, by.x = "Activity", by.y = "Activity#", sort = TRUE)
q3DataSet <- q3DataSet[, c(2, 1, 69, 3:68)]
colnames(q3DataSet)[3] <- "Activity_Description"

## 4. Appropriately labeling the data set with descriptive variable names:
## This part was answered in question 1.

## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
library("reshape2")
idcols <- c("Subject", "Activity", "Activity_Description")
meltq3DataSet <- melt(q3DataSet, id = idcols, measure.vars = setdiff(colnames(q3DataSet), idcols))
TidySet <- dcast(meltq3DataSet, Subject + Activity + Activity_Description ~ variable, mean)
write.table(TidySet, file = "TidySet.txt", sep = ",", row.names = FALSE)
