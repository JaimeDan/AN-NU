%práctica 6
function [t,u]=mirk4(tini,tfin,N,x0,F,par)
%paso 
h=(tfin-tini)/N;

%puntos de mallado
t= tini:h:tfin;

a = [0,0,0,0;1/2,0,0,0;0,1/2,0,0;0,0,1,0];
b = [1/6,2/6,2/6,1/6]; % (1,4)
c = [0,1/2,1/2,1];

%tamaño del vector fila con datos iniciales
dim=size(x0,1);
u=zeros(dim,N+1);
%inicializar solución
u(:,1)=x0;

%%
for i=1:N
    K1 = F(t(i),u(:,i), par);
    K2 = F(t(i)+h/2, u(:,i)+h/2*K1, par);
    K3 = F(t(i)+h/2, u(:,i)+h/2*K2, par);
    K4 = F(t(i)+h, u(:,i)+h*K3, par);
    u(:,i+1) = u(:,i)+h/6 *(K1+2*K2+2*K3+K4);
end
%%

%for i=1:N
%    
%    k=zeros(4,dim); %,4);% (2,4)
%    for j=1:4
%        bucle = zeros(1,dim);
%        for l=1:j
%            bucle = a(j,l)*k(l,:) + bucle;
%        end
%        aux1 = t(i)+c(j)*h;
%        aux2= u(:,i)+bucle';
%        k(j,:) = fun(aux1, aux2, par);
%    end
%    
%    u(:,i+1) = u(:,i) + h.*(b*k)'; % (1,4)*(4,2)
%    % (2,1)
  

end

