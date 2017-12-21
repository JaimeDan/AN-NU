%pr23

% Compara las soluciones entre un algoritmo de paso constante y
% un algoritmo de paso adaptativo, con TOL = 10?5.
% Dibuja la diferencia entre la solucion exacta y la aproximada.

%solucion exacta x(t) = exp(? cos(t^2)).

N=1000; par=[];
fun=@funcoscil; x0=1/exp(1); tini=0; tfin=8;

% metodo paso constante
[t,u]=mieuler(tini,tfin,N,x0,fun,par)

% metodo adaptativo
TOL=10^(-5);
hmin=10^(-7);
[t1,u1]=mirkf45(tini,tfin,N,hmin,TOL,x0,fun,par);

% exacta
h=(tfin-tini)/N;
t2=tini:h:tfin;
u2=zeros(1,N+1);
for n=1:N
    u2(n)= exp(-cos(t(n)^2));
end

figure(1);
subplot(3,1,1); plot(t,u(1,:),'r');% r rojo
subplot(3,1,2); plot(t1,u1(1,:),'g');% g verde
subplot(3,1,3); plot(t2,u2(1,:),'b');% b azul
