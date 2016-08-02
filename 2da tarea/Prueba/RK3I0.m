function [T Y]=RK3I0(f,a,b,ya,M)
h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
    k1=feval(f,T(j),Y(j));
    k2=feval(f,T(j)+(1/2)*h,Y(j)+(1/2)*h*k1);
    k3=feval(f,T(j)+h,Y(j)-h*k1+2*h*k2);
    Y(j+1)=Y(j)+(1/6)*h*(k1+4*k2+k3);
end
T=T';
Y=Y';