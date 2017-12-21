function dx = fundisplin1( t,x,pqr )
%pr24 Summary of this function goes here
%   Detailed explanation goes here
    dx=zeros(2,1);
    dx(1)=x(2);
    dx(2)=feval(pqr{1},t)* x(2)+feval(pqr{2},t)* x(1) + feval(pqr{3},t);


end

