# 두 집단 평균검점 (독립표본 T검정)
data <- read.csv("two_sample.csv", header = T)

# 두 변수만 뽑음
result <- subset(data, !is.na(score), c(method, score))

# method 별로 분리
a <- subset(result, method==1)
b <- subset(result, method==2)

# method 별 점수 평균
a1 <- a$score
b1 <- b$score

mean(a1)
mean(b1)

# 두 집단 동질성 검정 (두집단 분산값 비교)
var.test(a1,b1) # p-value=0.3002 => 동질함

# 양측검정
t.test(a1,b1)
t.test(a1,b1,alter="two.sided",conf.int=TURE, conf.level = 0.95)

# 단측검정
t.test(a1,b1,alter="greater",conf.int=TURE, conf.level = 0.95) # a <= b
t.test(a1,b1,alter="less", conf.int=TURE, conf.level = 0.95) # a < b



# 대응 두 집단 평균검정 (대응표본 T검정)
data1 <- read.csv("paired_sample.csv", header=TRUE)

# 대이터 전처리
result1 <- subset(data1, !is.na(after), c(before,after))

x <- result1$before
y <- result1$after

# 두 집단 동질성 검정 (두집단 분산값 비교)
var.test(x,y, paired=TRUE)

# 양측검정
t.test(x,y,paried=TRUE) # p-value = 2.2e-16

# 단측검정
t.test(x,y,paired=TRUE, alter="greater", conf.int=TRUE, conf.level=0.95) # x<=y
t.test(x,y,paired=TRUE, alter="less", conf.int=TRUE, conf.level=0.95) # x<y

