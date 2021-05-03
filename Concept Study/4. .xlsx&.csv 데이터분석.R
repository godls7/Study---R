# .xlsx / .csv 데이터 불러오고 분석하기

getwd()
setwd("c:\\myRwork\\Doit_R\\Data")

install.packages("readxl")
library(readxl)

# .xlsx 파일 불러오기
df_exam <- read_xlsx("excel_exam.xlsx")

head(df_exam)
str(df_exam)

mean(df_exam$math)
mean(df_exam$english)
mean(df_exam$science)

df_exam$id

# .csv 파일 불러오기
df_cvs_exam <- read.csv("csv_exam.csv")

View(df_cvs_exam)
str(df_cvs_exam)
summary(df_cvs_exam)

# id, class 같은 경우는 숫자가 양적데이터 의미 X -> 질적데이터의 명목형데이터!! => R의 factor형으로 바꿔주기
df_cvs_exam$class <- as.factor(df_cvs_exam$class)
str(df_cvs_exam)
table(df_cvs_exam)