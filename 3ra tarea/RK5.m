function [T Y]=RK5(f,a,br,ya,h,M)
T=zeros(1,M);
Y=zeros(1,M);
% Este algortimo ejecuta el metodo de Runge-Kutta de 5 orden
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
% RK5:
% 0   | 
% 1/4 | 1/4
% 1/4 | 1/8   1/8   
% 1/2 |  0     0   1/2
% 3/4 | 3/16 -3/8  3/8   9/16   
% 1   | -3/7  8/7  6/7  -12/7   8/7    
% --------------------------------------
%       7/90   0  32/90  12/90 32/90  7/90
c1=1/4;  a11=1/4;
c2=1/4;  a21=1/8;   a22=1/8;   
c3=1/2;  a31=0;     a32=0;    a33=1/2;
c4=3/4;  a41=3/16;  a42=-3/8; a43=3/8;  a44=9/16;   
c5=1;    a51=-3/7;  a52=8/7;  a53=6/7;  a54=-12/7;  a55=8/7;    
b1=7/90; b2=0;      b3=32/90; b4=12/90; b5=32/90;   b6=7/90;
T=a:h:br;
Y(1)=ya;
for j=1:M
    k1=feval(f,T(j),Y(j));
    k2=feval(f,T(j)+c1*h,Y(j)+a11*h*k1);
    k3=feval(f,T(j)+c2*h,Y(j)+a21*h*k1+a22*h*k2);
    k4=feval(f,T(j)+c3*h,Y(j)+a31*h*k1+a32*h*k2+a33*h*k3);
    k5=feval(f,T(j)+c4*h,Y(j)+a41*h*k1+a42*h*k2+a43*h*k4+a44*h*k4);
    k6=feval(f,T(j)+c5*h,Y(j)+a51*h*k1+a52*h*k2+a53*h*k4+a54*h*k4+a55*h*k5);
    Y(j+1)=Y(j)+h*(b1*k1+b2*k2+b3*k3+b4*k4+b5*k5+b6*k6);
end
T=T';
Y=Y';