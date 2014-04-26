Here's description of what variable stores what

xtest <- stores data from test/X_test.txt file
ytest <- stores data from test/Y_test.txt file
subjecttest <- stores data from test/subject_test.txt file

xtrain <- stores data from test/X_train.txt file
ytrain <- stores data from test/Y_train.txt file
subjecttest <- stores data from test/subject_train.txt file

test.frame<- stotes column binded test data
train.frame<- stores column binded train data

merged.frame <- stores row binded data from test.frame and train.frame

features<- stores data from features.txt file

merged.frame.1<- stores Activity and Subject variables from merged.frame
merged.frame.2<- stores other remaining variables from merged.frame

regular expression used to extract mean and std variables only
toMatch <- c(".*mean\\(\\).*", ".*std\\(\\).*")
merged.frame.2<-merged.frame.2[,grep(paste(toMatch,collapse="|"), names(merged.frame.2), value=TRUE)]

merged.frame.new<- stores recombined data from merged.frame.1 and merged.frame.2
tidydata<- stores final aggregated data with descriptive name for each activity
actlabel<- stores data from activity_label.txt file

function used to aggregate data
aggregate(merged.frame.new, by=list(merged.frame.new$Subject,merged.frame.new$Activity), FUN=mean, na.rm=TRUE)


