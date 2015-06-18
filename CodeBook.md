
# Getting and Cleanind Data Project
### CodeBook for run_analysis.R and tidy_data_set.txt

## Overview
The R script `run_analysis.R` found in this repository is a solution to the project assingment for the Getting and Cleaning Data course.  

The project uses [data collected from the accelerometers of Samsung Galaxy S smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The source data set is provided as a zip library containing a number of normalized text-based data files without headers. 

Of relevance to this project, the data comprises 3 files each of training and test data, one file containing activity labels and one file containing variable labels. See Source Data Overview for more information on these files.

The purporse of the script is to combine these 8 files into a single tidy data set showing the average of all mean and standard deviation observations for each subject and activity. This is achived by performing the following operations:

- Download and unzip the source data
- Merge 3 traing and 3 test into one core data table
- Select only the average and standard deviation measures
- Replace the activity id with a descriptive name
- Add the appropriate names to all variables
- Calculate the average value for each subject/activity
- Write the resultant data set to the file tidy_data_set.txt

## Programming Environment

| Attibute            | Value          |
| ------------------- | -------------- |
| Operating System | Windows 8.1 |
| R Version | 3.1.3 (2015-03-09) |
| R Studio Version | 0.98.1103 |
| R Libraries loaded | None, Core only |


## Operation of the script

The code comprises a single R script `run_analysis.R` that was developed using R studio. The script uses R core commands and does not require any additional libraries.

When first executed the script will download and unpack the data into a subdirectory of the current working directory (the sub directory will be created if it is not already present). 

On subsequent executions, the script will detect that the data has already been download and will skip the download set.

**Note:** This code was written for use on Windows 8.1, on other operating systems you may need to modify the parameters of the download.file command.


## Source Data Overview

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Source Data Files

| Content         | File Name(s)                              |
| --------------- | ----------------------------------------- |
| Training Data | subject_train.txt, X_train.txt, Y_train.txt |
| Test Data | subject_test.txt, X_test.txt, Y_test.txt |
| Activity Labels | activity_labels.txt |
| Variable Labels | features.txt |


## tidy_data_set.txt Summary

- Format: .txt tab seperated
- Headers: Yes
- Obervations: 181
- Subjects: 30; Anonymous
- Activities: 6; LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS
- Variables: 65

## tidy_data_set.txt Attibute list

| Name                | Type    | Comments                       |
| ------------------- | ------- |----------------------------------- |
| SubjectID  | integer | 1-30 |
|ActivityName | char | LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS |
|tBodyAcc-mean()-X | numeric||
|tBodyAcc-mean()-Y | numeric||
|tBodyAcc-mean()-Z | numeric||
|tBodyAcc-std()-X | numeric||
|tBodyAcc-std()-Y | numeric||
|tBodyAcc-std()-Z | numeric||
|tGravityAcc-mean()-X | numeric||
|tGravityAcc-mean()-Y | numeric||
|tGravityAcc-mean()-Z | numeric||
|tGravityAcc-std()-X | numeric||
|tGravityAcc-std()-Y | numeric||
|tGravityAcc-std()-Z | numeric||
|tBodyAccJerk-mean()-X | numeric||
|tBodyAccJerk-mean()-Y | numeric||
|tBodyAccJerk-mean()-Z | numeric||
|tBodyAccJerk-std()-X | numeric||
|tBodyAccJerk-std()-Y | numeric||
|tBodyAccJerk-std()-Z | numeric||
|tBodyGyro-mean()-X | numeric||
|tBodyGyro-mean()-Y | numeric||
|tBodyGyro-mean()-Z | numeric||
|tBodyGyro-std()-X | numeric||
|tBodyGyro-std()-Y | numeric||
|tBodyGyro-std()-Z | numeric||
|tBodyGyroJerk-mean()-X | numeric||
|tBodyGyroJerk-mean()-Y | numeric||
|tBodyGyroJerk-mean()-Z | numeric||
|tBodyGyroJerk-std()-X | numeric||
|tBodyGyroJerk-std()-Y | numeric||
|tBodyGyroJerk-std()-Z | numeric||
|tBodyAccMag-mean() | numeric||
|tBodyAccMag-std() | numeric||
|tGravityAccMag-mean() | numeric||
|tGravityAccMag-std() | numeric||
|tBodyAccJerkMag-mean() | numeric||
|tBodyAccJerkMag-std() | numeric||
|tBodyGyroMag-mean() | numeric||
|tBodyGyroMag-std() | numeric||
|tBodyGyroJerkMag-mean() | numeric||
|tBodyGyroJerkMag-std() | numeric||
|fBodyAcc-mean()-X | numeric||
|fBodyAcc-mean()-Y | numeric||
|fBodyAcc-mean()-Z | numeric||
|fBodyAcc-std()-X | numeric||
|fBodyAcc-std()-Y | numeric||
|fBodyAcc-std()-Z | numeric||
|fBodyAccJerk-mean()-X | numeric||
|fBodyAccJerk-mean()-Y | numeric||
|fBodyAccJerk-mean()-Z | numeric||
|fBodyAccJerk-std()-X | numeric||
|fBodyAccJerk-std()-Y | numeric||
|fBodyAccJerk-std()-Z | numeric||
|fBodyGyro-mean()-X | numeric||
|fBodyGyro-mean()-Y | numeric||
|fBodyGyro-mean()-Z | numeric||
|fBodyGyro-std()-X | numeric||
|fBodyGyro-std()-Y | numeric||
|fBodyGyro-std()-Z | numeric||
|fBodyAccMag-mean() | numeric||
|fBodyAccMag-std() | numeric||
|fBodyBodyAccJerkMag-mean() | numeric||
|fBodyBodyAccJerkMag-std() | numeric||
|fBodyBodyGyroMag-mean() | numeric||
|fBodyBodyGyroMag-std() | numeric||
|fBodyBodyGyroJerkMag-mean() | numeric||
|fBodyBodyGyroJerkMag-std() | numeric||

