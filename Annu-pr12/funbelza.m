function f = funbelza( t,x,par )
%Practica12 Summary of this function goes here
%   Detailed explanation goes here
a=par(1);
b=par(2);
c=par(3);
d=par(4);
x1=x(1);
x2=x(2);
x3=x(3);
f1 = a*(x2-x1*x2+x1-b*x1^2);
f2 = 1/a*(c*x3-x2-x1*x2);
f3 = d*(x1-x3);
f=[f1,f2,f3];
end

