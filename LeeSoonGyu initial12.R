# 빅데이터 A조 이순규
# 1. iris데이터를 이용 CART기법 적용 rpart()함수 이용 분류분석
rm(list = ls())
install.packages('rpart')
install.packages('caret')
library(rpart)
library(caret)

# 1-1 데이터 가져오기 샘플링
data(iris)

set.seed(1000)
iris_idx <- sample(1:nrow(iris), nrow(iris) * 0.7)
iris_train <- iris[iris_idx, ]
iris_test <- iris[-iris_idx, ]

# 1-2 분류모델 생성
iris_model <- rpart(Species ~ ., data = iris_train)
summary(iris_model)

# 1-3 테스트 데이터를 이용하여 분류
iris_pred <- predict(iris_model, iris_test, type = 'class')
iris_pred

# 1-4 예측 정확도
iris_result <- confusionMatrix(iris_pred, iris_test$Species)
iris_result
# 예측 정확도 : 0.9556

# 2. iris데이터를 이용 조건부 추론나무 ctree()함수 이용 분류분석
rm(list = ls())
install.packages('party')
library(party)

# 2-1 데이터 가져오기 샘플링
data(iris)

set.seed(1000)
iris_idx <- sample(1:nrow(iris), nrow(iris) * 0.7)
iris_train <- iris[iris_idx, ]
iris_test <- iris[-iris_idx, ]

# 2-2 분류모델 생성
iris_tree <- ctree(Species ~ ., data = iris_train)
iris_tree

# 2-3 테스트 데이터를 이용하여 분류
iris_pred <- predict(iris_tree, iris_test)
table(iris_pred, iris_test$Species)

# 2-4 시각화
windows()
plot(iris_tree)  # 의사결정트리 시각화
windows()
plot(iris_pred)  # 분류 결과 시각화

# 3. iris 데이터셋의 1~4번 변수를 대상으로 유클리드 거리 매트릭스를 구하여 idist 저장한 뒤
# 계층적 클러스터링을 적용하여 결과를 시각화
rm(list = ls())
install.packages('cluster')
library(cluster)

data(iris)

# 3-1 유클리드 거리계산
iris_df <- iris[, c(1:4)]
head(iris_df)

idist <- dist(iris_df, method = 'euclidean')

# 3-2 계층형 군집 분석(클러스터링)
iris_hc <- hclust(idist)

# 3-3 분류결과를 대상으로 음수값을 제거 덴드로그램 시각화
plot(iris_hc, hang = -1)

# 3-4 그룹 수를 3개로 지정, 그룹별로 테두리 표시
rect.hclust(iris_hc, k = 3, border ="red")
