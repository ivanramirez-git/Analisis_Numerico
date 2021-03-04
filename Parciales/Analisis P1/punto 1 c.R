#Algoritmo que le permita sumar los primeros números naturales al cuadrado.
N<-5
i<-0
M<-0
R<-0
S<-0
y<-c(0)
x<-c(0)
n<-c(0)
errorarriba<-c(0)
eaba<-0
errorabajo<-c(0)
eajo<-0
error<-0.1
E<-0
E2<-0
while(i<N+1){
  R<-i
  M<-R*R
  S<-S+M
  E<-0
  E<-(R-error)*(R-error)
  errorabajo[i]<-c(E)
  eajo<-errorabajo[i]+eajo
  E<-0
  E<-(R+error)*(R+error)
  errorarriba[i]<-c(E)
  eaba<-errorarriba[i]+eaba
  y[i]<-c(S)
  x[i]<-c(M)
  n[i]<-c(i)
  i <- i+1
}
plot(n,y,)
#plot(x,y) 


errorpromedio<-(errorarriba[N]+errorabajo[N])/2
errorrelativo<-((errorpromedio-S)/errorpromedio)*100
