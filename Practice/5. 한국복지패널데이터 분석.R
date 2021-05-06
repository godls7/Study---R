# Doit part 09-1~3 한국복지패널데이터 분석

setwd("/Users/haein/Desktop/R/Doit_R/Data")

install.packages("foreign")

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)

# 데이터 불러오기
raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav",to.data.frame = T)
welfare <- raw_welfare

# 데이터 대략 분석
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)

# 변수명 변경
welfare <- rename(welfare,
                  sex = h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)


# 성별월급관계
# 데이터 전처리
# 성별
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")

# 성별그래프
qplot(welfare$sex)

# 월급
# 월급그래프
qplot(welfare$income)
qplot(welfare$income) + xlim(0,1000)

welfare$income <- ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
table(is.na(welfare$income))

# 성별월급평균표
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income = mean(income))

sex_income

ggplot(data=sex_income, aes(x=sex, y=mean_income)) + geom_col()


# 나이월급관계
# 데이터전처리
# 나이
qplot(welfare$birth)

welfare$birth <- ifelse(welfare$birth ==9999, NA, welfare$birth)
welfare$age <- 2015 - welfare$birth +1
qplot(welfare$age)

# 나이월급평균표
age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))

ggplot(data=age_income, aes(x=age, y=mean_income)) + geom_line()