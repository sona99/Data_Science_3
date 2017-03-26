Dataset and Script
--------------------------

The script run_analysis.R is based on following dataset:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The Dataset was unzippted and the root folder renamed to "Dataset". 
This root folder should be made to the working directory of the project. 

All processing is performed within a function called "read_and_process".
This function reads all follwing files from the dataset:

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'test/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

After the data has been processed to reach the requirements 1 to 4 of the coursera assignment, it is written into the working directory
File written after step4: tidy1.txt

After the data has been processed to reach the requirement 5 of the coursera assignment, ist is written into the working directory 
File written after step5: tidy2.txt
 
