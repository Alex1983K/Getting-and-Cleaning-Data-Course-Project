## Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Following changes have been performed on the data set with 'run_analysis.R' script:

1. Training and test sets were merged to create one data set. Result is stored in variable 'DataSet'.
2. Mean and standard deviation data for each measurement were extracted. Result is stored in variable 'DataSet1'.
3. Descriptive activity names were used to name the activities in the data set. Result is stored in variable 'q3DataSet'.
4. Data set was appropriately labelled with descriptive variable names. Result is stored in variable 'DataSet'.
5. Independent tidy data set with the average of each variable for each activity and each subject was created. Result is stored in variable 'TidySet'.

Script is saved in 'run_analysis.R' file with its detailed explanation in 'README.md'. Please install 'reshape2' package which is needed to run the script.

## Description of 'TidySet.txt':

'TidySet.txt' is the outcome of the 'run_analysis.R' script given that original data set is stored at the working directory. This data set contains averages for each variable for each activity and each subject.  

Tidy data set has 180 rows and 69 columns. Below is the list of variables in the data set:

 colnames(TidySet)

 [1] "Subject"                    
 [2] "Activity"                   
 [3] "Activity_Description"       
 [4] "tBodyAcc-mean()-X"          
 [5] "tBodyAcc-mean()-Y"          
 [6] "tBodyAcc-mean()-Z"          
 [7] "tBodyAcc-std()-X"           
 [8] "tBodyAcc-std()-Y"           
 [9] "tBodyAcc-std()-Z"           
[10] "tGravityAcc-mean()-X"       
[11] "tGravityAcc-mean()-Y"       
[12] "tGravityAcc-mean()-Z"       
[13] "tGravityAcc-std()-X"        
[14] "tGravityAcc-std()-Y"        
[15] "tGravityAcc-std()-Z"        
[16] "tBodyAccJerk-mean()-X"      
[17] "tBodyAccJerk-mean()-Y"      
[18] "tBodyAccJerk-mean()-Z"      
[19] "tBodyAccJerk-std()-X"       
[20] "tBodyAccJerk-std()-Y"       
[21] "tBodyAccJerk-std()-Z"       
[22] "tBodyGyro-mean()-X"         
[23] "tBodyGyro-mean()-Y"         
[24] "tBodyGyro-mean()-Z"         
[25] "tBodyGyro-std()-X"          
[26] "tBodyGyro-std()-Y"          
[27] "tBodyGyro-std()-Z"          
[28] "tBodyGyroJerk-mean()-X"     
[29] "tBodyGyroJerk-mean()-Y"     
[30] "tBodyGyroJerk-mean()-Z"     
[31] "tBodyGyroJerk-std()-X"      
[32] "tBodyGyroJerk-std()-Y"      
[33] "tBodyGyroJerk-std()-Z"      
[34] "tBodyAccMag-mean()"         
[35] "tBodyAccMag-std()"          
[36] "tGravityAccMag-mean()"      
[37] "tGravityAccMag-std()"       
[38] "tBodyAccJerkMag-mean()"     
[39] "tBodyAccJerkMag-std()"      
[40] "tBodyGyroMag-mean()"        
[41] "tBodyGyroMag-std()"         
[42] "tBodyGyroJerkMag-mean()"    
[43] "tBodyGyroJerkMag-std()"     
[44] "fBodyAcc-mean()-X"          
[45] "fBodyAcc-mean()-Y"          
[46] "fBodyAcc-mean()-Z"          
[47] "fBodyAcc-std()-X"           
[48] "fBodyAcc-std()-Y"           
[49] "fBodyAcc-std()-Z"           
[50] "fBodyAccJerk-mean()-X"      
[51] "fBodyAccJerk-mean()-Y"      
[52] "fBodyAccJerk-mean()-Z"      
[53] "fBodyAccJerk-std()-X"       
[54] "fBodyAccJerk-std()-Y"       
[55] "fBodyAccJerk-std()-Z"       
[56] "fBodyGyro-mean()-X"         
[57] "fBodyGyro-mean()-Y"         
[58] "fBodyGyro-mean()-Z"         
[59] "fBodyGyro-std()-X"          
[60] "fBodyGyro-std()-Y"          
[61] "fBodyGyro-std()-Z"          
[62] "fBodyAccMag-mean()"         
[63] "fBodyAccMag-std()"          
[64] "fBodyBodyAccJerkMag-mean()" 
[65] "fBodyBodyAccJerkMag-std()"  
[66] "fBodyBodyGyroMag-mean()"    
[67] "fBodyBodyGyroMag-std()"     
[68] "fBodyBodyGyroJerkMag-mean()"
[69] "fBodyBodyGyroJerkMag-std()"

 