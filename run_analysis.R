###
# run_analysis.R 
# jagzuk ... June 18, 2015
# for Getting and Cleaning Data course project 
# See README.md and CodeBook.md for futher information
###

### 0. Set up environment and get data

# Check/Create/Set Working diretory:
wd.old <- getwd()
wd.name <- "./getdataProject"
if (!file.exists(wd.name)) { 
        dir.create(wd.name) 
} else { print("Working directory exists, skipping create")}
setwd(wd.name)

## Check/Get/Extract the source data files into the directory "data"
data.dir <- "data"
if (!file.exists(data.dir)) { 
        dir.create(data.dir) 
        data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        data.file <- "data/data.zip"
        #download: wb option needed for windows
        download.file( url = data.url, destfile = data.file, mode = "wb") 
        unzip(data.file, exdir = data.dir)
} else {
        
        print("Data directory found, skipping download")
}
setwd("data/UCI HAR Dataset") # Access the new directory

### 1. Merges the training and the test sets to create one data set.###
print("#1 Merging datasets, this may take some time!")

# Use read.table and rbind to combine the training data in to train.all
print("...Merging training data ...")
s <- read.table("train/subject_train.txt", header=FALSE, col.names = "SubjectID")
x <- read.table("train/X_train.txt", header=FALSE)
y <- read.table("train/Y_train.txt", header=FALSE, col.names = "ActivityID")
train <- cbind(s,y,x)

# Same for the test data, reuse s,x,y
print("...Merging test data ...")
s <- read.table("test/subject_test.txt", header=FALSE, col.names = "SubjectID")
x <- read.table("test/X_test.txt", header=FALSE)
y <- read.table("test/Y_test.txt", header=FALSE, col.names = "ActivityID")
test <- cbind(s,y,x)
rm(x,y,s) # finished with these, clean up!

# Combine train and test data into one file
print("...Merging training and test data into one file ...")
data.all <- rbind(train, test)
names(data.all) <- c("Subject", "Activity")
rm(train, test) # finished with these, clean up!


### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
print("#2 Extracting mean and sd measurements ...")
features <- read.table("features.txt", header=FALSE, col.names = c("FeatureID", "FeatureName"))
features.selected <- grep("mean\\(\\)|std\\(\\)", features$FeatureName, ignore.case=TRUE, value=TRUE)
data.all <- data.all[,c(c(1:2), grep("mean\\(\\)|std\\(\\)",features$FeatureName, ignore.case=TRUE) + 2)]

### 3. Uses descriptive activity names to name the activities in the data set ###
print("#3 Adding decriptive names to activities ...")
# Read in the lables, then rewrite the activty name column with the names supplied
activity.labels <- read.table("activity_labels.txt", header = FALSE)
data.all$Activity <- factor(data.all$Activity, levels = activity.labels$V1, labels = activity.labels$V2)

### 4. Appropriately labels the data set with descriptive variable names. ###
print("#4 Adding desctiptive names to the variables ...")
# The feature names are still in the features.selected object,
#just need to add SubjectID and ActivityName if front of them ...
names(data.all) <- c("SubjectID", "ActivityName", features.selected)

### 5. From the data set in step 4, creates a second, independent tidy data set 
###    with the average of each variable for each activity and each subject.
print("#5 Calculating averages and writing tidy_data_set.txt ...")
# Use aggregate function to compute summary statistics of data
data.all.tidy <- aggregate(. ~ SubjectID + ActivityName, data.all, mean)
# Order by SubjectId, then by ActivityName
data.all.tidy <- data.all.tidy[order(data.all.tidy$SubjectID, data.all.tidy$ActivityName),]
# Write the tidy dataset, supress row naming
data.file.tidy <- "tidy_data_set.txt"
write.table(data.all.tidy, data.file.tidy, row.name = FALSE)

### End of assignment
print("## File written, cleaning up and signing off!")
# Reset the working directory
setwd(wd.old)
# cleaning up the environment
rm(list = ls())

