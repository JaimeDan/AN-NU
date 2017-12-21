function [t,u]=mieuler(tini,tfin,N,x0,F,par)
    % inic
    h=(tfin-tini)/N; %paso
    t=zeros(1,N+1);
    t(1)=tini;
    
    for i=2:N+1
        t(i) = i*h + tini;
    end % t=[tini:h:tfin]'; %vector columna
    
    nfilas=size(x0,1);
    u=zeros(nfilas,N+1);
    u(:,1)=x0; % primera col 
    
    for i=1:N
        u(:,i+1)=u(:,i)+h*F(t(i),u(:,i));
    end
end