**run_analysis.r**

*Getting and Cleaning Data*
September 2014
David Saint Ruby

Background
==============

This script takes the raw data from the UCI HAR Study and creates two consumable files.
This script combines up both the test and training data.

You may refer to project specifics here
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The first output file is a cleaned file consisting of the mean and standard deviation.
The second file is a summary of averages by the subject and their activity.

Input Files
==============

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
- 30 Subjects participated.



Processing Steps
================
The test and training files are ingested.  The subject and activity files are then appended
to this data.  The test and training data sets are then combined. We also appended
the activity label to each of the observations for ease of use.

For our first outputfile (UCIHARconsolidated), we cleaned up variable names and subsetted the 
data to means or standard deviations.

For our second output file, we calculated averages for the first file grouped by subject and activity.




Output Files
==============

Both files are saved with write.table with row.name=FALSE.


UCIHARconsolidated.txt
-----------------------

- subject     1 to 30, units: int person id 1 to 30
- activity     from y files, 1 to 6, units: int activity id
- activity_label     descriptive activity from activity_labels, units: str activity label
- timeBodyAccMeanForX     original variable name of    tBodyAcc-mean()-X units:num normalized from -1 to 1
- timeBodyAccMeanForY     original variable name of    tBodyAcc-mean()-Y units:num normalized from -1 to 1
- timeBodyAccMeanForZ     original variable name of    tBodyAcc-mean()-Z units:num normalized from -1 to 1
- timeBodyAccStdForX     original variable name of    tBodyAcc-std()-X units:num normalized from -1 to 1
- timeBodyAccStdForY     original variable name of    tBodyAcc-std()-Y units:num normalized from -1 to 1
- timeBodyAccStdForZ     original variable name of    tBodyAcc-std()-Z units:num normalized from -1 to 1
- timeGravityAccMeanForX     original variable name of    tGravityAcc-mean()-X units:num normalized from -1 to 1
- timeGravityAccMeanForY     original variable name of    tGravityAcc-mean()-Y units:num normalized from -1 to 1
- timeGravityAccMeanForZ     original variable name of    tGravityAcc-mean()-Z units:num normalized from -1 to 1
- timeGravityAccStdForX     original variable name of    tGravityAcc-std()-X units:num normalized from -1 to 1
- timeGravityAccStdForY     original variable name of    tGravityAcc-std()-Y units:num normalized from -1 to 1
- timeGravityAccStdForZ     original variable name of    tGravityAcc-std()-Z units:num normalized from -1 to 1
- timeBodyAccJerkMeanForX     original variable name of    tBodyAccJerk-mean()-X units:num normalized from -1 to 1
- timeBodyAccJerkMeanForY     original variable name of    tBodyAccJerk-mean()-Y units:num normalized from -1 to 1
- timeBodyAccJerkMeanForZ     original variable name of    tBodyAccJerk-mean()-Z units:num normalized from -1 to 1
- timeBodyAccJerkStdForX     original variable name of    tBodyAccJerk-std()-X units:num normalized from -1 to 1
- timeBodyAccJerkStdForY     original variable name of    tBodyAccJerk-std()-Y units:num normalized from -1 to 1
- timeBodyAccJerkStdForZ     original variable name of    tBodyAccJerk-std()-Z units:num normalized from -1 to 1
- timeBodyGyroMeanForX     original variable name of    tBodyGyro-mean()-X units:num normalized from -1 to 1
- timeBodyGyroMeanForY     original variable name of    tBodyGyro-mean()-Y units:num normalized from -1 to 1
- timeBodyGyroMeanForZ     original variable name of    tBodyGyro-mean()-Z units:num normalized from -1 to 1
- timeBodyGyroStdForX     original variable name of    tBodyGyro-std()-X units:num normalized from -1 to 1
- timeBodyGyroStdForY     original variable name of    tBodyGyro-std()-Y units:num normalized from -1 to 1
- timeBodyGyroStdForZ     original variable name of    tBodyGyro-std()-Z units:num normalized from -1 to 1
- timeBodyGyroJerkMeanForX     original variable name of    tBodyGyroJerk-mean()-X units:num normalized from -1 to 1
- timeBodyGyroJerkMeanForY     original variable name of    tBodyGyroJerk-mean()-Y units:num normalized from -1 to 1
- timeBodyGyroJerkMeanForZ     original variable name of    tBodyGyroJerk-mean()-Z units:num normalized from -1 to 1
- timeBodyGyroJerkStdForX     original variable name of    tBodyGyroJerk-std()-X units:num normalized from -1 to 1
- timeBodyGyroJerkStdForY     original variable name of    tBodyGyroJerk-std()-Y units:num normalized from -1 to 1
- timeBodyGyroJerkStdForZ     original variable name of    tBodyGyroJerk-std()-Z units:num normalized from -1 to 1
- timeBodyAccMagMean     original variable name of    tBodyAccMag-mean() units:num normalized from -1 to 1
- timeBodyAccMagStd     original variable name of    tBodyAccMag-std() units:num normalized from -1 to 1
- timeGravityAccMagMean     original variable name of    tGravityAccMag-mean() units:num normalized from -1 to 1
- timeGravityAccMagStd     original variable name of    tGravityAccMag-std() units:num normalized from -1 to 1
- timeBodyAccJerkMagMean     original variable name of    tBodyAccJerkMag-mean() units:num normalized from -1 to 1
- timeBodyAccJerkMagStd     original variable name of    tBodyAccJerkMag-std() units:num normalized from -1 to 1
- timeBodyGyroMagMean     original variable name of    tBodyGyroMag-mean() units:num normalized from -1 to 1
- timeBodyGyroMagStd     original variable name of    tBodyGyroMag-std() units:num normalized from -1 to 1
- timeBodyGyroJerkMagMean     original variable name of    tBodyGyroJerkMag-mean() units:num normalized from -1 to 1
- timeBodyGyroJerkMagStd     original variable name of    tBodyGyroJerkMag-std() units:num normalized from -1 to 1
- freqBodyAccMeanForX     original variable name of    fBodyAcc-mean()-X units:num normalized from -1 to 1
- freqBodyAccMeanForY     original variable name of    fBodyAcc-mean()-Y units:num normalized from -1 to 1
- freqBodyAccMeanForZ     original variable name of    fBodyAcc-mean()-Z units:num normalized from -1 to 1
- freqBodyAccStdForX     original variable name of    fBodyAcc-std()-X units:num normalized from -1 to 1
- freqBodyAccStdForY     original variable name of    fBodyAcc-std()-Y units:num normalized from -1 to 1
- freqBodyAccStdForZ     original variable name of    fBodyAcc-std()-Z units:num normalized from -1 to 1
- freqBodyAccJerkMeanForX     original variable name of    fBodyAccJerk-mean()-X units:num normalized from -1 to 1
- freqBodyAccJerkMeanForY     original variable name of    fBodyAccJerk-mean()-Y units:num normalized from -1 to 1
- freqBodyAccJerkMeanForZ     original variable name of    fBodyAccJerk-mean()-Z units:num normalized from -1 to 1
- freqBodyAccJerkStdForX     original variable name of    fBodyAccJerk-std()-X units:num normalized from -1 to 1
- freqBodyAccJerkStdForY     original variable name of    fBodyAccJerk-std()-Y units:num normalized from -1 to 1
- freqBodyAccJerkStdForZ     original variable name of    fBodyAccJerk-std()-Z units:num normalized from -1 to 1
- freqBodyGyroMeanForX     original variable name of    fBodyGyro-mean()-X units:num normalized from -1 to 1
- freqBodyGyroMeanForY     original variable name of    fBodyGyro-mean()-Y units:num normalized from -1 to 1
- freqBodyGyroMeanForZ     original variable name of    fBodyGyro-mean()-Z units:num normalized from -1 to 1
- freqBodyGyroStdForX     original variable name of    fBodyGyro-std()-X units:num normalized from -1 to 1
- freqBodyGyroStdForY     original variable name of    fBodyGyro-std()-Y units:num normalized from -1 to 1
- freqBodyGyroStdForZ     original variable name of    fBodyGyro-std()-Z units:num normalized from -1 to 1
- freqBodyAccMagMean     original variable name of    fBodyAccMag-mean() units:num normalized from -1 to 1
- freqBodyAccMagStd     original variable name of    fBodyAccMag-std() units:num normalized from -1 to 1
- freqBodyAccJerkMagMean     original variable name of    fBodyBodyAccJerkMag-mean() units:num normalized from -1 to 1
- freqBodyAccJerkMagStd     original variable name of    fBodyBodyAccJerkMag-std() units:num normalized from -1 to 1
- freqBodyGyroMagMean     original variable name of    fBodyBodyGyroMag-mean() units:num normalized from -1 to 1
- freqBodyGyroMagStd     original variable name of    fBodyBodyGyroMag-std() units:num normalized from -1 to 1
- freqBodyGyroJerkMagMean     original variable name of    fBodyBodyGyroJerkMag-mean() units:num normalized from -1 to 1
- freqBodyGyroJerkMagStd     original variable name of    fBodyBodyGyroJerkMag-std() units:num normalized from -1 to 1




UCIHARconsolidatedMeans.txt
---------------------------

- same as above file, except that the columns represent the means for the grouping (subject, activity, activity_label)


We acknoledge the following for the data source:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
