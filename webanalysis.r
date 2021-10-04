#reading Excel
file1<-read.csv('D:/Simpli_Learn/R/rproject/1555058318_internet_dataset.csv',header=T)
file1

#Step1 The team wants to analyze each variable of the data collected through data summarization to get a basic understanding of the dataset and to prepare for further analysis.
summary(file1)

#Step2 As mentioned earlier, a unique page view represents the number of sessions during which that page was viewed one or more times. A visit counts all instances, no matter how many times the same visitor may have been to your site. So the team needs to know whether the unique page view value depends on visits
cor(file1$Uniquepageviews,file1$Visits)

ano<-aov(Uniquepageviews~Visits, data=file1)
summary(ano)  


anooo<-aov(Timeinpage~.,data = file1)
  summary(anooo)


file1$Bounces=file1$Bounces*0.01
rmm<-glm(Bounces~Timeinpage+Continent+Exits+Sourcegroup+Uniquepageviews+Visits,data = file1,family = "binomial")

summary(rmm)
