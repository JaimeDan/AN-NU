function [ t,u ] = miab4am3( tini,tfin,N,x0,F,par )
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
%predictor corrector, pred ab4 corrector am3, inicializar con rk4

    h=(tfin-tini)/N; %paso
    t = tini:h:tfin; %vector fila
    
    dim = size(x0,1);
    u=zeros(dim,N+1);
    
    %init x0
    u(:,1)=x0; %primera columna
    [t1,u1] = mirk4(tini,t(4),3,x0,F,par);
    u(:,2)=u1(:,2);
    u(:,3)=u1(:,3);
    u(:,4)=u1(:,4);
    
    for k=4:N
        Z = u(:,k) + (1/24)*h*( 55*F(t(k),u(:,k),par) ...
        -59*F(t(k-1),u(:,k-1),par) + 37*F(t(k-2),u(:,k-2),par)...
        -9*F(t(k-3),u(:,k-3),par)); %predictor ab4
        u(:,k+1) = u(:,k) + h/2 * (F(t(k),u(:,k),par)+...
            F(t(k+1),Z,par));
    end
    
end

