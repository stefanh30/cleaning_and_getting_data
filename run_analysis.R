#WK4 Assignment Coursera

#load data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=F)
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=F)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=F)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",stringsAsFactors=F)
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt",stringsAsFactors=F)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=F)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",stringsAsFactors=F)
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt",stringsAsFactors=F)

#label data
colnames(x_train) <- features$V2
colnames(x_test) <- features$V2
library(plyr)
y_train <- join(y_train, activity_labels, by = "V1")
y_test <- join(y_test, activity_labels, by = "V1")
rm(activity_labels,features)

#Merge into one data frame
df<-cbind(y_train$V2,subject_train,x_train)
df2<-cbind(y_test$V2,subject_test,x_test)
colnames(df)[1] <- "activity"
colnames(df2)[1] <- "activity"
df<-rbind(df,df2)
rm(y_train,subject_train,x_train,df2,x_test,y_test,subject_test)
colnames(df)[2] <- "subject"

#Extracts metrics mean and standard deviation
df <- df[,c(1,2,grep("mean\\(|std\\(",colnames(df)))]

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
df_averages<-(df %>% group_by(activity,subject) %>%  summarise_all(funs(mean),na.rm=T))

