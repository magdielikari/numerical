clc
% Este algortimo resuelve una ecuación diferencia de forma sig.
% dy/dx=f(t,y) con y(a)=ya
% en el segmento de a<x<b
% utilizando el algoritmo de euler implicito
% ---------------------------------
% parametros:
% a, b son el segmento de recta donde se integra la edo.
% ya= es la condicion inicial evaluada en a
% f= es una funcion f(t,y) que usuario puede modificar
% redefiniendo la funcion en el fichero g.m 
% (leer las instrucciones en dicho fichero)
f=@g;
dfT=@ht;
dfY=@hy;
a=0;
b=1;
ya=1;
M=100;
%[T Y]=taylor(f,dfT,dfY,a,b,ya,M);
%[T Y]=RK2(f,a,b,ya,M);
%[T Y]=RK3(f,a,b,ya,M);
%[T Y]=RK4(f,a,b,ya,M);
[T Y]=RK5(f,a,b,ya,M);
T
Y
plot(T,Y)

