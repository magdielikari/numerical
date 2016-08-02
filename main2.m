clc
f=@hiperbola;
a=0;
b=1;
ya=1;
M=100;
 [T Y]=euler2(f,a,b,ya,M);
plot(T,Y)