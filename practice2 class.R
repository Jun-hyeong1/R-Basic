############### 01 변수
a
b
a1
a2
.x        # 올바른 변수명

2a
.2
a-b       # 올바르지 않은 변수명


mean(x<-c(1,2,3))
x

mean(x = c(1,2,3))
x



############### 02 함수 호출시 인자 지정

foo(a, b, c=1, d=2)

foo(3, 4)
foo(3, 4, 1)
foo(3, 4, 1, 2)

foo(3,4,5)


foo(a=3, b=4, d=5)
foo(d=5, a=3, b=4)
foo(3, 4, d=5)

foo(foobar, foocar=3)

foo(foob=1)
foo(fooba=1)    #구분할 정도만 명시해도 된다


############### 03 스칼라

a <- 3
b <- 4.5
c <- a+b
print(c)
c

one <- 80
two <- 90
three <- 75
four <- NA

is.na(
  x  # R의 데이터 객체
)

is.na(four)

is.null(
  x # R의 데이터 객체
)

x <- NULL
is.null(x)
is.null(1)
is.null(NA)
is.na(Null)


is_even  <- NULL
if(a가 짝수면){
  is_even <-TRUE  
}else{
  is_even <- FALSE
}                   # NULL의 사용예

a <- "hello"
print(a)

a <- 'hello'
print(a)            # 둘다 가능하다

TRUE & TRUE
TRUE & FALSE
TRUE | TRUE
TRUE | FALSE
!TRUE
!FALSE

T <- FALSE
TRUE <- FALSE

c(TRUE,TRUE) & c(TRUE,FALSE)
c(TRUE,TRUE) && c(TRUE,FALSE)

#팩터

factor(
  X,      #팩터로 표현하고자 하는값(주로 문자열 벡터로 지정)
  levels, #값의 레벨
  orderd  #TRUE면 순서형, FALSE면 명목형 데이터를 뜼한다. 기본값은 FALSE다.
)

nlevels(
  x       #팩터 값, 반환은 레벨개수
)

leverls(
  x       #팩터 값, 반환은 레벨 목록
)

is.factor(
  x       #R 객체, 주어진것이 팩터인가?
)

orderd(
  x       # 팩터로 표현하고자하는 값, 순서형 팩터 생성 
)

is.orderd(
  x       #R 객체, 주어진 것이 순서형 팩터인가? 
)

sex <- factor("m",c("m", "f")) 
sex

nlevels(sex)
levels(sex)

levels(sex)[1]
levels(sex)[2]

sex
levels(sex) <- c("male","female")
sex

factor(c("m","m","f"),c("m", "f")) 
factor(c("m","m","f"))

ordered("a",c("a","b","C"))   #순서형 데이터


############### 04 벡터

#벡터관련함수

c(
  ...    # 벡터로 모을 R 객체들
)

names(
  x      # 이름을 얻어올 R객체
)

names(
  x      # 이름을 저장할 R객체
) <- value # 저장할 이름

(x <- c(1,2,3,4,5))
(x <- c("1",2,"3"))

c(1,2,3)
c(1,2,3,c(1,2,3))

x <- c(1,3,4)
names(x) <- c("kim","seo","park")
x

#벡터의 길이 관련 함수

length(
  x       # R 객체, 팩터, 배열, 리스트를 지정한다 
)

NROW(
  x       # 벡터, 배열 또는 데이터프레임 
)

#벡터의 색인

x <- c("a","b","c")
x[1]
x[3]
x[-1]
x[-2]
x[c(1,2)]
x[c(1,3)]
x[1:2]
x[1:3]

x <- c(1,3,4)
names(x) <- c("kim","seo","park")
x
x["seo"]
x[c("seo","park")]

names(x) [2]

x  <- c("a","b","c")
length(x)
nrow(x)               #nrow는 행렬만 가능
NROW(x)               #NROW는 벡터와 행렬 사용가능

#벡터 연산

identical(
  x,                  #R객체            
  y                   #R객체, 두 객체가 같은가?
)

union(
  x,                  #벡터
  y                   #벡터, 합집합을 구한다
)

intersect(
  x,                  #벡터 
  y                   #벡터, 교집합을 구한다
)

setdiff(
  x,                  #벡터
  y                   #벡터, 차집합을 구한다
)

setequal(
  x,                  #벡터
  y                   #벡터, 같은 집합인가?
)


