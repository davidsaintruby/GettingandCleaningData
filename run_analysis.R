## run_analysis.R
##
## getting and cleaning data course project
## david saint ruby
## September 2014
##
##
## note - this script should be run from a directory which contains the
## UCR HAR Dataset folder and related subfolders
##
##
## date			changes
## -----------		---------------------
## 09202014		initial
##
##


## plyr library
library(plyr)


## advise our working directory
print(paste("Working directory: ",getwd()))


## read in our X_train and X_test data sets

## X_train
if (!file.exists(".\\UCI HAR Dataset\\train\\X_train.txt")) stop("File does not exist - X_train.txt")
X_train <- read.table(".\\UCI HAR Dataset\\train\\X_train.txt", sep = "" , header = F)

## X_test
if (!file.exists(".\\UCI HAR Dataset\\test\\X_test.txt")) stop("File does not exist - X_test.txt")
X_test <- read.table(".\\UCI HAR Dataset\\test\\X_test.txt", sep = "" , header = F)



## pull in our subject files - align on position

## subject_train
if (!file.exists(".\\UCI HAR Dataset\\train\\subject_train.txt")) stop("File does not exist - subject_train.txt")
subject_train <- read.table(".\\UCI HAR Dataset\\train\\subject_train.txt", sep = "" , header = F)

## subject_test
if (!file.exists(".\\UCI HAR Dataset\\test\\subject_test.txt")) stop("File does not exist - subject_test.txt")
subject_test <- read.table(".\\UCI HAR Dataset\\test\\subject_test.txt", sep = "" , header = F)




## load up the y files

## y_train
if (!file.exists(".\\UCI HAR Dataset\\train\\y_train.txt")) stop("File does not exist - y_train.txt")
y_train <- read.table(".\\UCI HAR Dataset\\train\\y_train.txt", sep = "" , header = F)

## y_test
if (!file.exists(".\\UCI HAR Dataset\\test\\y_test.txt")) stop("File does not exist - y_test.txt")
y_test <- read.table(".\\UCI HAR Dataset\\test\\y_test.txt", sep = "" , header = F)



## pull in a couple more utility files for later

## features.txt
if (!file.exists(".\\UCI HAR Dataset\\features.txt")) stop("File does not exist - features.txt")
features <- read.table(".\\UCI HAR Dataset\\features.txt", sep = "" , header = F)

## activity_labels.txt
if (!file.exists(".\\UCI HAR Dataset\\activity_labels.txt")) stop("File does not exist - activity_labels.txt")
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt", sep = "" , header = F)



## rename our columns for subject
names(subject_train)[1] <- "subject"
names(subject_test)[1] <- "subject"

## rename our X sets to feature names
names(X_train) <- features[,2]
names(X_test) <- features[,2]


## rename our columns for activity
names(y_train)[1] <- "activity"
names(y_test)[1] <- "activity"

## rename our columns for activity labels
names(activity_labels)[1] <- "activity"
names(activity_labels)[2] <- "activity_label"


## bind our columns to the left side for test and train
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)


## join up all into one
trainandtest <- rbind(train, test)

## only use the columns we want
trainandtest <- trainandtest[,grep("subject|activity|std\\(\\)|mean\\(\\)", colnames(trainandtest))]


## merge up with activity labels
trainandtestlabeled <- merge(trainandtest,activity_labels,by="activity")

