x <- '2022-01-01'
obj <- as.Date(x) + 15


# matrix
mat1 <- matrix(c(1,2,3,4))
mat2 <- matrix(c(1,2,3,4), nrow = 2) # 열 우선! 열 먼저 채움
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=T)

# 원래 행렬 모양 그대로 출력하면 반드시 byrow=T => 행 우선
mat4 <- matrix(c(1,2,3
                 ,4,5,6
                 ,7,8,9),nrow=3, byrow=T)  

mat4 <- rbind(mat4, c(11,12,13))

# Matrix 연습문제 - 2,3,4
seasons <- matrix(c('봄','여름'
                    ,'가을','겨울'), nrow = 2, byrow=T)
seasons[,2]
seasons2 <- rbind(seasons,c('초봄','초가을'))
seasons3 <- cbind(seasons2, c('초여름','초겨울','한겨울'))



# list
list1 <- list(name='Haein',
              address = 'Suwon',
              tel = '010-5068-4402',
              pay = 500)
list1$name <- c('Haein','Deagyun')
list1
list1[1] # list로 return
list1[[1]] # 해당 값만 return (character, numeric ....)



# frame
no <- c(1,2,3,4)
name <- c('Apple', 'Peach', 'Banana', 'Grape')
price <- c(500,200,100,50)
qty <- c(5,2,4,7)
sales <- data.frame(NO=no,NAME=name,PRICE=price,QTY=qty)

sales2 <- matrix(c(1,'Apple',500,5,
                  2,'Peach',200,2,
                  3,'Banana',100,4,
                  4,'Grape',50,7),nrow=4,byrow=T)
df1 <- data.frame(sales2)
names(df1) <- c('NO','NAME','PRICE','QTY')

sale <- matrix(c(1,'Apple',500,5),nrow=2, byrow=T)