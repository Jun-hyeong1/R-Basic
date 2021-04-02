############################
#######그래프에 대하여######
############################
#library(help="graphics") 참조
#R의 기본 그래픽 기능을 제공하는 graphics패키지


########################### 01 산점도



methods("plot")       #알아보자 plot

plot(
  x, # X 좌표
  y  # Y 좌표
)

install.packages("mlbench")
library(mlbench)      #라이브러리 설치

data(Ozone)
plot(Ozone$V8, Ozone$V9)




########################### 02 그래프 옵션




plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp")

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone")

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone", pch=20) #점 형태

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone", pch="+")

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone", pch=20, cex=.1) #점 크기

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone", col="#FF0000") # 색상


min(Ozone$V8)
min(Ozone$V8, na.rm = T)
min(Ozone$V9, na.rm = T)
max(Ozone$V8, na.rm = T)
max(Ozone$V9, na.rm = T)                  #최댓값, 최솟값을 알아보자

plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone", xlim=c(0,100),ylim=c(0,90)) # 축 범위 지정


data(cars)
str(cars)
head(cars)
plot(cars)
plot(cars, type="l")     # 이녀석 꼭 소문자여야 한다, 꺾은 선 그래프 그리는 법 
plot(cars, type="b")
plot(cars, type="o")

tapply(cars$dist, cars$speed, mean)            # 각각 그룹에 대한 평균으로 요약한다.######처음보는 거. 디플라이어로 하는법?summary
plot(tapply(cars$dist, cars$speed, mean), type="o", cex=0.5, xlab="speed", ylab="dist")

plot(cars, type="l", lty="dashed")             # 선 유형은 lty=""를 사용한다, 점선.

opar <- par(mfrow=c(1,2))                                  # par은 그래프 배열방식을 지정하는 그래픽 파라미터이다, 실행해보자 
plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone")
plot(Ozone$V8, Ozone$V9, xlab="Sandburg Temp", ylab="El Monte Temp",main="Ozone2")
par(opar)


######지터, 데이터에 노이즈 추가하기

jitter(
  x,            # 노이즈를 추가할 숫자 벡터
                # factor, amount는 추가할 노이즈의 정도를 지정한다. 보통은 이 값들을 직접 지정할 필요는 없다.
                # 노이즈의 크기를 지정하는 수식은 help(jitter)를 참고하기 바란다.
  factor=1,
  amount=NULL
)

head(Ozone[,c("V6","V7")])    #열이름 대소문자 주의하자
plot(Ozone$V6, Ozone$V7, xlab="windspeed", ylab="humidity",main="Ozone")
plot(jitter(Ozone$V6),jitter(Ozone$V7), xlab="windspeed", ylab="humidity",main="Ozone1")    #노이즈가 추가됐다





########################### 03 기본 그래프





#점그리기 #points()

plot(iris$Sepal.Width, iris$Sepal.Length, cex=.5, pch=20, xlab="width", ylab="length",main="iris")
points(iris$Petal.Width, iris$Petal.Length, cex=.5, pch="+", col="#FF0000")                 #앞의 그래프에 붉은색 점이 추가된다


with(iris, { 
  plot(NULL, xlim=c(0, 5), ylim=c(0, 10),
       xlab="width", ylab="length", main="iris", type="n")                      #type="n"을 설정하면 가상의 그래프가 그려진다
  
  points(Sepal.Width, Sepal.Length, cex=.5, pch=20)                             #point로 점을 그려줬다.
  points(Petal.Width, Petal.Length, cex=.5, pch="+", col="#FF0000")
  })


#꺾은선 그리기 #lines()

x <- seq(0, 2*pi, 0.1)    # x는 [0,2pi]구간
y <- sin(x)               # y는 sin함수

plot(x, y, cex=.5, col="red")
lines(x, y)                                 # 점들을 연결해줬다

plot(cars)                                  # cars 데이터에 대해서,

lines(lowess(cars))    #추세선 생성         # lowess는 "지역가중다항식회귀", 저차 다항식에 대해 회귀해준다, 비모수적이다


#직선 그리기 #abline

