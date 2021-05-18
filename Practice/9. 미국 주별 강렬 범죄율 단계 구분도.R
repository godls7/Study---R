# 미국 주별 강렬 범죄율 단계 구분도 만들기
install.packages("mapproj")
install.packages("ggiraphExtra")

library(ggiraphExtra)
library(tibble)

crime <- rownames_to_column(USArrests, var="state")
crime$state <- tolower(crime$state)

install.packages("maps")

library(ggplot2)
library(maps)

states_map <- map_data("state")
ggChoropleth(data = crime, 
             aes(fill=Murder, map_id=state), 
             map=states_map,
             interactive = T)