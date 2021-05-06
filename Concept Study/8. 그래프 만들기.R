library(ggplot2)
library(dplyr)
mpg <- as.data.frame(ggplot2::mpg)


# 막대그래프
mpg1 <- mpg
mpg1 <- mpg %>%
  filter(class=="suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)

ggplot(data=mpg1, aes(x= reorder(manufacturer,-mean_cty),y=mean_cty)) + geom_col()



# 박스그래프
mpg2 <- mpg
mpg2 <- mpg2 %>% 
  filter(class %in% c('compact','subcompact','suv'))
ggplot(data=mpg2, aes(x=class, y=cty))+geom_boxplot()



# iris 데이터 막대그래프 출력
install.packages("ggplot2")
library(ggplot2)

x <- c(3,5,8,11,13)
y <- c(1,2,3,4,5)
cor(x,y)

# iris 데이터
head(iris)
str(iris)
head(par)
# 그래프를 맞춰주는 작업
par(mfrow=c(2,2),mar=c(1,1,1,1)) 
# 그래프로 확인하고
plot(iris[,-5])

# 수치값으로 보기
cor(iris[,-5])



# corrplot 패키지
install.packages("corrplot")
library(corrplot)

iris_cor <- cor(iris[,-5])
corrplot(iris_cor, method="circle")
corrplot(iris_cor, method="ellipse")
corrplot(iris_cor,method = "shade", tl.col = "blue",tl.srt = 30,diag=FALSE,addCoef.col = "red",order = "AOE")



# 질적/양적
library(MASS)
data("survey")

smoke <- table(survey$Smoke)
pie(smoke)
barplot(smoke)
table(survey$Sex,survey$Smoke)
