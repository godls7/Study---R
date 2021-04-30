rm(list=ls())
getwd()
setwd("c:/myRwork/day_0430")

library(KoNLP)

# readLines => 데이터를 가져와 각 문자열을 요소로 벡터 생성
data1 <- readLines("seoul_new.txt")
head(data1)
tail(data1)

# 명사추출
extractNoun("아버지가 방에 들어가신다.")
extractNoun("아버지가방에 들어가신다.")

# for 문 안씀....
for(line in data1) {
  print(extractNoun(line))
}

# data2 => list! 비정형 구조로 2차원으로 구성
data2 <- sapply(data1,extractNoun, USE.NAMES = F)
print(data2)

# 리스트를 벡터로 변환
data3 <- unlist(data2)

# gsub("변경전글자","변경후글자","원본데이터")
# 무의미한 단어를 제거하기!!
data3 <- gsub("\\d+","",data3) # \\d+ : excape digit 숫자 형태의 문자,문자열 탐색
data3 <- gsub("서울시","",data3)
data3 <- gsub("서울","",data3)
data3 <- gsub("요청","",data3)
data3 <- gsub("제안","",data3)
data3 <- gsub("님","",data3)
data3 <- gsub("한","",data3)
data3 <- gsub("동","",data3)
data3 <- gsub("관련","",data3)
data3 <- gsub("[A-z]","",data3)
data3 <- gsub("[[:punct:]]+","",data3) # [[:punct:]] : 모든 특수문자 제거
data3 <- gsub("O","",data3)
data3 <- gsub(" ","",data3)

# 파일 생성
write(unlist(data3),"seoul_2.txt")
# 빈줄 제거
data4 <- read.table("seoul_2.txt")
nrow(data4) 

wordcount <- table(data4) # table => 도수분포표
head(sort(wordcount,decreasing = T),20)

# 시각화
library(RColorBrewer) # palete 색을 만들어 줌
library(wordcloud)
palete <- brewer.pal(9,"Set3") # 9가지 color

wordcloud(names(wordcount), # wordcount중 이름만 
          freq=wordcount, # 단어들의 출현빈도수
          scale=c(5,1),
          rot.per=0.25, # rotation
          min.freq=1,
          random.order=F,
          random.color=T, # color 랜덤
          colors=palete)
# legend : 범례 (투명레이어)
legend(0.3,1 ,"서울시 응답소 요청사항 분석",
       cex=0.8,fill=NA,border=NA,bg="white" ,
       text.col="red",text.font=2,box.col="red")

