function [T Y]=RK3II(f,a,b,ya,M)
h=(b-a)/M;
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
    
end
T=T';
Y=Y';