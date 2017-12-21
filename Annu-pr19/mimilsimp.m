function [ t,u ] = mimilsimp( tini,tfin,N,x0,F,par )
% predictor: Met Milne de 4 pasos 
% corrector el Met Simpson de 2 pasos. 
% Inicializa con Met Runge-Kutta de orden 4. (ficheros: mimilsimp.m y testmimilsimp.m)


% MILNE [4 pasos]
% u[I+1] = u[I-3] + 4h/3 * (2 f[I-2] - f[I-2] + 2 f[I-2])
% SIMPSON [2 pasos]
% u[I] = u[I-2] + h/3 * (f[I] + 4 f[I-1] + f[I-2])
    h=(tfin-tini)/N; %paso
    t= tini:h:tfin; %vector fila
    
    dim=size(x0,1);
    u=zeros(dim,N+1);
    
    % ini x0..x3
    u(:,1)=x0
    [t1,u1] = mirk4(tini,t(4),3,x0,F,par)
    u(:,2)=u1(:,2)
    u(:,3)=u1(:,3)
    u(:,4)=u1(:,4)
     
     % x4..xN
     for i=1:N-3
         %u[I+1] = u[I-3] + 4h/3 * (2 f[I] - f[I-1] + 2 f[I-2])
        Z = u(:,i) + 4/3*h*( ...
            2*F(t(i+3),u(:,i+3),par) - F(t(i+2),u(:,i+2),par) + 2*F(t(i+1),u(:,i+1),par) ); % pred (milne)
      
        
        %u[I+1] = u[I-1] + h/3 * (f[I+1] + 4 f[I] + f[I-1])
        u(:,i+4) = u(:,i+2) + h/3 * ...
            ( F(t(i+4),Z,par) + 4*F(t(i+3),u(:,i+3),par) + F(t(i+2),u(:,i+2),par) ); % corr (simp)
     end


end

