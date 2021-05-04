# DO it R 
# Part 07.데이터정제

library(dplyr)
df <- data.frame(sex=c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))

# 결측치 제거
# is.na() / !is.na() => 결측치 선택해 제거
is.na(df)

table(is.na(df))
table(is.na(df$sex))
table(is.na(df$score))

df %>% 
  filter(is.na(score))

df_nomiss <- df %>% filter(!is.na(score))
mean(df_nomiss$score)

df_nomiss <- df %>% 
               filter(!is.na(score) & !is.na(sex))

# na.omit() => 결측치 하나라도 있으면 제거 => filter 추천!
na.omit(df)

# na.rm = T => 결측치 모두 제거
mean(df$score, na.rm = T)
sum(df$score, na.rm=T)

exam1 <- read.csv("csv_exam.csv")
exam1[c(3,8,15),"math"] <- NA

exam1 %>% 
  summarise(mean_math = mean(math))

exam1 %>% 
  summarise(mean_math=mean(math, na.rm=T),
            sum_math = sum(math, na.rm=T),
            median_math = median(math, na.rm=T))


# 결측치 대체
mean(exam1$math, na.rm=T) # 55

exam1$math <- ifelse(is.na(exam1$math), 55, exam1$math)
table(is.na(exam1$math))
mean(exam1$math)

# practice p.170
mpg5 <- as.data.frame(ggplot2::mpg)
mpg5[c(65,124,131,153,212),"hwy"] <- NA

# 1
table(is.na(mpg5$drv))
table(is.na(mpg5$hwy))

# 2 
mpg5 %>% 
  filter(!is.na(hwy)) %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy))


# 이상치 제거
outlier <-data.frame(sex=c(1,2,1,3,2,1),
                    score=c(5,4,3,4,2,6))
table(outlier$sex)
table(outlier$score)

outlier$sex <- ifelse(outlier$sex ==3, NA, outlier$sex)
outlier$score <- ifelse(outlier$score>5,NA, outlier$score)

outlier %>% 
  filter(!is.na(sex)&!is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score=mean(score))

# boxplot
mpg <- as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats

mpg$hwy <- ifelse(mpg$hwy <12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm=T))

# practice p.178
mpg6 <- as.data.frame(ggplot2::mpg)
mpg6[c(10,14,58,93),"drv"] <- "k"
mpg6[c(29,43,129,203),"cty"]<-c(3,4,39,42)

# 1
table(mpg6$drv)
mpg6$drv <- ifelse(mpg6$drv %in% c(4,'f','r'), mpg6$drv, NA)
table(mpg6$drv)

# 2
boxplot(mpg6$cty)
boxplot(mpg6$cty)$stats
mpg6$cty <- ifelse(mpg6$cty < 9 | mpg6$cty >26, NA, mpg6$cty)
boxplot(mpg6$cty)

# 3
mpg6 %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))