identical(c(1,2,3),c(1,2,3))
identical(c(1,2,3),c(1,2,100))

"a"%in% c("a","b","c")
"d"%in% c("a","b","c")       # 어떤 값이 벡터에 포함돼 있는가? 

x <- c(1,2,3,4,5)
x+1
10-x

c(1,2,3)==c(1,2,100)
c(1,2,3)!=c(1,2,100)

union(c("a","b","c"), c("a","d"))       #합집합
intersect(c("a","b","c"), c("a","d"))   #교집합
setdiff(c("a","b","c"), c("a","d"))     #차집합

setequal(c("a","b","c"), c("a","d"))
setequal(c("a","b","c"), c("a","b","c","c"))

#연속된 숫자로 구성된 벡터 관련함수

seq(
  from,               #시작값
  to,                 #끝 값
  by                  #증가치
)

seq_along(
  along.with          #이 인자 길이만큼 시퀀스를 생성한다.
)

seq(3,7)
seq(7,3)
seq(3,7,2)
seq(3,7,3)

3:7
7:3

x <- c(2,4,6,8,10)
1:NROW(x)

seq_along(x)

#반복된 값을 저장한 벡터

rep(
  x,         # 반복한 값이 저장된 벡터
  time,      # 전체 벡터의 반복횟수
  each       # 개별 값의 반복 횟수
)

rep(1:2, times=5)
rep(1:2, each=5)
rep(1:2, each=5, times=2)


############### 05 리스트

list(
  key1=value1,
  key2=value2,
  ...
)                    # 리스트를 반환한다

x <- list(name="foo", height=70)
x <- list(name="foo", height=c(1,2,3))

list (a=list(val=c(1, 2, 3)), b=list(val=c(1, 2, 3, 4)))

x <- list(name="foo", height=c(1, 3, 5))
x$name
x$height
x[1]
x[2]


############### 06 행렬

matrix(
  data,             #행렬을 생성할 데이터 벡터
  nrow,             #행의 수
  ncol,             #열의 수
  byrow=FALSE,      #TRUE로 설정하면 행우선, FALSE일 경우 열 우선으로 데이터를 채운다.
  dimnames=NULL     #행렬의 각 차원에 부여할 이름
)

#행렬의 이름반환과 이름 설정 함수

dimnames(
  x                 #R 객체, 차원에 대한 이름 반환
)

dimnames(
  x                 #R 객체
)<- value           # 차원에 부여할 이름

rownames(
  x                 #2차원이상의 행렬과 유사한 객체
)

rownames(
  x                 #2차원이상의 행렬과 유사한 객체
)<- value           # NULL 또는 x와 같은 길이의 문자열 벡터 

colnames(
  x                 #2차원이상의 행렬과 유사한 객체
)

colnames(
  x                 #2차원이상의 행렬과 유사한 객체
)<- value           # NULL 또는 x와 같은 길이의 문자열 벡터


matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow=3)

matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol=3)

matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow=3, byrow=TRUE)

matrix(1:9, nrow=3, dimnames=list(c("r1", "r2", "r3"), c("c1", "c2", "c3")))

x <- matrix(1:9, ncol=3)
dimnames(x) <- list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))
x

x<- matrix(1:9,ncol=3)
rownames(x)
rownames(x)<-c("r1","r2","r3")
x
colnames(x)<-c("c1","c2","c3")
x

#행렬 데이터 접근
(x <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), ncol=3))
x[1,1]
x[1,2]
x[2,1]
x[2,2]

x[1:2,]

x[-3,]

x[c(1,3),c(1,3)]

(x <- matrix(1:9, nrow=3,dimnames=list(c("r1", "r2", "r3"), c("c1", "c2", "c3"))))
x["r1",]

#행렬 연산

t(
  x           # 행렬 또는 데이터 프레임, 전치행렬 구하기
)

solve(
  a,          # 행렬
  b           # 벡터 또는 행렬, 역행렬을 구한다
)

nrow(
  x           # 벡터, 배열 또는 데이터 프레임
)

ncol(
  x           # 벡터, 배열 또는 데이터 프레임
) 

dim(
  x           # 행렬, 배열 또는 데이터 프레임
)

dim(
  x           # 행렬, 배열 또는 데이터 프레임
) <- value    # 객체의 차원

x <- matrix(c(1, 2, 3, 4, 5, 6, 7, 8, 9), nrow=3)
x*2
x/2
x+x
x-x
x %*% x
t(x)

