# doit_book practice p.133
df_mpg <- as.data.frame(ggplot2::mpg)

# 1
displ1 <- df_mpg %>% filter(displ<=4)
displ2 <- df_mpg %>% filter(displ>=5)

mean(displ1$hwy)
mean(displ2$hwy)

# 2
man1 <- df_mpg %>% filter(manufacturer=="audi")
man2 <- df_mpg %>% filter(manufacturer=="toyota")

mean(man1$cty)
mean(man2$cty)

# 3
man3 <- df_mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
mean(man3$hwy)