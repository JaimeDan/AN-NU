function f = funcduffing( t,x,par )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
a = par(1);
f = [x(2); -a*x(2) - x(1)^3 + x(1)];

end