x <- matrix(c(1, 2, 3, 4), ncol=2)
solve(x)
x %*% solve(x)     #단위 행렬이 나온다

x <- matrix(c(1, 2, 3, 4,5,6), ncol=3)

nrow(x)
ncol(x)

dim(x)
dim(x) <- c(3,2)
x


############### 07 배열

array(
  data=NA,           # 데이터를 저장한 벡터
  dim=length(data),  # 배열의 차원. 이 값을 지정하지 않으면 1차원 배열이 생성된다.
  dimnames=NULL      # 차원의 이름
)

array(1:12, dim=c(3, 4))

(x <- array(1:12, dim=c(2, 2, 3))) #2x2x3 차원의 배열

x[,,3]

#배열 데이터 접근

(x <- array(1:12, dim=c(2, 2, 3)))

x[1, 1, 1]
x[1, 2, 3]
x[, , 3]

dim(x)


############### 08 데이터 프레임, 가장 중요한 데이터 타입

data.frame(
  # value 또는 tag=value로 표현된 데이터 값. '...'은 가변 인자를 의미한다.
  ...,
  # 주어진 문자열을 팩터로 저장할 것인지 또는 문자열로 저장할 것인지를 지정하는 인자.
  # 기본값은 보통 TRUE다. 따라서 이 인자를 지정하지 않으면 문자열은 팩터로 저장된다.
  stringsAsFactors=default.stringsAsFactors()
)

str(
  object # 구조를 살펴볼 R 객체, 구조를 파악해준다
)

(d <- data.frame(x=c(1, 2, 3, 4, 5), y=c(2, 4, 6, 8, 10)))

(d <- data.frame(x=c(1, 2, 3, 4, 5), y=c(2, 4, 6, 8, 10), z=c('M', 'F', 'M', 'F', 'M')))

str(d)
d$x
d$x <- 6:10
d
d$w <- c("A","B","c","D","E")       #새로운 걸럼을 추가
d


(x <- data.frame(1:3))
colnames(x) <- c('val')
x
rownames(x) <- c('a', 'b', 'c')
x

#데이터 프레임 접근

d <- data.frame(x=c(1, 2, 3, 4, 5), y=c(2, 4, 6, 8, 10))

d$x
d[1,]
d[1,2]

d[c(1,3),2]
d[-1,-2]

d[, c("x", "y")]
d[, c("x")]

d[, c("x"), drop=FALSE] #컬럼차원이1이면 데이터타입이 원래대로 돌아간다,디폴트= TRUE


(d <- data.frame(a=1:3, b=4:6, c=7:9)) #다시 생성

d[, names(d) %in% c("b", "c")] #이름으로 인덱스하기

d[, !names(d) %in% c("a")]

#유틸리티 함수, 참고할만한 유용한 함수들

head(
  x,    # 객체
  n=6L  # 반환할 결과 값의 크기, 앞부분 반환
)

tail(
  x,    # 객체
  n=6L  # 반환할 결과 값의 크기, 뒷부분 반환
)

View(
  x,     # 데이터 프레임으로 강제 형 변환한 뒤 뷰어로 볼 데이터
  title  # 뷰어 윈도우의 제목
)

d <- data.frame(x=1:1000)
d

head(d)
tail(d)
View(d)  # 뷰어가 생성된다


############### 09 타입판별

class(c(1, 2))
class(matrix(c(1, 2)))
class(data.frame(x=c(1, 2), y=c(3, 4)))   #class

str(c(1, 2))
str(matrix(c(1,2)))
str(list(c(1,2)))
str(data.frame(x=c(1,2)))                  #str

is.factor(factor(c("m", "f")))
is.numeric(1:5)
is.character(c("a", "b"))
is.data.frame(data.frame(x=1:5))           #is.~


############### 10 타입 변환 



x <- c("a", "b", "c")

as.factor(x)
as.character(as.factor(x))     #??반환한 데이터가 담겨있구나

x <- matrix(1:9, ncol=3)
as.data.frame(x)               # 행렬을 df로 

(x <- data.frame(matrix(c(1, 2, 3, 4), ncol=2)))

data.frame(list(x=c(1, 2), y=c(3, 4)))   #리스트를 df로


as.factor(c("m", "f"))
factor(c("m", "f"), levels=c("m", "f")) #factor를 써야 하는 이유





