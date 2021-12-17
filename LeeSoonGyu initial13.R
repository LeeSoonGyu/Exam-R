# 빅데이터 A조 이순규

library(KoNLP)
library(tm)
library(devtools)
library(wordcloud2)
library(stringr)
library(dplyr)

# 2. 제공된 DrKing 데이터에서 빈도수가 2회 이상 단어를 이용 단어 구름 시각화

# 데이터 자료 가져오기 #
rm(list = ls())
getwd()
setwd('C:/rwork')
Drking <- file('Drking.txt', encoding = 'UTF-8')
Drking_data <- readLines(Drking)
head(Drking_data)

Drking_data <- str_replace_all(Drking_data, '["들이", "하게"]', ' ')

exNouns <- function(x) { paste(extractNoun(as.character(x)), collapse = " ") } # 단어 추출위한 함수 정의

# 2-1 단어 추출
Drking_nouns <- sapply(Drking_data, exNouns)
Drking_nouns[3]

# 2-2 전처리
myCorpus <- Corpus(VectorSource(Drking_nouns)) # 말뭉치 생성
myCorpusPrepro <- tm_map(myCorpus, removePunctuation) # 문장부호 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, removeNumbers) # 수치 제거
myCorpusPrepro <- tm_map(myCorpusPrepro, tolower) # 소문자 변경
myCorpusPrepro <- tm_map(myCorpusPrepro, removeWords, stopwords('english')) # 불용어 제거
inspect(myCorpusPrepro[1:5]) # 전처리 결과 확인

# 2-3 전처리된 단어집에서 2 ~ 8 음절 단어 대상 선정
myCorpusPrepro_term <-
  TermDocumentMatrix(myCorpusPrepro, 
                     control = list(wordLengths = c(4, 16)))

myCorpusPrepro_term

# 2-4 matrix 자료구조를 data.frame 자료구조로 변경
myTerm_df <- as.data.frame(as.matrix(myCorpusPrepro_term))
dim(myTerm_df)

# 2-5 단어 출현 빈도수 구하기
wordResult <- sort(rowSums(myTerm_df), decreasing = TRUE)
wordResult[1:10]

# 2-6 단어 이름과 빈도수로 data.frame 생성
myName <- names(wordResult)
word.df <- data.frame(word = myName, freq = wordResult)

# 2-7 worldcloud2 이용 시각화
myName <- names(wordResult)
df <- data.frame(word = myName, freq = wordResult)
df <- df %>% filter(freq >= 2) # 빈도수 2회 이상 단어 추출
df # 빈도수 2회 이상 단어
wordcloud2(data = df, color = "random-light", backgroundColor = "black", fontFamily = "나눔바른고딕")
