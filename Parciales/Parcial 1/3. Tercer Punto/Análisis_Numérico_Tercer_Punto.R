library(Rmpfr)

f <- function(x)(x^3 - 2*x^2 + (4/3)*x - (8/27))#Funcion

#Asignar el Intervalo
x0 <- 1.0
x1 <- 0.0

#Por medio del metodo de biseccion se halla el valor de x2
x2 <- (x0 + x1)/2
tol <- 1e-5
#Obtener el numero maximo de iteraciones
N <- (1/log(2))*(log(abs(x0-x1)/tol))

#Metodo de muler 
h1 <- x1-x0
h2 <- x2-x1
d1 <- (f(x1)-f(x0))/h1
d2 <- (f(x2)-f(x1))/h2
a <- (d2-d1)/h2+h1
i <- 0

#Ciclo que se repite hasta el numero de iteraciones
while(i< N){b<-d2+h2*a
D<-(b^2-4*(f(x2)*a))^(1/2)
if (b > 0){E<-b+D}
if (b < 0){E<-b-D}
h <- 2*f(x2)/E
p <- x2+h
if (abs((p-x1)/p)<tol){p
  break}
x0<-x1
x1<-x2
x2<-p
h1<-x1-x0
d1<-(f(x1)-f(x0))/h1
d2<-(f(x2)-f(x1))/h2
a <-(d2-d1)/h2+h1
i<-i+1
}

mpfr(result,168)