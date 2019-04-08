#WK4 Assignment Coursera
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#load data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F)
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=F)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=F)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",stringsAsFactors=F)
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=F)
body_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",stringsAsFactors=F)
body_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",stringsAsFactors=F)
body_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",stringsAsFactors=F)
body_gyro_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",stringsAsFactors=F)
body_gyro_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",stringsAsFactors=F)
body_gyro_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",stringsAsFactors=F)
total_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",stringsAsFactors=F)
total_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",stringsAsFactors=F)
total_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",stringsAsFactors=F)

#label data
colnames(x_train) <- features$V2
library(plyr)
y_train <- join(y_train, activity_labels, by = "V1")
rm(activity_labels,features)

#Join tables
df<-cbind(y_train$V2,subject_train,x_train,body_acc_x_train,body_acc_y_train,body_acc_z_train,body_gyro_x_train, 
          body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)
rm(y_train,subject_train,x_train,body_acc_x_train,body_acc_y_train,body_acc_z_train,body_gyro_x_train, 
   body_gyro_y_train, body_gyro_z_train, total_acc_x_train, total_acc_y_train, total_acc_z_train)

colnames(df)
