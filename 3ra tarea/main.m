clc
% Este algortimo resuelve una ecuaci�n diferencia de forma sig.
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
a=0;
b=1;
ya=1;
N=100;
h=(b-a)/N;
M=5;
br=a+M*h;
[T Y]=RK5(f,a,br,ya,h,M);
C=langran(T,Y);
D=polyint(C);
for j=M+2:N+1
    T(j)=a+(j-1)*h;
    Y(j)=0;
end
[T Y]=adams(f,T,Y,D,M);
plot(T,Y)

