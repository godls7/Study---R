# 데이터 전처리
# 조건에 맞는 데이터추출

library(dplyr)
exam <- read.csv("csv_exam.csv")

# ==
exam %>% filter(class == 1)

# !=
exam %>% filter(class != 1)

# >,<,>=,<=
exam %>% filter(math > 50)
exam %>% filter(math >=80)

# &
exam %>% filter(class==1 & math>=50)

# |
exam %>% filter(class==1|class==3|class==5)
exam %>% filter(class %in% c(1,3,5))