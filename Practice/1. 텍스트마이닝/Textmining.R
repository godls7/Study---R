# 0430 텍스트마이닝 과제
# 제주도에서 추천되는 여행코스로 많이 소개되는 지명을 워드클라우드로 시각화하세요.
library(KoNLP)
text <- readLines("jeju.txt")

text2 <- sapply(text,extractNoun, USE.NAMES = F)
text3 <- unlist(text2)
text3 <- gsub("[[:punct:]]"," ",text3) # [[:punct:]] : 모든 특수문자 제거
text3 <- gsub("→"," ",text3)
text3 <- gsub("◆"," ",text3)

text3 <- strsplit(text3, split=" ") # 띄어쓰기 기준 파싱
text4 <- unlist(text3)

text4 <- gsub("\\d+","",text4)
text4 <- gsub("[A-z]","",text4)
text4 <- gsub("제주도|제주시|제주|서귀포|서귀포시","",text4)
text4 <- gsub("공항|항공|숙소|여행|코스|추천|기대|관광지|출발|도착|일정|렌트카|예약|이용|시간|일정|입장료|입장|무료|주소|차량|호텔|사진|카페|커피|식당|필요|도움|점심|저녁|이용|준비|전국|업체","",text4)
text4 <- gsub("연휴|인터넷|가능|탑승|이동|성인|학생|바다|대장|주차장|해변|인수|날|오전|저녁|위치|어린이|청소년|어른|하루|경유|소요|드라이브|할인|다양|중간|녹차|전망|해안","",text4)
text4 <- gsub("습니|합니|됩니|입니|랍니|까지|하시|주시|대신|하세요|대한|대로|어디|대문|곳|때문|거기|에서|째","",text4)
text4 <- gsub("[ㄱ-ㅎ]","",text4)
text4 <- Filter(function(x){nchar(x)>=2},text4) # 한글자제거

wordcount <- table(text4)
head(sort(wordcount,decreasing = T),20)

library(RColorBrewer) # palete 색을 만들어 줌
library(wordcloud)
alete <- brewer.pal(9,"Set3") # 9가지 color

wordcloud(names(wordcount), # wordcount중 이름만 
          freq=wordcount, # 단어들의 출현빈도수
          scale=c(3,1),
          rot.per=0.25, # rotation
          min.freq=9,
          random.order=F,
          random.color=T, # color 랜덤
          colors=palete)

# legend : 범례 (투명레이어)
legend(0.3,1 ,"서울시 응답소 요청사항 분석",
       cex=0.8,fill=NA,border=NA,bg="white" ,
       text.col="red",text.font=2,box.col="red")

