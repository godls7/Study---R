# Do it R 데이터분석
# Part 06. 자유자재로 데이터 가공하기
# p.160 분석도전

library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)

# 1
midwest <- midwest %>% 
            mutate(per_children = (poptotal-popadults)/poptotal*100)

# 2
midwest %>% 
  select(county,per_children) %>% 
  arrange(desc(per_children)) %>% 
  head(5)

# 3
midwest <- midwest %>% 
             mutate(children_grade = ifelse(per_children>=40,'large',
                                            ifelse(per_children>=30,'middle','small')))
midwest %>% 
  group_by(children_grade) %>% 
  summarise(n=n())

table(midwest$children_grade)

# 4
midwest %>% 
  mutate(per_asian = popasian/poptotal*100) %>% 
  select(state, county, per_asian) %>% 
  arrange(per_asian) %>% 
  head(10)