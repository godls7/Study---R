# mpg 데이터 분석하기
# head(), tail(), dim(), View() 으로 간략하게 파악
# str(), summary() 으로 속성과 요약 통계랑 파악

install.packages("dplyr") # 인터넷에서 불러와 local에 가져옴

library(ggplot2) # library는 local에서 main memory에 올려 cpu가 사용하게함
library(dplyr)

str(ggplot2::mpg)
df_mpg <- as.data.frame(ggplot2::mpg) # data.frame 으로 변환
str(df_mpg)


# example p.110
df_raw <- data.frame(var1 = c(1,2,1), var2 = c(2,3,2))
df_new <- df_raw
df_new <- rename(df_new, v1=var1, v2=var2)

# 백터          백터      벡터
df_new$v_sum <- df_new$v1+df_new$v2
df_new$v_mean <- (df_new$v1+df_new$v2)/2


# practice p.112
df_mpg <- rename(df_mpg, city=cty, highway=hwy)
df_mpg$total <- (df_mpg$city + df_mpg$highway)/2

#히스토그램 (hist)
hist(df_mpg$total) 

df_mpg$test <- ifelse(df_mpg$total >= 20, "PASS", "FAIL")

# 빈도표 (table)
# facotor형(범주형)이 아니라더도 factor형으로 변환 후 출력
# 그러나, 모든 함수가 자동적으로 변환 되지 않는다
table(df_mpg$test)

#막대그래프 (qplot) => test가 pass/fail 범주형데이터이기 때문에 막대그래프 사용!
qplot(df_mpg$test)

df_mpg$grade <- ifelse(df_mpg$total>=30,"A", ifelse(df_mpg$total >= 20, "B","C"))
table(df_mpg$grade)
qplot(df_mpg$grade)