abline(
  a=NULL,   # a, b는 y = a + bx 형태의 직선을 그릴 때 절편과 기울기
  b=NULL,   
  
  h=NULL,   # y=h 형태의 수평선을 그릴 때 지정
  v=NULL,   # x=v 형태의 수직선을 그릴 때 지정
  reg=NULL, # 선형 회귀 모델을 그릴 때 지정
  ...
)

plot(cars, xlim=c(0, 25))               #산점도를 그렸다
abline(a=-5, b=3.5, col="red")        #기울기가 3.5인 직선을 그렸다

abline(h=mean(cars$dist), lty=2)      #dist의 평균인 수평선을 그렸다
abline(v=mean(cars$speed), lty=2)     #speed의 평균인 수직선을 그렸다, 직선이 괜찮은 추정을 했는가?



#곡선 그리기 #curve

curve(sin, 0, 2*pi)     # 구간에 대한 sin함수




#다각형 그리기 #polygon

lm(                                            # 선형모델을 생성한다 lm()은 많이쓴다 여기저기
  formula,  # 종속 변수 ~ 설명 변수
  data      # formula에 따라 선형 모델을 만들 대상이 되는 데이터
)

predict.lm(                                     # 선형 예측을 수행하는 함수
  object,   # 선형 모델 객체
  newdata,  # 예측을 수행할 새로운 데이터
  # 이 값을 생략하면 선형 모델을 만들 때 사용한 데이터가 사용된다.
  interval=c("none", "confidence", "prediction") #신뢰구간과 예측구간에 대한 파라미터
)

#이제 해보자 cars데이터에 대해 회귀직선을 그려보자

(m <- lm(dist ~ speed, data=cars))  #모델 생성

plot(cars)
abline(m)                           #모델로 직선 그리기


#이제 해보자 cars데이터에 대해 제동거리를 예측해보자

p <- predict(m, interval="confidence")        #예측모델 생성
head(p,10)

#아 다각형이 신뢰구간을 그리는 거였구나

x <- c(cars$speed,            #x값 전부
       tail(cars$speed, 1),   #x의 끝값
       rev(cars$speed),       #우측에서 좌측으로
       cars$speed[1])         #x의 첫번째값

y <- c(p[, "lwr"],            #p모델의 최솟값들
       tail(p[, "upr"], 1),   #p모델의 최댓값 한개
       rev(p[, "upr"]),       # "
       p[, "lwr"][1])         #p모델의 최솟값 한개

plot(cars)                                  #산점도를 그렸다
abline(m)                                   #회귀직선을 그렸다
polygon(x, y, col=rgb(.7, .7, .7, .5))      #신뢰구간을 그렸다, 투명하게.





########################### 04 문자열(text)


plot(4:6, 4:6)
text(5, 5, "미드")
text(5, 5, "레드", adj=c(0, 0))
text(5, 5, "바텀", adj=c(0, 1))
text(5, 5, "탑", adj=c(1, 0))
text(5, 5, "블루", adj=c(1, 1))     #(5,5)위치에, 텍스트"블루"를, 좌측하단에 표시한다

plot(cars, cex=.5)
text(cars$speed, cars$dist, pos=4)  #해보면 알아, 점 대신에 텍스트로 표시



########################### 05 그래프에 그려진 데이터의 식별(identify)

plot(cars, cex=.5)
identify(cars$speed, cars$dist)   #마우스포인터가 십자가로 변하고 그래프위에서 레이블을 확인한다.



########################### 06 범례 (legend)


plot(iris$Sepal.Width, iris$Sepal.Length, pch=20, xlab="width", ylab="length")    #산점도를 그렸다

points(iris$Petal.Width, iris$Petal.Length, pch="+", col="#FF0000")               # 다른데이터에 대해 붉은 십자가를 그렸다

legend("topright", legend=c("Sepal", "Petal"), pch=c(20, 43),
       col=c("black", "red"), bg="gray")                                          # 우측상단에, 해당""을, pch~ 모양으로, ~ ,bg~배경으로 그렸다



########################### 07 행렬에 저장된 데이터 그리기

