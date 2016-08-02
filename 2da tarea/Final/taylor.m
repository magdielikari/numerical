function [T Y]=taylor(f,dfT,dfY,a,b,ya,M)
h=(b-a)/M;
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
   ef=feval(f,T(j),Y(j));
   Y(j+1)=Y(j)+h*(ef+(1/2)*h*(feval(dfT,T(j),Y(j))+feval(dfY,T(j),Y(j))*ef));
end
T=T';
Y=Y';