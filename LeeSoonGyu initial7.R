# 빅데이터 A조(2차) 이순규
# 1. MASS패키지 Animals데이터셋에 대한 기본함수 이용
# 1) Animals 데이터셋 보기
install.packages('MASS')
library(MASS)
leesoongyu <- Animals
leesoongyu
dim(leesoongyu)
summary(leesoongyu)
# 2) body 컬럼 요약통계량
summary(leesoongyu$body)
# 3) body 컬럼 평균
mean(leesoongyu$body)
# 4) body 컬럼 표준편차
sd(leesoongyu$body)
# 5) Animals 데이터셋 빈도수
table(leesoongyu)

# 2. 데이터프레임
exam_data = data.frame(
 name = c('Anastasia', 'Dima', 'Katherine', 'James', 'Emily', 'Michael', 'Matthew', 'Laura', 'Kevin', 'Jonas'),
 score = c(12.5, 9, 16.5, 12, 9, 20, 14.5, 13.5, 8, 19),
 attempts = c(1, 3, 2, 3, 2, 3, 1, 1, 2, 1),
 qualify = c('yes', 'no', 'yes', 'no', 'no', 'yes', 'yes', 'no', 'no', 'yes')
)
exam_data

# 1) 데이터 프레임 추가
country = c('RUS', 'CHN', 'USA', 'USA', 'USA', 'USA', 'USA', 'USA', 'USA', 'USA')
exam_data1 <- cbind(exam_data, country)
exam_data1
# 2) 데이터 프레임 추가
kor_data = data.frame(
  name = c('Kim', 'Lee'),
  score = c(15, 10),
  attempts = c(1, 3),
  qualify = c('yes', 'no'),
  country = c('KOR', 'KOR')
)
exam_data2 <- rbind(exam_data1, kor_data)
exam_data2
# 3) qualify 제외 데이터 프레임 출력
exam_data2[c('name', 'score', 'attempts', 'country')]
exam_data2[, -c(4)]
# 4) Dima, Jonas 제외 데이터 프레임 출력
exam_data2[-c(2,10), ]
# 5) 이름과 그들의 국적만 출력
exam_data2[, c('name', 'country')]
exam_data2[, -c(2:4)]
