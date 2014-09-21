**README.md**

*run_analysis.R*

David Saint Ruby 
September 2014


This work acknowledges the UCI HAR project[1].  For more information visit:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


This script should be placed into a folder containing the data files from UCI HAR in a subdirectory.
The folder containing this script should contain the following sub folder:

UCI HAR Dataset\


The script ingests the following files

- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 


Run Example
============
source("run_analysis.R")
"Working directory:  C:/dss/coursera/gettingandcleaningdata/project"

Generated Files
---------------
* UCIHARconsolidated.txt	cleansed data
* UCIHARconsolidatedMeans.txt	cleansed data, means by subject and activity

Files are generated within the working folder containing this script.
Files may be read using the read.table function.  Note that the data was saved with row.name=FALSE.





[1]Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

