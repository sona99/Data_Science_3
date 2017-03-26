read_and_process <- function( ) {
    
   library(dplyr)
    
#### At first, I will load all data files into memory
    
# Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.    
    subject_test <- read.table("./test/subject_test.txt", header = FALSE, sep = "")
# Test test    
    x_test <- read.table("./test/X_test.txt", header = FALSE, sep = "")
# Labels test set
    y_test <- read.table("./test/y_test.txt", header = FALSE, sep = "")
# Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.    
    subject_train <- read.table("./train/subject_train.txt", header = FALSE, sep = "")
# Training set    
    x_train <- read.table("./train/X_train.txt", header = FALSE, sep = "")
# Training labels
    y_train <- read.table("./train/y_train.txt", header = FALSE, sep = "")
# Labels for each activity
    activity_labels <- read.table("./activity_labels.txt", header = FALSE, sep = "")
# List of all features    
    features <- read.table("./features.txt", header = FALSE, sep = "")

########### Perform Task 4: Appropriately labels the data set with descriptive variable names.
    colnames(x_train)   <- features$V2
    colnames(x_test)    <- features$V2
    colnames(subject_train) <- "subject"
    colnames(subject_test) <- "subject"
    colnames(y_train) <- "activity"
    colnames(y_test) <- "activity"

    
########## Perform Task 1: Merge the training and the test sets to create one data set.
        
#### Merge  the test set (x_test) with its labels/activites (y_test) and the subjects (subject_test)     
    testset <- cbind.data.frame(subject_test, y_test, x_test)
#### Merge  the training set (x_train) with its labels/activites (y_train) and the subjects (subject_train)     
    trainset <- cbind.data.frame(subject_train, y_train, x_train)
#### Merge both data sets into one
    dataset_task1 <- rbind.data.frame(testset, trainset)
    
    
########## Perform Task 2: Extract only the measurements on the mean and standard deviation for each measurement
    dataset_task2 <- dataset_task1[, grep("(subject|activity|[M|m]ean|[S|s]td)", names(dataset_task1), value=TRUE)]
    
########## Perform Task 34: Uses descriptive activity names to name the activities in the data set
    dataset_task34 <- merge.data.frame(dataset_task2, activity_labels, by.x = "activity", by.y = "V1" )
    dataset_task34 <- mutate(dataset_task34, activity = V2)
    dataset_task34 <- subset.data.frame(dataset_task34, select = -V2)
    write.table(dataset_task34, file="tidy1.txt") 
        
########### Perform Task 5 From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
    dataset_task5 <- aggregate(dataset_task3, list(Subject = dataset_task3$subject, Activity = dataset_task3$activity), FUN = mean)    
    write.table(dataset_task5, file="tidy2.txt") 
    
     }
