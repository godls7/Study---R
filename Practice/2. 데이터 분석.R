# practice p.123

library(ggplot2)
library(dplyr)

# 1
df_midwest <- as.data.frame(ggplot2::midwest)
# head, tail, View, dim, str, summary
head(df_midwest)
tail(df_midwest)
View(df_midwest)
dim(df_midwest)
str(df_midwest)
summary(df_midwest)

# 2
df_midwest <- rename(df_midwest, total=poptotal, asian=popasian)

# 3
df_midwest$perasian <- (df_midwest$asian/df_midwest$total)*100
hist(df_midwest$perasian)

# 4
df_midwest$sizeasian <- ifelse(df_midwest$perasian > 0.4872462, "large","small")

# 5
table(df_midwest$sizeasian)
qplot(df_midwest$sizeasian)
