########### 수치형(실수형vs정수형)

a<- 1 ; a
b<- 1.5 ; b

is.double(a); is.double(b)     #실수형인가? 그렇다
is.integer(a); is.integer(b)   #정수형인가? 아니다, a는 실수형으로 저장(디폴트값)
is.numeric(a); is.numeric(b)   #수치형인가? 그렇다

as.integer(a);is.integer(a);is.double(a) #a를정수형으로바꾸고 다시 확인, 맞다.

a <- as.integer(a); a #a를 정수형으로 바꿈
b <- as.integer(b); b #b를 정수형으로 바꿈

is.double(a); is.double(b)
is.integer(a); is.integer(b)  #다시확인해보면 a,b 둘다 정수형이 돼 있음.

########## 범주형 

grade <- c('c0','c+','b0','a+','a0','b+'); grade 
factor(grade)                          #디폴트는 order=F
factor(grade, order=T)                #자료순서대로 순위
 
lev <- c('c0','c+','b0','b+','a0','a+')   #자료순위를 저장하고
factor(grade,levels=lev)                  
factor(grade,levels=lev, order=T)         #자료순위를 정해줌


########### 벡터(sequence 함수, 등차수열 생성)

x <- c(1,2,c(3,4,5));x  #   ===   x <- c(1,2,3,4,5) 

x[c(-2,-5)]             # 해당 원소를 제외하고 출력(인덱스)

length(x)               # 길이는 5
NROW(x)                 # 길이는 5

x <- seq(1,10)
x <- seq(10)
x <- 1:10               # 셋다 같은 의미 


y <- seq(1,10, by=2)           #등차 설정
z <- seq(1,10, length=4)       #길이 설정
a <- seq(1,10,by=2,length=5)   #맞는 말이어도 두개는 동시에 못씀


#rep함수

x <- rep(c(1,2), times=2)  # 1 2 1 2
y <- rep(c(1,2), each=2)   # 1 1 2 2


############ 수치연산 

a <- 1;a 
b <-2; b
c <- 3 ; c
 
a + b  -c
a*c
a/c
b %% c
b%/%c
a^b
exp(2)

log(1)
log(2,base=2)
log2(2)

pi
sin(pi)  #roundoff 오류, 결국 0이다.  
cos(pi)
tan(pi)

############ 논리연산

a <- T; a
b <- F; b

a & b
a & a
b & b      # 곱연산 

a|b
a|a
b|b        # 합연산

c <- c(T,T); c
d <- c(F,T); d

c & d
c | d
c && d
c || d     # 첫번째 원소끼리 계산

############ 비교연산자

a <- 1;a
b <- 2;b
c <- 1;c

a > b
a==c
a!=b

c <- c(1,2);c
d <- c(2,2);d

c<d
c==d
c!=d

all(c==d)   # 모두 같냐?
any(c!=d)   # 하나라도 다르냐?

############ 벡터연산, 같은길이를 연산해야한다

x <- c(1,2,3,4,5);x

x/2
x+2
x-2
x*2


y <- c(1,2,3,4,4);y

x+y
x*y
x/y
x%%y
x%/%y
x^y

exp(x)
sin(x)

sum(x)
mean(x)
sd(x)
var(x)
min(x); max(x)
summary(x)

###########행렬의 연산

X <- matrix(1:9,3,3,T);X

X+1
X-1
X/1
X%%2
X%/%2

Y <- matrix(rep(2,times=9),3,3,T); Y 

X+Y
X-Y
X*Y       # 일반적인 행렬의 곱은 X %*% Y 이다. 주의할 것 .!
X/Y
X%%Y
X%/%Y


t(X)      # 전치행렬, 대각선을 기준으로 성분의 위치를 바꾼다

solve(X)  # 역행렬, X는 역행렬을 구할 수 없는 행렬, 납작해지는구나.

nrow(X)                 # 행렬에만 쓸 수 있는 함수
ncol(X)
NROW(X)
dim(X)

rownames(X)                 
colnames(X)
dimnames(X)              #행과 열에 이름이 무엇인가?


rownames(X)<- c('r1','r2','r3');X

















