# 분산분석 (F 검정)
setwd("c:\\myRwork\\book_data\\Part-III")
data <- read.csv("three_sample.csv", header = T)

# 데이터 전처리
data <- subset(data, !is.na(score), c(method,score))

# 차트로 outlier보기
plot(data$score)
barplot(data$score)
mean(data$score) # 14.44725

# 데이터 정제 (outlier 제거)
length(data$score) # 91
data2 <- subset(data, score <= 14)
length(data2$score) # 88

x <- data2$score
boxplot(x)

# 세집단 분류
data2$method2[data2$method==1] <- '방법1'
data2$method2[data2$method==2] <- '방법2'
data2$method2[data2$method==3] <- '방법3'

# 교육방법 별 빈도수
x <- table(data2$method2)

# 교육방법에 따른 시험성적 평균 구하기
y <- tapply(data2$score, data2$method2, mean)

# 교육방법, 시험성적 데이터프레임 생성
df <- data.frame(교육방법=x, 성적=y)

# 세 집단 간 동질성 검정
bartlett.test(score~method, data=data2) # p-value = 0.1905 => 세집단 분포형태 동질

# 분산분석 (세 집단 간 평균 차이검정)
result <- aov(score~method2, data=data2) 
summary(result) # p-value = 9.39e-14 => 세 교육방법 간의 평균에 차이가 있음

# 사후검정
TukeyHSD(result)
plot(TukeyHSD(result))

# 따라서, 3가지 교육방법에 따른 실기 시험의 평균에 차이가 있다
# 그 중, 방법2-방법1 간의 평균 차가 가장 크다다