setwd("c:\\myRwork\\book_data\\Part-III")

# 카이제곱검정
# => 범주형데이터 일 때의 데이터 분석시 사용용
# 교차분석
data <- read.csv("cleanDescriptive.csv", header = T)

# 이원카이제곱검정 - 독립성검정
# 부모의 학력수준과 자녀 대학진학여부 독립성 검정
x <- data$level2 # 부모 학력수준
y <- data$pass2 # 자녀 대학진학 여부

result <- data.frame(parent_edu=x, child_uni=y)

install.packages("gmodels")
install.packages("ggplot2")

library(gmodels)
library(ggplot2)

table(x,y) # 도수분포표
CrossTable(x,y) # 교차분할표 생성

CrossTable(x,y,chisq = TRUE)

# 다이아몬드 데이터 변수별 독립성 검정정
CrossTable(x=diamonds$cut, y=diamonds$color, chisq=TRUE)


# 이원카이제곱검정 - 동질성검정
# 교육방법데 따라 교육생들의 만족도 차이 검정
data1 <- read.csv("homogenity.csv",header = TRUE)
data1 <- subset(data1, !is.na(survey), c(method,survey))

# 변수리코딩
data1$method2[data1$method==1] <- '방법1'
data1$method2[data1$method==2] <- '방법2'
data1$method2[data1$method==3] <- '방법3'
data1$survery2[data1$survey==1] <- '매우만족'
data1$survery2[data1$survey==2] <- '만족'
data1$survery2[data1$survey==3] <- '보통'
data1$survery2[data1$survey==4] <- '불만족'
data1$survery2[data1$survey==5] <- '매우불불만족'

# 도수분포표
table(data1$method2, data1$survery2) # 반드시 각 집단별 길이(50)가 같아야함

# 동질성 검정
chisq.test(data1$method2,data1$survery2)