#Step1.Merges the training and the test sets to create one data set.
#Reading the test and train data
x1=read.table("train/X_train.txt")
x2=read.table("test/X_test.txt")
x=rbind(x1,x2)
name=read.table("features.txt")
names(x)=name$V2

#Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
namefilter = c(grep("mean",name$V2,fixed=T),grep("sd",name$V2,fixed=T))
d=x[,namefilter]

s1=read.table("train/subject_train.txt")
s2=read.table("test/subject_test.txt")
s=rbind(s1,s2)
names(s)="subject"

#Step3.Uses descriptive activity names to name the activities in the data set
#Reading the label of test and train
y1=read.table("train/y_train.txt")
y2=read.table("test/y_test.txt")
y=rbind(y1,y2)
names(y)="activity"

#Step4.Appropriately labels the data set with descriptive activity names. 
label=read.table("activity_labels.txt")
y$activity = factor(y$activity,levels=label$V1,labels=label$V2)

#Step5.average of each variable for each activity and each subject. 

output=aggregate(d,FUN=mean, by=list(y$activity,s$subject))
names(output)[1]="activity"
names(output)[2]="subject"

write.table(output, file="output.txt")
