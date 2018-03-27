### Please install 'reshape2' package to use 'melt' and 'dcast' functions for tidy data set.

## 1. Merging test set and training set to create one data set.

Download and unzip the data set:

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile = "ProgAssign")

data <- unzip("ProgAssign", exdir = getwd())

Check file names in the test directory (currently set as working directory), set up file paths to read test and subject data. 
Read test data set ("X_test.txt"), test labels ("y_test.txt") and subject info file ("subject_test.txt"):
  
list.files()

filepath1 <- file.path(getwd(), "UCI HAR Dataset", "test", "X_test.txt")

filepath2 <- file.path(getwd(), "UCI HAR Dataset", "test", "y_test.txt")

filepath3 <- file.path(getwd(), "UCI HAR Dataset", "test", "subject_test.txt")

Xtest <- read.table(filepath1, header = F, stringsAsFactors = F, fill = T)

ytest <- read.table(filepath2, header = F, stringsAsFactors = F, fill = T)

subjecttest <- read.table(filepath3, header = F, stringsAsFactors = F, fill = T)

Change directory to 'train' folder and set up file paths to read train data and subject data. 
Read train data set ("X_train.txt"), train labels ("y_train.txt") and subject info file ("subject_train.txt"):

filepath4 <- file.path(getwd(), "UCI HAR Dataset", "train", "X_train.txt")

filepath5 <- file.path(getwd(), "UCI HAR Dataset", "train", "y_train.txt")

filepath6 <- file.path(getwd(), "UCI HAR Dataset", "train", "subject_train.txt")

Xtrain <- read.table(filepath4, header = F, stringsAsFactors = F, fill = T)

ytrain <- read.table(filepath5, header = F, stringsAsFactors = F, fill = T)

subjecttrain <- read.table(filepath6, header = F, stringsAsFactors = F, fill = T)

Merge test data set and trainig data sets into ine data set so that subject column is placed 1st, 
followed by activity ID (from "y_test.txt" and "y_train.txt") and followed by the the data sets:

DataSet <- cbind(rbind(subjecttest, subjecttrain), rbind(ytest, ytrain), rbind(Xtest, Xtrain))

Following is also solution to the question 4:

Read "features.txt" into R in order to name columns in the data set. First two columns are to be named: "Subject" and "Activity".
The rest - columns 3 to 563 named with names from "features.txt". Features file ("features.txt") contains two columns. 
Only 2nd column has names and is used to name columns in the data set. 'Function 'colnames' is used to name the columns in the data set:

filepath7 <- file.path(getwd(), "UCI HAR Dataset", "features.txt")

features <- read.table(filepath7, header = F, stringsAsFactors = F, fill = T)

colnames(DataSet)[1:2] <- c("Subject", "Activity")

colnames(DataSet)[3:563] <- features[, 2]

Now, 'DataSet' has test and training data sets combined with named columns. Naming columns with names provided in "features.txt"
also answers question 4 ("Appropriately label the data set with descriptive variable names").


## 2. Extracting only the measurements on the mean and standard deviation for each measurement.

Extract only measurements on the mean and standard deviation for each measurement from the merged data set ('DataSet') created above into new
data set ('DataSet1') based on the column names:

DataSet1 <- DataSet[, grepl("mean|std|Subject|Activity", colnames(DataSet)) & !grepl("meanFreq", colnames(DataSet))] 

Values from 'meanFreq' are not extracted becasue frequency is not a measurement.


## 3. Using descriptive activity names to name the activities in the data set.

Read "activity_labels.txt" into R:

filepath8 <- file.path(getwd(), "UCI HAR Dataset", "activity_labels.txt")

activity <- read.table(filepath8, header = F, stringsAsFactors = F, fill = T)

'activity' has two columns corresponding to number and exact activity name. Rename columns in 'activity' to "Activity#" and 'Activity':

colnames(activity)[1:2] <- c("Activity#", "Activity")

Merge 'activity' with the data set ('DataSet1'):

q3DataSet <- merge(DataSet1, activity, by.x = "Activity", by.y = "Activity#", sort = TRUE)

'q3DataSet' has 1st column corresponding to activity number followed by the subject id. Column containing activity description is placed last. Next two lines rearrange columns to the appropriate order and sets new name to the column describing the activity:

q3DataSet <- q3DataSet[, c(2, 1, 69, 3:68)]

colnames(q3DataSet)[3] <- "Activity_Description"


## 4. Appropriately labeling the data set with descriptive variable names:
This part was answered in question 1.


## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

'melt' and 'dcast' functions from the 'reshape2' package can be applied to 'q3DataSet' in order to create a tidy data set with the average of each 
variable for activity and subject. 'Subject' and 'Activity' columns will be identified as id variables for 'melt' function while the remaining columns 
as measured variables. Measured variables are identified with 'setdiff' function:

library("reshape2")

idcols <- c("Subject", "Activity", "Activity_Description")

meltq3DataSet <- melt(q3DataSet, id = idcols, measure.vars = setdiff(colnames(q3DataSet), idcols))

TidySet <- dcast(meltq3DataSet, Subject + Activity + Activity_Description ~ variable, mean)

Write 'TidySet' into a text file - "TidySet.txt":

write.table(TidySet, file = "TidySet.txt", sep = ",", row.names = FALSE)


Note 1: after running script in the R console, final data set is stored in variable 'TidySet'.
Note 2: running script may give two warnings related to the version of reshape2 package and related to duplicate of 'Activity' column. The former is caused by older versions of R that you may use. The latter is issued because both columns for 'Activity' are kept: one with activity number and the second one with activity description.