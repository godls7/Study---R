x = '2010/11/01'
class(x)
x+10

y=as.Date(x)
class(y)
y+10

var1 <-30
var2 <-40

if(var1>var2){ # 반드시 논리 형태로 나와야하는 부분
  cat("큰 수는 = ",var1)
} else {
  cat("큰 수는 = ",var2)
}

# 삼향연산자
ifelse(var1>var2,var1,var2)

if(var2 == 100){
  print("num 1 is 100")
} else if(var2 == 50){
  print("num1 is 50")
} else if(var2 == 40){
  print("num1 is 40")
} else {
  print("30이하입니다")
}

emp_name = '이해인'
switch(emp_name,
       "이해인"=30,
       "이대균"=40,
       "이대경"=50)

name <- c("이해인","이대균","이대경")
which(name=="이대경")




# 함수를 메모리에 먼저 올려야함
myMax<-function(x,y){
  max=x
  if(max<y){
    max=y
  }
  return(max)
}

# 그다음에 실행
# -----------maiin------------
a <-10
b <-20
result = myMax(a,b)
print(result)

c<-100
d<-200
myMax(c,d)

# 가변 매개변수
mysum <- function(...){ # ...은 벡터로 자동으로 변환
  return(sum(c(...)))  # 그래서 c로 벡터화 해줘야함
}

mysum(10,20,30)
mysum(10,30,40,50)
mysum(c(10,20,30))


myfunc <- function(name, age=0, dept){
  cat("이름 :", name)
  cat(" 나이 :", age)
  cat(" 학과 :", dept)
}

myfunc(name='haein',dept='software')


?c
vec1 <- c(1,2,3,4,5)
length(vec1)

vec1 <- c(vec1,7)

vec2 <- c(1:5)
append(vec2,10,after=3)

vec3 <-union(vec1,vec2)

date4 <- seq(from=as.Date('2015-01-01'),to=as.Date('2015-01-31'),by=1)

vec1 <- c('사과','배','감','버섯','고구마')
vec1[-3]

v1 <- c('봄','여름','가을','겨울')
v2 <- c('봄','여름','늦여름','초가을')

union(v1,v2)
setdiff(v1,v2)
intersect(v1,v2)

