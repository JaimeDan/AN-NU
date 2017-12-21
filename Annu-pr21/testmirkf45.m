% mirkf45 - pr21
% Runge-Kutta-Fehlberg

TOL=0.001;
hmin=10^(-5);

mispracticas
[t,u] = mirkf45(tini,tfin,N,hmin,TOL,x0,fun,par);
%u=u.'; 
misgraficas