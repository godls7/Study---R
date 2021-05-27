library(dplyr)
library(ggplot2)
library(ggthemes)

data("iris")

g<- ggplot(data =iris, mapping = aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point(colour = c("red", "orange", "green")[iris$Species], 
             pch = c(0, 2, 20)[iris$Species], 
             size = c(1, 1.5, 2)[iris$Species])

g + theme_dark() +
  annotate(geom = "text", # geom = "도형종류"
             x = iris$Sepal.Length,  # x = x좌표
             y = iris$Sepal.Width, # y = y좌표
             label = rownames(iris), 
             colour = "white",  # colour = "글씨색"
             alpha = 0.7, # alpha = 투명도
             size = 3, # size = 글씨크기
             hjust = 0.5, # hjust = x축 영점 조절
             vjust = -1)   # vjust = y축 영점 조절