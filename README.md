datasciencecoursera
===================
###run_analysis.R
####Step1.Merge the train and test data
*use `read.table` to read in train and test data seperately
*use `rbind` to merge the data
*read in `feature` to be the variables labels

####Step2.Extracts only the measurements on the mean and sd for each measurements
*use `grep` on the varibale names to find which contains "mean" / "sd"
*filter the merged data by the above variable names

####Step3.Uses descriptive activity names to name the activities in the data set
*read in activity and subject

####Step4.Appropriately labels the data set with descriptive activity names
*read in the `acitvity_label.txt` and transfrom `activity` data to label

####Step5. average of each variable for each activity and each subject.
*use `aggerate` function by subject and activity to produce a dataset with average of each variable by subject and activity
*output the data by `write.table`
