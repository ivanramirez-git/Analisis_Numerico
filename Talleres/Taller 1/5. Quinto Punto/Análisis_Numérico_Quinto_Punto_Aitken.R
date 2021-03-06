library(Rmpfr)

mimuller <- function(){
  f <- function(x)((x^3) - 2*x -5)
  x0 <-  0.0
  x1 <-  3.0
  x2 <- (x0 + x1)/2
  tol <- 1e-32
  
  # Obtenemos el numero maximo de iteraciones
  N <- (1/log(2))*(log(abs(x0-x1)/tol))
  iniciales<- c()
  h1 <- x1-x0
  h2 <- x2-x1
  d1 <- (f(x1)-f(x0))/h1
  d2 <- (f(x2)-f(x1))/h2
  a <- (d2-d1)/h2+h1
  i <- 0
  while(i< N){b<-d2+h2*a
  D<-(b^2-4*(f(x2)*a))^(1/2)
  if (b > 0){E<-b+D}
  if (b < 0){E<-b-D}
  h <- 2*f(x2)/E
  p <- x2+h
  iniciales <- c(iniciales, p)
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
  iniciales <- c(iniciales,i)
  return (iniciales)
}

Datos <- mimuller()

p0 = Datos[1]
p1 = Datos[2]
p2 = Datos[2]

i <- Datos[length(Datos)]
Datos[-(length(Datos))]
valor = c()

g = 2
iteraciones = 0; #Contador de iteraciones
for(k in Datos[4:(length(Datos))]-2){ # Ciclo que se repite por la cantidad de datos del vector
  valor = c(valor ,(p2-(((p2-p1)*(p2-p1))/(p2-(2*p1)+p0))))   # terminos del polinomio propuesto.
  p0 =Datos[g]
  p1 =Datos[g+1]
  p2=Datos[g+2]
  g=g+1
  iteraciones = iteraciones + 1
  print(valor)
}

cat ("El n�mero de iteraciones realizadas en el m�todo Muller son: ", i, "\n")
cat ("El n�mero de iteraciones realizadas en el m�todo Aitken son: ", iteraciones)

plot(Datos,
     ylim = c(0, 3), # Eje Y desde 0 hasta 1
     xlim = c(1, 10), type="o", col="#fc0345", lwd=1.5,xlab="iteraci�n",ylab="", cex.axis= 0.8, cex.lab= 0.8) # Eje X desde 1 hasta 8
title(main = "M�ller y Aitken: x� - 2x -5", font.main=3)
lines(valor, type="b",col="#0377fc")
legend("bottomright",col=c("#fc0345","#0377fc"),legend =c("Muller","Aitken"), lwd=2, bty = "n")

mpfr(p0,168)

