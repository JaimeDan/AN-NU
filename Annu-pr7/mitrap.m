function [t,u,numfun] = mitrap( tini,tfin,N,x0,F,jac,par,itmax )
    % pr7
    
    h=(tfin-tini)/N; % paso
    t= tini:h:tfin; % vector fila

    numfun = 0;
    
    dim=size(x0,1);
    u=zeros(dim,N+1);
    u(:,1)=x0; % primera col 
    
    z = zeros(dim,itmax); % itmax columnas
    
    for n = 1:N
        %u(n+1) = u(n) + h/2 * ( F(t(n),u(n)) + F(t(n+1),u(n+1)) ); % implicito
        % inicializar met newton
        z(:,1) =  u(:,n); % aprox de u(n+1)
        %w % error
        j = 1; % num de iteraciones
        cond = true;
        while cond 
            % met de newton para resolver la ec implicita z = ff(h, x, z)
            G = z(:,j) - ( u(:,n) + h/2*F(t(n),u(:,n),par) + h/2*F(t(n+1),z(:,j),par) );
            DG = eye(dim) - h/2*jac(t(n+1),z(:,j),par);
            w = DG \ G %% DG*w = G
            z(:,j+1) = z(:,j)-w;
            numfun = numfun+2;
            j = j+1;
            cond = norm(w)>h^3 && j<itmax;
        end
        u(:,n+1)=z(:,j);
        
    end

end

