# 빅데이터 A조 이순규
install.packages('ggplot2')
library(ggplot2)

# 1. iris 데이터를 대상으로 다음 조건으로 시각화 실행
data('iris')
iris

# 1-1 1번 컬럼을 x축 3번 컬럼을 y축
# 1-2 5번 컬럼으로 색상 지정
# 1-3 차트 제목 'Scatter plot for iris data'
windows()
ggplot(iris) + aes(x = Sepal.Length, y = Petal.Length, color = Species) +
  geom_point(shape = 'star', size = 1.5) +
  scale_color_hue(direction = 1) +
  labs(title = 'Scatter plot for iris data')

# 1-4 폭 720, 높이 480 설정 작성한 파일 'iris_LSG.jpg로 저장
getwd()
setwd('C:/Rwork/output')

jpeg('iris_LSG.jpg', width = 720, height = 480)
ggplot(iris) + aes(x = Sepal.Length, y = Petal.Length, color = Species) +
  geom_point(shape = 'circle', size = 1.5) +
  scale_color_hue(direction = 1) +
  labs(title = 'Scatter plot for iris data')
dev.off()

# 2. diamonds 데이터를 대상으로 다음 조건으로 시각화 실행
data('diamonds')
diamonds

# 2-1 x축에 carat변수, y축에 price변수 지정
plot_diamonds <- ggplot(diamonds, aes(carat, price,))
plot_diamonds

# 2-2 clarity변수를 선색으로 지정 미적 요소 맵핑 객체 생성
plot_diamonds <- ggplot(diamonds, aes(carat, price, color = clarity))
plot_diamonds

# 2-3 산점도 그래프 주변에 부드러운 곡선이 추가되도록 레이아웃 추가
windows()
plot_diamonds + geom_smooth(method = 'loess')

# 2-4 작성 파일 diamonds_LSG.jpg 파일 저장
getwd()
setwd('C:/Rwork/output')

jpeg('diamonds_LSG.jpg', width = 720, height = 480)
plot_diamonds + geom_smooth(method = 'loess')
dev.off()