## reorder the set to bring the activity label near the front
trainandtestlabeled <- trainandtestlabeled[c(
     "subject",
     "activity",
     "activity_label",
     "tBodyAcc-mean()-X",
     "tBodyAcc-mean()-Y",
     "tBodyAcc-mean()-Z",
     "tBodyAcc-std()-X",
     "tBodyAcc-std()-Y",
     "tBodyAcc-std()-Z",
     "tGravityAcc-mean()-X",
     "tGravityAcc-mean()-Y",
     "tGravityAcc-mean()-Z",
     "tGravityAcc-std()-X",
     "tGravityAcc-std()-Y",
     "tGravityAcc-std()-Z",
     "tBodyAccJerk-mean()-X",
     "tBodyAccJerk-mean()-Y",
     "tBodyAccJerk-mean()-Z",
     "tBodyAccJerk-std()-X",
     "tBodyAccJerk-std()-Y",
     "tBodyAccJerk-std()-Z",
     "tBodyGyro-mean()-X",
     "tBodyGyro-mean()-Y",
     "tBodyGyro-mean()-Z",
     "tBodyGyro-std()-X",
     "tBodyGyro-std()-Y",
     "tBodyGyro-std()-Z",
     "tBodyGyroJerk-mean()-X",
     "tBodyGyroJerk-mean()-Y",
     "tBodyGyroJerk-mean()-Z",
     "tBodyGyroJerk-std()-X",
     "tBodyGyroJerk-std()-Y",
     "tBodyGyroJerk-std()-Z",
     "tBodyAccMag-mean()",
     "tBodyAccMag-std()",
     "tGravityAccMag-mean()",
     "tGravityAccMag-std()",
     "tBodyAccJerkMag-mean()",
     "tBodyAccJerkMag-std()",
     "tBodyGyroMag-mean()",
     "tBodyGyroMag-std()",
     "tBodyGyroJerkMag-mean()",
     "tBodyGyroJerkMag-std()",
     "fBodyAcc-mean()-X",
     "fBodyAcc-mean()-Y",
     "fBodyAcc-mean()-Z",
     "fBodyAcc-std()-X",
     "fBodyAcc-std()-Y",
     "fBodyAcc-std()-Z",
     "fBodyAccJerk-mean()-X",
     "fBodyAccJerk-mean()-Y",
     "fBodyAccJerk-mean()-Z",
     "fBodyAccJerk-std()-X",
     "fBodyAccJerk-std()-Y",
     "fBodyAccJerk-std()-Z",
     "fBodyGyro-mean()-X",
     "fBodyGyro-mean()-Y",
     "fBodyGyro-mean()-Z",
     "fBodyGyro-std()-X",
     "fBodyGyro-std()-Y",
     "fBodyGyro-std()-Z",
     "fBodyAccMag-mean()",
     "fBodyAccMag-std()",
     "fBodyBodyAccJerkMag-mean()",
     "fBodyBodyAccJerkMag-std()",
     "fBodyBodyGyroMag-mean()",
     "fBodyBodyGyroMag-std()",
     "fBodyBodyGyroJerkMag-mean()",
     "fBodyBodyGyroJerkMag-std()"
)]

## sort by subject and activity
trainandtestlabeled <- trainandtestlabeled[order(trainandtestlabeled$subject, 
	trainandtestlabeled$activity),]

