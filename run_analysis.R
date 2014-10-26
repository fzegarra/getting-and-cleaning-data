# run_analysis.R
#
# Coursera Getting and Cleaning Data Course Project
# 
# Create one R script called "run_analysis.R" that does the following instructions, handling the data
# set from: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.


# 0. Seting the working directory where the data was downloaded 
setwd("D:/DataScience/WorkingDirectory/run_analysis")
# 0.1. Upload dplyr function
library(dplyr)

# 1. Merges the training and the test sets to create one data set.
# 1.1 Use read.table() function to read the ".txt" files 
# 1.1.1 Reading common data  
features        <-  read.table("features.txt", header=FALSE)
activity_labels <-  read.table("activity_labels.txt", header=FALSE)

# 1.1.2 Reading training data
subject_train   <-read.table("subject_train.txt", header=FALSE)
training_set    <-read.table("X_train.txt", header=FALSE)
training_labels <-read.table("y_train.txt", header=FALSE)

# 1.1.3 Reading test data
subject_test    <-read.table("subject_test.txt", header=FALSE)
test_set        <-read.table("X_test.txt", header=FALSE)
test_labels     <-read.table("y_test.txt", header=FALSE)

# 1.2 Using colnames() function to assign column names 

colnames(activity_labels)  <- c("activityId","activityNames")
colnames(subject_train)    <- "subjectID"
colnames(subject_test)     <- "subjectID"
colnames(training_set)     <- features[,2] 
colnames(test_set)         <- features[,2] 
colnames(training_labels)  <- "activityId"
colnames(test_labels)      <- "activityId"

# 1.3 Merging the training and test sets in one data set
# 1.3.1 Merging the data training set
trainingSet <- cbind(training_labels, subject_train, training_set) 

# 1.3.2 Merging the data test set 
testSet     <- cbind(test_labels, subject_test ,test_set)

# 1.3.3 Combine training and test by rows to create a final data set
dataset <- rbind(trainingSet, testSet)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# 2.1 Create a vector that contains the column names 

colnames <- colnames(dataset)

# 2.2 Using "grepl" function that allows us select the pattern between " .." 
# in the vector called colnames

data_int<-(grepl("mean", colnames) | grepl("std", colnames) | grepl("subjectID", colnames) | grepl("activityId", colnames))

# 2.3 Subseting the mean and standar deviation

dataset_mean_std <- dataset[data_int==TRUE]

# 3 Uses descriptive activity names to name the activities in the data set.

# 3.1 Merge the dataset by acitivity ID from activity_labels 
dataset_mean_std <- merge(dataset_mean_std,activity_labels,by='activityId',all.x=TRUE)

# 4 Appropriately labels the data set with descriptive variable names.
# Using gsub to match and replace patterns

colnames(dataset_mean_std) <- gsub("\\(|\\)","",colnames(dataset_mean_std), perl = TRUE)
colnames(dataset_mean_std) <- gsub("GyroJerk","GyroJerkMag",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("Gyro","GyroMag",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("Mag","Magnitude",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("^t","Time",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("^f","Freq",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("\\.mean","Mean",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("\\.std",".StdDev",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("Freq\\.","Freq",colnames(dataset_mean_std))
colnames(dataset_mean_std) <- gsub("Freq$","Freq" ,colnames(dataset_mean_std))

# 5. From the data set in step 4, creates a second, independent tidy data set with the 
# average of each 

dataset_mean_std_2<- ddply(dataset_mean_std, c("subjectID","activityId"), numcolwise(mean))
write.table(dataset_mean_std_2, file = "dataset_mean_std_2.txt", row.names=FALSE)
