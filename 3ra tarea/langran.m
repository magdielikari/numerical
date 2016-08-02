function C=langran(X,Y)
% Datos
%    - X es un vector que contine la lista de abscisas 
%    - Y es un vector que contien la lista de ordenadas
% Resultados
%    - C es la matriz que contiene los coeficientes del
% polinomio interpolador de Langrange  
%    - L es la matriz que contiene los coeficientes de
% los polinomios coeficientes de Lagrange
w=length(X);
n=w-1;
L=zeros(w,w);
% Formación de los polinomios coeficientes de Lagrange
for k=1:n+1
    V=1;
    for j=1:n+1
        if k~=j
            V=conv(V,poly(X(j)))/(X(k)-X(j));
        end
    end
    L(k,:)=V;
end
%  Calculo de los coeficientes del polinomio
%  interpolador de Lagrange
C=Y'*L;