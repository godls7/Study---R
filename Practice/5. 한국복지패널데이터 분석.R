setwd("c:\\myRwork\\Doit_R\\Data")

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

# 데이터 전처리
# 성별
table(welfare$sex)
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

welfare$sex <- ifelse(welfare$sex == 1, "male", "female")

qplot(welfare$sex)

