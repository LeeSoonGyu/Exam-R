# A조 이순규

#1.
#1)
subject <- c("국어", "영어", "수학")
score <- c(95, 85, 70)
score1 <- c(80, 95, 80)
score2 <- c(75, 60, 95)
test <- data.frame("과목" = subject, "윤봉길" = score, "안중근" = score1, "이봉창" = score2)
test
#2)
apply(test[3,c(2:4)], 1, max)
#3)
apply(test[c(2:4),2], 1, mean)
# apply(test[3], 2, mean)
#4)
apply(test[1,c(2:4)], 1, var)
#5)
apply(test[2,c(2:4)], 1, sd)


#2.
library(RSADBE)
data("Bug_Metrics_Software")
data
head(Bug_Metrics_Software)
Bug_Metrics_Software[,,1]
#1)
rowSums(Bug_Metrics_Software[,,1])
# rowSums(Bug_Metrics_Software)
# rowSums(Bug_Metrics_Software[,,2])
#2)
colMeans(Bug_Metrics_Software[,,1])
# colMeans(Bug_Metrics_Software)
# colMeans(Bug_Metrics_Software[,,2])
#3)
summary(Bug_Metrics_Software[,,1])
# summary(Bug_Metrics_Software)
# summary(Bug_Metrics_Software[,,2])
