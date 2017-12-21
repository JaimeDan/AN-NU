function y = funcoscil( t,x,par )
% pr23
% x'(t) = 2t sen(t2)x(t), x(0) = 1/e,  t ? (0,8)
% solucion exacta x(t) = exp(? cos(t2)).

y = 2*t*sin(t^2)*x;

end

