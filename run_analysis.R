#Download and unzip the UCI HAR Dataset into parent directory.

#load library package dplyr
    library(dplyr)

#   Read the given data
    Features<- read.table("UCI HAR Dataset/features.txt", col.names = c("Num", "Functions"))
    Activity_labels<- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("Class", "Activity"))
    Subject_test<- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "Subject")
    Subject_train<- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "Subject")
    X_test<- read.table("UCI HAR Dataset/test/X_test.txt", col.names = Features$Functions)
    X_train<- read.table("UCI HAR Dataset/train/X_train.txt", col.names = Features$Functions)
    Y_test<- read.table("UCI HAR Dataset/test/Y_test.txt", col.names = "Class")
    Y_train<- read.table("UCI HAR Dataset/train/Y_train.txt", col.names = "Class")

#1  Merge the training and test data sets into one dataset
    #Subject_m denote the subject number
    Subject_m<- rbind(Subject_train, Subject_test)
    #X_m denotes all the different data recorded for the subject's particular activity
    X_m<- rbind(X_train, X_test)
    #Y_m denotes the respective activites for all the subjects
    Y_m<- rbind(Y_train, Y_test)
    #Data_m combines all the subject, their activites and the corresponsing recorded data
    Data_m<- cbind(Subject_m, Y_m, X_m)

#2  Extracts only the measurements on the mean and standard deviation for each measurement.
    Tidy_Data<- select(Data_m, Subject, Class, contains("mean"), contains("std"))

#3  Uses descriptive activity names to name the activities in the data set.
#   By matching class from Data_mean_std with that in Activity_labels.
    Tidy_Data[,2]<- Activity_labels[Tidy_Data[,2],2]

#4  Appropriately labels the data set with descriptive variable names.
    names(Tidy_Data)[2]<- "Activity"
    names(Tidy_Data)<- gsub("Acc","Accelerometer",names(Tidy_Data))
    names(Tidy_Data)<- gsub("Gyro","Gyroscope",names(Tidy_Data))
    names(Tidy_Data)<- gsub("Mag","Magnitude",names(Tidy_Data))
    names(Tidy_Data)<- gsub("BodyBody","Body",names(Tidy_Data))
    names(Tidy_Data)<- gsub("^t","Time",names(Tidy_Data))
    names(Tidy_Data)<- gsub("^f","Frequency",names(Tidy_Data))
    names(Tidy_Data)<- gsub("-std","-standarddeviation",names(Tidy_Data))
    names(Tidy_Data)<- gsub("-mad","-medianabsolutedeviation",names(Tidy_Data))
    names(Tidy_Data)<- gsub("-sma","-signalmagnitudearea",names(Tidy_Data))
    names(Tidy_Data)<- gsub("-arCoeff","-autoregresioncoefficients",names(Tidy_Data))
    names(Tidy_Data)<- gsub("-iqr","-interquartilerange",names(Tidy_Data))

#5  From the data set in step 4, creates a second, independent tidy data set.
#   with the average of each variable for each activity and each subject.
#   We will use tilde operator to create formula with subject and activity as variables
    Ind_Tidy_Data<- aggregate(.~ Subject + Activity, Tidy_Data, mean)
    Ind_Tidy_Data<- arrange(Ind_Tidy_Data, Subject, Activity)
#   The second independent data set is written as Ind_Tidy_Data
    write.table(Ind_Tidy_Data, "C:/Users/sachi/OneDrive/Desktop/Programs/RStudio/CH3_endassgn/Ind_Tidy_Data.txt", row.name=FALSE)
    
