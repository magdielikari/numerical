function z= g(t,y,c)
% funcion f(t,y) a integra.
% para cambiar la definicion de la funcion 
% modifique "solo el lado derecho de la siguiente edo"
% recuerde que las variables son t e y
% no olvide guardar los cambios

syms y;
zz=t*y;
w1=sym('w(y)');
w=diff(w1,y);
if (c==0) z=zz;
else z=w; 
end
%z=double(w);
