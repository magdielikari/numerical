function z=newton(f,t,y,yo) 
N=10;
delta=0.001;
z0=yo;
for i=1:N
    fk=y+feval(f,t,z0,0)-z0;
    dfk=feval(f,t,z0,1);
    z1=z0-fk/dfk;
    epsilon=z1-z0;
    %if(epsilon<delta) 
    %    z=z1; 
    %    break
    %end
    z0=z1;
end
z=z1;