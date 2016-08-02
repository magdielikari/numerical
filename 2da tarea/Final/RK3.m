function [T Y]=RK3(f,a,b,ya,M)
h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
% Este algortimo ejecuta el metodo de Runge-Kutta de tercer orden con 2
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
% RK31:
% 0   | 
% 2/3 | 2/3
% 2/3 | 1/3 1/3 
% -----------------
%      1/4  0  3/4
%
% El cual se puede ejecutar tecleando la opcion 1 al inicio de programa. El
% siguiente metodo se ejecuta con la opcion 2
%
% RK32:
% 0   | 
% 1/2 | 1/2
% 1   | -1   2
% ------------------
%       1/6  2/3 1/6
q=input('Teclee el metodo de RK3 a desea ejecutar')
if(q==1)
    c1=2/3; a11=2/3;
    c2=2/3; a21=1/3; a22=1/3; 
    b1=1/4;  b2=0;  b3=3/4;
elseif(q==2)
    c1=1/2; a11=1/2;
    c2=1; a21=-1; a22=2; 
    b1=1/6;  b2=2/3;  b3=1/6;
elseif ((q~=1)&(q~=2))
    disp('Opción invalida')
    return
end
T=a:h:b;
Y(1)=ya;
for j=1:M
    k1=feval(f,T(j),Y(j));
    k2=feval(f,T(j)+c1*h,Y(j)+a11*h*k1);
    k3=feval(f,T(j)+c2*h,Y(j)+a21*h*k1+a22*h*k2);
    Y(j+1)=Y(j)+h*(b1*k1+b2*k2+b3*k3);
end
T=T';
Y=Y';