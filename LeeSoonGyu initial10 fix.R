# 빅데이터 A조(2차) 이순규

# 1. dplyr패키지와 iris데이터 셋을 대상으로 R코드 작성
library(dplyr)
library(reshape2)
data("iris")
iris

# 1-1 iris 꽃받침(Sepal.Width)의 폭 3.7 이상의 값만 필터링
soon <- iris %>% filter(Sepal.Width >= 3.7)
soon

# 1-2 1-1결과에서 2,4,5 컬럼을 선택하세요
soon1 <- soon %>% select(2,4,5)
soon1

# 1-3 1-2 결과에서 2,4컬럼을 뺀 나머지 diff 파생변수 생성 후 앞부분 10개만 출력
soon2 <- soon1 %>% mutate(diff = Sepal.Width - Petal.Width)
soon2
head(soon2$diff, 10)

# 1-4 1-3 결과에서 꽃의 종별로 그룹화 speal.width와 petal.width 변수의 평균 계산
soon3 <- soon2 %>% group_by(Species) %>% summarise(Sepal_mean = mean(Sepal.Width), Petal_mean = mean(Petal.Width))
soon3

# 1-5 1-3 결과에서 4번째 꽃의 종
soon2$Species[4]

# 2. user_data.csv 와 return_data.csv 이용 고객 반품사유코드 대상으로 다음 단계별 실행
# 반품사유코드에 대한 파생변수 생성
getwd()
setwd()
customer_data <- read.csv('user_data.csv', header = T)
return_data <- read.csv('return_data.csv', header = T)
# 2-1 고객정보 파일 불러오기 
customer_data
# 2-2 반품정보 파일 불러오기
return_data
# 2-3 파생변수 생성하기 2-4 생성 후 맨앞 데이터 6개 출력
library(reshape2)
library(plyr)
customer_return <- dcast(return_data, user_id ~ return_code, length)
head(customer_return)
names(customer_return) <- c('user_id', '제품이상(1)', '원인불명(2)', '변심(3)', '기타(4)')
head(customer_return)
customer_return_data <- join(customer_data, customer_return, by = 'user_id')
customer_return_data
customer_return_data$반품사유코드 <- customer_return_data$`제품이상(1)` +
  customer_return_data$`원인불명(2)` + 
  customer_return_data$`변심(3)` + 
  customer_return_data$`기타(4)`
customer_return_data$반품사유코드
head(customer_return_data$반품사유코드, 6)

# 2-5 맨밑 데이터 10개 출력
tail(customer_return_data, 10)