## rename to TIDY names :>
trainandtestlabeled <- rename(trainandtestlabeled,
     c("subject"="subject",
     "activity"="activity",
     "activity_label"="activity_label",
     "tBodyAcc-mean()-X"="timeBodyAccMeanForX",
     "tBodyAcc-mean()-Y"="timeBodyAccMeanForY",
     "tBodyAcc-mean()-Z"="timeBodyAccMeanForZ",
     "tBodyAcc-std()-X"="timeBodyAccStdForX",
     "tBodyAcc-std()-Y"="timeBodyAccStdForY",
     "tBodyAcc-std()-Z"="timeBodyAccStdForZ",
     "tGravityAcc-mean()-X"="timeGravityAccMeanForX",
     "tGravityAcc-mean()-Y"="timeGravityAccMeanForY",
     "tGravityAcc-mean()-Z"="timeGravityAccMeanForZ",
     "tGravityAcc-std()-X"="timeGravityAccStdForX",
     "tGravityAcc-std()-Y"="timeGravityAccStdForY",
     "tGravityAcc-std()-Z"="timeGravityAccStdForZ",
     "tBodyAccJerk-mean()-X"="timeBodyAccJerkMeanForX",
     "tBodyAccJerk-mean()-Y"="timeBodyAccJerkMeanForY",
     "tBodyAccJerk-mean()-Z"="timeBodyAccJerkMeanForZ",
     "tBodyAccJerk-std()-X"="timeBodyAccJerkStdForX",
     "tBodyAccJerk-std()-Y"="timeBodyAccJerkStdForY",
     "tBodyAccJerk-std()-Z"="timeBodyAccJerkStdForZ",
     "tBodyGyro-mean()-X"="timeBodyGyroMeanForX",
     "tBodyGyro-mean()-Y"="timeBodyGyroMeanForY",
     "tBodyGyro-mean()-Z"="timeBodyGyroMeanForZ",
     "tBodyGyro-std()-X"="timeBodyGyroStdForX",
     "tBodyGyro-std()-Y"="timeBodyGyroStdForY",
     "tBodyGyro-std()-Z"="timeBodyGyroStdForZ",
     "tBodyGyroJerk-mean()-X"="timeBodyGyroJerkMeanForX",
     "tBodyGyroJerk-mean()-Y"="timeBodyGyroJerkMeanForY",
     "tBodyGyroJerk-mean()-Z"="timeBodyGyroJerkMeanForZ",
     "tBodyGyroJerk-std()-X"="timeBodyGyroJerkStdForX",
     "tBodyGyroJerk-std()-Y"="timeBodyGyroJerkStdForY",
     "tBodyGyroJerk-std()-Z"="timeBodyGyroJerkStdForZ",
     "tBodyAccMag-mean()"="timeBodyAccMagMean",
     "tBodyAccMag-std()"="timeBodyAccMagStd",
     "tGravityAccMag-mean()"="timeGravityAccMagMean",
     "tGravityAccMag-std()"="timeGravityAccMagStd",
     "tBodyAccJerkMag-mean()"="timeBodyAccJerkMagMean",
     "tBodyAccJerkMag-std()"="timeBodyAccJerkMagStd",
     "tBodyGyroMag-mean()"="timeBodyGyroMagMean",
     "tBodyGyroMag-std()"="timeBodyGyroMagStd",
     "tBodyGyroJerkMag-mean()"="timeBodyGyroJerkMagMean",
     "tBodyGyroJerkMag-std()"="timeBodyGyroJerkMagStd",
     "fBodyAcc-mean()-X"="freqBodyAccMeanForX",
     "fBodyAcc-mean()-Y"="freqBodyAccMeanForY",
     "fBodyAcc-mean()-Z"="freqBodyAccMeanForZ",
     "fBodyAcc-std()-X"="freqBodyAccStdForX",
     "fBodyAcc-std()-Y"="freqBodyAccStdForY",
     "fBodyAcc-std()-Z"="freqBodyAccStdForZ",
     "fBodyAccJerk-mean()-X"="freqBodyAccJerkMeanForX",
     "fBodyAccJerk-mean()-Y"="freqBodyAccJerkMeanForY",
     "fBodyAccJerk-mean()-Z"="freqBodyAccJerkMeanForZ",
     "fBodyAccJerk-std()-X"="freqBodyAccJerkStdForX",
     "fBodyAccJerk-std()-Y"="freqBodyAccJerkStdForY",
     "fBodyAccJerk-std()-Z"="freqBodyAccJerkStdForZ",
     "fBodyGyro-mean()-X"="freqBodyGyroMeanForX",
     "fBodyGyro-mean()-Y"="freqBodyGyroMeanForY",
     "fBodyGyro-mean()-Z"="freqBodyGyroMeanForZ",
     "fBodyGyro-std()-X"="freqBodyGyroStdForX",
     "fBodyGyro-std()-Y"="freqBodyGyroStdForY",
     "fBodyGyro-std()-Z"="freqBodyGyroStdForZ",
     "fBodyAccMag-mean()"="freqBodyAccMagMean",
     "fBodyAccMag-std()"="freqBodyAccMagStd",
     "fBodyBodyAccJerkMag-mean()"="freqBodyAccJerkMagMean",
     "fBodyBodyAccJerkMag-std()"="freqBodyAccJerkMagStd",
     "fBodyBodyGyroMag-mean()"="freqBodyGyroMagMean",
     "fBodyBodyGyroMag-std()"="freqBodyGyroMagStd",
     "fBodyBodyGyroJerkMag-mean()"="freqBodyGyroJerkMagMean",
     "fBodyBodyGyroJerkMag-std()"="freqBodyGyroJerkMagStd"))

## export out the tidy file
write.table(trainandtestlabeled, file = "UCIHARconsolidated.txt",row.name=FALSE)

## generate our means
trainandtestlabeledMeans <-ddply(trainandtestlabeled, .(subject, activity, activity_label), numcolwise(mean))

## export out the tidy file
write.table(trainandtestlabeledMeans, file = "UCIHARconsolidatedMeans.txt",row.name=FALSE)

## end of script

