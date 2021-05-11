# 데이터 가져오기
setwd("c:\\myRwork\\book_data\\Part-III")
data <- read.csv("one_sample.csv", header=T)

x <- data$survey

# 빈도수와 비율계산
summary(x) # 결측치 없음
length(x) # 150개
table(x) # 만족 : 136, 불만족:14

# 패키지를 이용해 빈도수와 비율계산
install.packages("prettyR")
library(prettyR)

freq(x) # 빈도수 / % 제공

# 이항분포 비율검정
# 앞에 성공/실패 횟수 입력, p=성공가능확률
binom.test(c(136,14), p=0.8) # p-value = 0.0006735 => 따라서, 귀무가설 기각가능!



# 단일집단 평균검정
y <- data$time
summary(y)

# 데이터 전처리
y1 <- na.omit(y) 

shapiro.test(y1) # 표본 데이터는 정규분포를 따름
# 그래프로 정규분포인지 확인
hist(y1)
qqnorm(y1)
qqline(y1, lty=1, col='blue')

# t검증으로 가설 검증
t.test(y1, mu=5.2, alter="two.sided", conf.level = 0.95) # 양측검정
t.test(y1, mu=5.2, alter="greater", conf.level = 0.95) # 양측검정