(x <- seq(-2*pi, 2*pi, 0.01)) 
(y <- matrix(c(cos(x), sin(x)), ncol=2))  # x,y값을 지정한다(행렬의 형태로)


matplot(x, y, lty=c("solid", "dashed"), cex=.2, type="l")   #그래프를 그린다.

abline(h=0, v=0)



########################### 08 응용그래프


#상자그림 그리기(boxplot)


boxplot(iris$Sepal.Width)
(s<-boxplot(iris$Sepal.Width))        #boxplot의 정보에 대한 리스트를 반환한다

boxstats <- boxplot(iris$Sepal.Width, horizontal=TRUE)    #가로로 배치한다
text(boxstats$out, rep(1, NROW(boxstats$out)), labels=boxstats$out, pos=c(1, 1, 3, 1))    #이상치에 텍스트 라벨을 표시한다


sv <- subset(iris, Species=="setosa" | Species=="versicolor")   # iris데이터에서 두 열만을 고른다(두 종만을 고른다.)
sv$Species <- factor(sv$Species)                                # sv데이터의 팩터를 정정해준다(두종류 뿐인거다)(일종의 테크닉일테다)
boxplot(Sepal.Width ~ Species, data=sv, notch=TRUE)             # 두 종에 대해 Width의 상자그림을 그려준다.
                                                                # notch=T 로 인해서 중앙값의 신뢰구간이 파여서 표현된다.                             
 
#히스토그램 그리기(hist)


hist(iris$Sepal.Width)                       #히스토그램을 그렸다 (빈도)
hist(iris$Sepal.Width,freq=FALSE)            #히스토그램을 그린다 (밀도)



#밀도 그림 그리기 (density)

#density는 밀도에 대한 데이터로의 반환값이다.


hist(iris$Sepal.Width, freq=FALSE)           #히스토그램을 그린다
lines(density(iris$Sepal.Width))             #밀도 라인을 추가한다

#이렇게 하거나,

plot(density(iris$Sepal.Width))              #밀도 그래프를 그린다

rug(jitter(iris$sepal.WIDTH)) # rug는 데이터를 표시한다
                              # jitter는 값이 구분되게 해준다



#막대그래프 (barplot)

barplot(tapply(iris$Sepal.Width, iris$Species, mean))   #종에 대한 width의 평균 



#파이그래프(pie)-> 범주별로 개수를 알아야한다.

cut(1:10, breaks=c(0,5,10))                   #숫자벡터에 대해 대응하는 구간을 반환한다.

cut(1:10, breaks=3)


cut(iris$Sepal.Width, breaks=10)

table(cut(iris$Sepal.Width, breaks=10))       #연속자료를 범주(구간)별로 개수를 반환시킨다.

pie(table(cut(iris$Sepal.Width, breaks=10)))  #파이그래프를 그렸다.




#모자이크 플롯(mosaicplot)-> 범주에대해 다변량일때.


data("Titanic")
str(Titanic)                                #타이타닉 데이터는 여러개의 범주로 대상을 분류하고 있다.

mosaicplot(Titanic, color =T)               #모자이크 플롯을 그렸다
mosaicplot(~Class+Survived, data= Titanic, color=TRUE, cex=1.2)      #두개의 범주만을 선정해서 단순화 한다.



#산점도 행렬 (pairs), 산점도의 행렬 형태.

pairs(~ Sepal.Width + Sepal.Length + Petal.Width + Petal.Length,
      data=iris, pch=c(1, 2, 3)[iris$Species])                       #pch 1,2,3이 세개의 종에 대해 각각 사각형,원형,십자형을 대응시킴



#투시도(persp), 등고선 그래프(contour)


#outer(,,function) 유용한도구
outer(1:5,1:3,"*")           #모든 조합에 대해 곱한다


install.packages("mvtnorm")
library(mvtnorm)
dmvnorm(c(0, 0), rep(0, 2), diag(2))


x <- seq(-3, 3, .1)
y <- x
f <- function(x, y) { dmvnorm(cbind(x, y)) }
persp(x, y, outer(x, y, f), theta=30, phi=30)   #투시도를 그렸다

contour(x, y, outer(x, y, f))                   #등고선 그래프를 그렸다

























