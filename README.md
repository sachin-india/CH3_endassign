# CH3_endassign
Final assignment for chapter 3: Getting and cleaning data course

The assignment focuses on developing code (run_analysis.R) for merging and cleaning data for smartphone dataset. This involves:

* Downloading the given dataset into the working directory
* Set working directory and load dplyr library
* Read the given dataset using read.table

#1 Merge the training and test data sets into one dataset
* Data from subject_train, subject_text, X_train, X_test, Y_train, Y_test are merged into Data_m using r_bind.

#2 Extract only the measurements on mean and standard deviation for each measurement
* Mean and Std Dev Data are extracted from Data_m dataframe using select command and stored in Tidy_data.

#3 Use descriptive activity names to name the activities in the data set
* Using label described in activity_label.txt file, the activity labels are updated in the Tidy_data.

#4 Appropriately labels the data set with descriptive variable names
* The short names of columns are updated to contain descriptive names using gsub command.

#5 From the data set in step 4, creates a second, independent tidy data set
* Finally, the mean of each variable is calculated based on subject and activity, sorted and then saved in Indy_Tidy_Data using aggregate, arrange and write.table command.

The final indendent data file created by the code is called Indy_Tidy_Data.txt

The details of the variables, data, and any transformations performed on data are provided in CookBook.md file.
