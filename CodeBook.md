## Getting and Cleaning Data

### About the origin of the data 

The data corresponds an experiment that have been carried out in a group of 30 volunteers (bracket age 19-48 years)
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing 
a smartphone (Samsung Galaxy S II) that captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

### Process Description to obtain Tidy Data

Download the data from the URL into a working directory that later must be seted. In this case the adress was:
D:/DataScience/WorkingDirectory/run_analysis

Its important to remember that this adress works only for the author´s working directory and must be change if the script its going to be used later, according to the directory when the files will be downloaded. 

Then  we must read the data. Was used the "read.table()" function. An advice: Is more easy to work when the data is splited by set (training and test). The user can focus and visualize much better the information.

Once the common and individual data was readed this one needs to be merged. The "cbind" function to merge the individual data set and the "rbind" function to merge the whole data set  were used to this task.

In the process of merging the cleaning is developed. The idea is to obtain a data set when teh activity labels and feautures are defined. That one of the reasons to assign column names to the tables.

In order to extract the mean and standar deviation measurements of the data set it was used the "grepl" function. That allows us select the pattern that we need to work. This selection by patterns then were saved in a vector than then is compared whith the column names to substract the information that we need.

To merge the dataset by activity the script used the "merge" function. That merges the activity lables to the data set created by the activityId column that describes the training and tes labels.

To 







