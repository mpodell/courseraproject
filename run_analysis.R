xtest<-read.table("test/X_test.txt")
ytest<-read.table("test/Y_test.txt")
subjecttest<-read.table("test/subject_test.txt")
test.frame<-cbind(ytest,subjecttest,xtest)

xtrain<-read.table("train/X_train.txt")
ytrain<-read.table("train/Y_train.txt")
subjecttrain<-read.table("train/subject_train.txt")
train.frame<-cbind(ytrain,subjecttrain,xtrain)

names(test.frame)<- c("Activity","Subject")
names(train.frame)<- c("Activity","Subject")
merged.frame<-rbind(train.frame,test.frame)

features<-read.table("features.txt")

merged.frame.1<-merged.frame[,1:2]
merged.frame.2<-merged.frame[,3:563]
names(merged.frame.2)<- features$V2

toMatch <- c(".*mean\\(\\).*", ".*std\\(\\).*")
merged.frame.2<-merged.frame.2[,grep(paste(toMatch,collapse="|"), names(merged.frame.2), value=TRUE)]

merged.frame.new<-cbind(merged.frame.1,merged.frame.2)
tidydata<-aggregate(merged.frame.new, by=list(merged.frame.new$Subject,merged.frame.new$Activity), FUN=mean, na.rm=TRUE)
actlabel<-read.table("activity_labels.txt")
tidydata$Activity <-factor(tidydata$Activity,levels=actlabel$V1,labels=actlabel$V2)
write.table(tidydata,"tidydataset.txt")