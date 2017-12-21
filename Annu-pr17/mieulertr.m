function [ t,u ] = mieulertr( tini,tfin,N,x0,F,par )
% Met Predic-Correcc
% predictor: Met Euler (metodo explicito prar predecir z0)
% corrector: Met Trapecio - prden
% Inicializar el met con el de Euler.
    
    h=(tfin-tini)/N; %paso
    t= tini:h:tfin; %vector fila
    
    dim=size(x0,1);
    u=zeros(dim,N+1);
    
    % ini x0
    u(:,1)=x0; % primera col 
    %[t1,u1] = mieuler(tini,t(3),2,x0,F,par)
    %u(:,2)=u1(:,2);
    %u(:,3)=u1(:,3);
    
    % x1..xN
    for n=1:N
        Z = u(:,n) + h*F(t(n),u(:,n),par); % pred
        u(:,n+1) = u(:,n) + h/2 * ( F(t(n),u(:,n),par) + F(t(n+1),Z,par) ); % corr
    end

end

