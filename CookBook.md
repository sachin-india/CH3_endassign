The run_analysis.R script performs the cleaning and processing of the given dataset, which involves the following steps:

Download and unzip the UCI HAR Dataset into parent directory

Load library package 'dplyr'

Set its parent working directory

Read the given data and assign it to variables

    Features<- features.txt                   (List of all features)
    Activity_labels<- activity_labels.txt     (Links the class labels with their activity name)
    Subject_test<- subject_test.txt           (Each row identifies the test subject who performed the activity for each window sample. Its range is from 1 to 30)
    Subject_train<- subject_train.txt         (Each row identifies the train subject who performed the activity for each window sample. Its range is from 1 to 30)
    X_test<- X_test.txt                       (Test set)
    X_train<- X_train.txt                     (Training set)
    Y_test<- Y_test.txt                       (Test labels)
    Y_train<- Y_train.txt                     (Training labels)

Merge the training and test data sets into one dataset

    Using rbind() function, merge Subject_train, Subject_test, Y_train, Y_test, X_train, and X_test into Data_m


Extracts only the measurements on the mean and standard deviation for each measurement

    Usind select() function on Data_m, extract Subject, Class and all other columns containing term 'mean' or 'std' into new data set called Tidy_Data


Uses descriptive activity names to name the activities in the data set

    Decriptive activity names are alloted to 'Class' column of Tidy_Data by using Activity_labels variable which contains class and corresponding activity label


Appropriately labels the data set with descriptive variable names

    The short column names ('Acc', 'Gyro', 'Mag', 'BodyBody', '^t', '^f', '-std', '-mad', '-sma', '-arcoeff', '-iqr') and 'Class' column name in the Tidy_Data are updated to ('Accelerometer', 'Gyroscope', 'Magnitude', 'Body', 'Time', 'Frequency', '-standarddeviation', '-medianabsolutedeviation', '-signalmagnitudearea', '-autoregresioncoefficients', '-interquartilerange') and 'Activity'


From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
    
    Using aggregate command, the Tidy_Data is processed such that mean of each variable is calculated according to each subject and activity and stored into Indy_Tidy_Data
    Finally, it is written to text file called 'Indy_Tidy_Data.txt'
