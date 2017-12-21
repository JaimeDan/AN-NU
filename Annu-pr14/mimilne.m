function [ t,u ] = mimilne( tini,tfin,N,x0,fun,par )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

%paso
 h = (tfin-tini)/N;
 
 %mallado
 t=tini:h:tfin;
 
 %tamaño datos iniciales
 dim=size(x0,1);
 u=zeros(dim,N+1);
 
 %inicializar solucion
 u(:,1)=x0;
 [t1,u1] = mirk4(tini,t(4),3,x0,fun,par);
 u(:,2)=u1(:,2);
 u(:,3)=u1(:,3);
 u(:,4)=u1(:,4);
 for i=4:N
    u(:,i+1)=u(:,i-3)+4*h/3*(2*fun(t(i),u(:,i),par)-fun(t(i-1),u(:,i-1),par)+...
        2*fun(t(i-2),u(:,i-2),par));
 end
 
 
end

