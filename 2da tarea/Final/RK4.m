function [T Y]=RK4(f,a,b,ya,M)
h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
% Este algortimo ejecuta el metodo de Runge-Kutta de cuarto orden con 2
% esquemas distintos
%
% Se entiende por esquema los coeficientes que se hallan al deducir el 
% metodo RK, el cual de forma estandar se escribe de forma estandar con
% el diagrama de Butcher es cual se describe a continuacion
%
% c | A
% --------
%     b^t
% Se debe entender c y b ambos vectores y A una matriz de dimensiones
% correspondientes.
%
% El primer metodo que se implementa es el siguiente:
%
% RK41:
%
% 0   | 
% 1/2 | 1/2
% 1/2 |  0  1/2
% 1   |  0   0   1
% ---------------------
%       1/6 1/3 1/3 1/6
%
% El cual se puede ejecutar tecleando la opcion 1 al inicio de programa. El
% siguiente metodo se ejecuta con la opcion 2
%
% RK42:
%
% 0   | 
% 1/4 | 1/4
% 1/2 |  0  1/2   
% 1   |  1  -2   2 
% ---------------------
%       1/6  0  2/3 1/6

q=input('Teclee el metodo de RK3 a desea ejecutar')
if(q==1)
 c1=1/2;  a11=1/2;
 c2=1/2;  a21=0;   a22=1/2;
 c3=1;    a31=0;   a32=0;   a33=1;
 b1=1/6;  b2=1/3;  b3=1/3;  b4=1/6;
elseif(q==2)
 c1=1/4;  a11=1/4;
 c2=1/2;  a21=0;  a22=1/2;   
 c3=1,    a31=1;  a32=-2;   a33=2; 
 b1=1/6;  b2=0;   b3=2/3;   b4=1/6;
elseif ((q~=1)&(q~=2))
    disp('Opci�n invalida')
    return
end
T=a:h:b;
Y(1)=ya;
for j=1:M
    k1=feval(f,T(j),Y(j));
    k2=feval(f,T(j)+c1*h,Y(j)+a11*h*k1);
    k3=feval(f,T(j)+c2*h,Y(j)+a21*h*k1+a22*h*k2);
    k4=feval(f,T(j)+c3*h,Y(j)+a31*h*k1+a32*h*k2+a33*h*k3);
    Y(j+1)=Y(j)+h*(b1*k1+b2*k2+b3*k3+b4*k4);
end
T=T';
Y=Y';