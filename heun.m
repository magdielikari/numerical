function [T Y]=implicito(f,a,b,ya,M)
h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
for j=1:M
    Y(j+1)=(feval(f,T(j),Y(j)))/(1-h);
end
T=T';
Y=Y';
