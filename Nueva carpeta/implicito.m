function [T Y]=implicito(f,a,b,ya,M)
h=(b-a)/M;
delta=0.00001;
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
    t=T(j+1);
    y=Y(j);
    k=newton(f,t,y,ya);
    Y(j+1)=k;
end
T=T';
Y=Y';