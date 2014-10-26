## Getting and Cleaning Data - Project Coursera

### Description

The current repository contains the R script and the CodeBook of the Project Course "Getting and Cleaning data" part of the Data Science specialization

The project consists in the collection, work, clean and preparation of tidy data of a set of files in the .txt format.

### Data Source

The data defined to do the work is in the url: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data can be found in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Summary

To complete the task the project instructions were defined as:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each 
variable for each activity and each subject.

### Process Description to obtain Tidy Data

### Section 1. Merges the training and the test sets to create one data set.

Download the data from the URL into a working directory that later must be seted. In this case the adress was:
D:/DataScience/WorkingDirectory/run_analysis

Its important to remember that this adress works only for the author´s working directory and must be change if the script its going to be used later, according to the directory when the files will be downloaded. 

Then  we must read the data. Was used the "read.table()" function. An advice: Is more easy to work when the data is splited by set (training and test). The user can focus and visualize much better the information.

Once the common and individual data was readed this one needs to be merged. The "cbind" function to merge the individual data set and the "rbind" function to merge the whole data set  were used to this task.

In the process of merging the cleaning is developed. The idea is to obtain a data set when teh activity labels and feautures are defined. That one of the reasons to assign column names to the tables.

### Section 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
In order to extract the mean and standar deviation measurements of the data set it was used the "grepl" function. That allows us select the pattern that we need to work. This selection by patterns then were saved in a vector than then is compared whith the column names to substract the information that we need.

### Section 3. Uses descriptive activity names to name the activities in the data set

To merge the dataset by activity the script used the "merge" function. That merges the activity lables to the data set created by the activityId column that describes the training and test labels.

### Section 4. Appropriately labels the data set with descriptive variable names. 

The data set with descriptive variable names used the "gsub" function to match and replace patterns in the column names.

### Section 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

It was used the ddply functionality to obtain the average of the data by subject and label.

### CodeBook

In the codebook readers will find a detailed explanation of the variables



