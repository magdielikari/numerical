function [T Y]=RK2(f,a,b,ya,M)
h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
% Este algortimo ejecuta el metodo de Runge-Kutta de segundo orden con los
% parametros libres para escojer el metodos que se desee.
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
% El metodo que se implementa es el siguiente:
%
% RK31:
% 0         | 
% 1/(2*b2)  |  1/(2*b2)
% -------------------------
%                1-b2    b2

b2=input('Teclee valor de b2')
   c1=1/(2*b2); a11=c1;
   b1=1-b2;
T=a:h:b;
Y(1)=ya;
for j=1:M
    k1=feval(f,T(j),Y(j));
    k2=feval(f,T(j)+c1*h,Y(j)+a11*h*k1);
    Y(j+1)=Y(j)+h*(b1*k1+b2*k2);
end
T=T';
Y=Y';