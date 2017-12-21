%practica 20 testmimetadap
mispracticas;
met = @mieuler;
%met = @mirk4;
ord=1;
tol=(10^(-3));
%

[t,u]=mimetadap(tini,tfin,N,hmin,x0,fun,par,met,ord,tol);
%u=u.';

%t vector fila: 1 fila, N+1 col
%u matriz: 2 filas, N+1 col
%figure(1);
%plot(t,'r');
misgraficas;
