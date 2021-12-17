# 빅데이터 A조 이순규

# 1. CleanData 파일 데이터에서 나이(age3)와 직위(position)간의 관련성 단계별 분석
# 1-1 데이터셋 가져오기
getwd()
setwd('E:/BigDate/R programing/dataset2/dataset2')
setwd('E:/BigDate/R programing/dataset3/dataset3')
cleandata <- read.csv('cleanData.csv', header = T)
cleandata

# 1-2 코딩변경(변수리코딩)
x <- cleandata$position # 행 직위변수 이용
y <- cleandata$age3 # 열 나이 리코딩 변수 이용

# 1-3 산점도를 이용한 변수간의 관련성 보기
windows()
plot(formula = y ~ x, data = cleandata)

# 1-4 해석
# 직위 변수값이 높아짐에 나이 변수값이 낮아짐

# 2. response.csv파일 데이터 작업 유형에 따른 응답 정도에 차이가 있는가를 단계별 검정.
# 2-1 파일 가져오기
getwd()
setwd()
responsedata <- read.csv('response.csv', header = T)
responsedata

# 2-2 코딩 변경
responsedata$job[responsedata$job == 1] <- '학생'
responsedata$job[responsedata$job == 2] <- '직장인'
responsedata$job[responsedata$job == 3] <- '주부'
responsedata$response[responsedata$response == 1] <- '무응답'
responsedata$response[responsedata$response == 2] <- '낮음'
responsedata$response[responsedata$response == 3] <- '높음'
responsedata

# 2-3 교차분할표 작성
install.packages('gmodels')
library(gmodels)
CrossTable(x = responsedata$job, y = responsedata$response)

# 3. mtcars 데이터에서 엔진(vs) 종속변수, 연비(mpg)와 변속기종류(am)을 독립변수
# 로지스틱 회귀분석을 실시.
# 3-1 데이터 가져오기
data('mtcars')
leesoongyu <- mtcars
leesoongyu

# 3-2 로지스틱 회귀분석 후 회귀모델 확인
mtcars_glm <- glm(vs ~ mpg + am, data = leesoongyu, family = 'binomial')
mtcars_glm

# 3-3 로지스틱 회귀모델 요약정보 확인
summary(mtcars_glm)

# 3-4 로지스틱 회귀식
soon <- leesoongyu$mpg
gyu <- leesoongyu$am

# vs = -12.7051 + 0.6809*soon - 3.0073*gyu
# vs

# 3-5 결과 해석
# mpg가 1증가 -> vs 0.6809 상승
# am 1증가 -> vs -3.0073 하락

# 3-6 mpg가 30이고 자동변속기(am=0)일때 승산(odds)?
odds = -12.7051 + 0.6809*30 - 3.0073*0
odds
result_odds = exp(odds)
result_odds
