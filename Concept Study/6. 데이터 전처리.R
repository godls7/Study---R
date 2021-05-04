# Do it R 데이터분석
# Part.06 데이터 전처리

library(dplyr)
setwd("c:\\myRwork\\Doit_R\\data")
exam <- read.csv("csv_exam.csv")


# 조건에 맞는 데이터추출
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


# 필요한 변수만 추출
exam %>% select(math)

exam %>% select(class, math, english)

exam %>% select(-math, -english)

exam %>%
  filter(class==1) %>% 
  select(english)


# practice p.138
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

# 1
ans <- mpg %>% select(class, cty)
head(ans)

mpg %>% select(class,cty) %>% 
  head(10)

# 2
suv <- mpg %>%
  filter(class=="suv") %>% 
  select(cty)

compact <- mpg %>% 
  filter(class=="compact") %>% 
  select(cty)

mean(suv$cty)
mean(compact$cty)

# 2 - answer
df_suv <- ans %>% filter(class=="suv")
df_compact <- ans %>% filter(class=="compact")

mean(df_suv$cty)
mean(df_compact$cty)


# 순서대로 정렬하기
exam %>% arrange(class,math)


# 파생변수 추가하기
exam %>% 
  mutate(total=math+english+science,
         mean=(math+english+science)/3) %>% 
  head

exam %>% 
  mutate(test=ifelse(science>=60,'pass','fail')) %>% 
  head

# pracetice p.144
df_mpg <- as.data.frame(ggplot2::mpg)
# 1
df_mpg <- df_mpg %>% 
  mutate(total=hwy+cty)

# 2
df_mpg <- df_mpg %>% 
  mutate(mean = total/2)

# 3
df_mpg %>% 
  arrange(desc(mean)) %>% 
  head(3)

# 4
mpg2 <- as.data.frame(ggplot2::mpg)
mpg2 %>% 
  mutate(total=cty+hwy,
         mean=total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)


# 집단별로 요약하기
exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>% 
  summarise(mean_math=mean(math),
            sum_math=sum(math),
            median_math = median(math),
            n=n())

# practice p.148
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  mutate(total = (cty+hwy)/2) %>% 
  summarise(mean_total=mean(total)) %>% 
  arrange(desc(mean_total)) %>% 
  head(5)

mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="suv") %>% 
  summarise(mean_total=mean((cty+hwy)/2)) %>% 
  arrange(desc(mean_total)) %>% 
  head(5)

# practice p.150
# 1
mpg3 <-mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

# 2
mpg3 %>% 
  arrange(desc(mean_cty))

# 3
mpg %>% 
  group_by(class) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

# 4
mpg %>% 
  group_by(manufacturer) %>% 
  filter(class=="compact") %>% 
  summarize(number = n()) %>% 
  arrange(desc(number))



# 데이터 합치기
# left_join()
test1 <- data.frame(id=c(1,2,3,4,5),midterm=c(60,80,70,90,85))
test2 <- data.frame(id=c(1,2,3,4,5),final=c(70,83,65,95,80))
total <- left_join(test1, test2, by='id')
# by 값을 지정 안한다면 공통된 첫번째 변수를 기준으로 자동으로 join

name <- data.frame(class = c(1,2,3,4,5), teacher = c('kim','lee','park','choi','jung'))
exam_new <- left_join(exam, name, by="class")

# bind_rows()
group_a <- data.frame(id = c(1,2,3,4,5), test=c(60,80,70,90,85))
group_b <- data.frame(id=c(6,7,8,9,10), test=c(70,83,65,95,80))

group_all <- bind_rows(group_a,group_b)