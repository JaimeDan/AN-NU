%%% Meto Adams-Bashforth de orden 4
function [ t,u ] = miab4( tini,tfin,N,x0,F,par )

%paso 
h = (tfin-tini)/N;

%puntos de mallado
t = tini:h:tfin;

%tamaño del vector fila con datos iniciales
dim = size(x0,1);
u = zeros(dim,N+1);

%inicializar solución (x0..x3)
u(:,1) = x0;

[t1,u1] = mirk4(tini,t(4),3,x0,F,par)
u(:,2)=u1(:,2);
u(:,3)=u1(:,3);
u(:,4)=u1(:,4);

for k=4:N % (x4..xN)
    u(:,k+1) = u(:,k) + (1/24)*h*( 55*F(t(k),u(:,k),par) ...
        -59*F(t(k-1),u(:,k-1),par) + 37*F(t(k-2),u(:,k-2),par)...
        -9*F(t(k-3),u(:,k-3),par));

end

end
