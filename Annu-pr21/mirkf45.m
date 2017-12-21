function [ t,u ] = mirkf45( tini,tfin,N,hmin,TOL,x0,F,par )
% Runge?Kutta? Fehlberg - pr21
% ---ENTRADA
% h0                       % paso inicial
% hmin                     % paso minimo (por ejemplo hmin=10^{-5})
% TOL                      % tolerancia para el error local (por ejemplo 10^{-3})
% ---SALIDA
% H                   % un vector fila de pasos,
% ERROR               % un vector fila de errores,
% rechazo             % el numero de veces que se rechaza el calculo

% ñadir fila de 0s a a?
a = [0,          0,        0,           0,          0,      0;...
    1/4,         0,        0,           0,          0,      0;...
    3/32,       9/32,      0,           0,          0,      0;...
    1932/2197, -7200/2197, 7296/2197,   0,          0,      0;...
    439/216,    -8,     3680/513,       -845/4104,  0,      0;...
    -8/27,      2,      -3544/2565,     1859/4104,  -11/40, 0];
b = [25/216,    0,      1408/2565,      2197/4104,  -1/5,   0];
b2 =[16/135,    0,      6656/12825,     28561/56430, -9/50, 2/55];
c = [0,1/4, 3/8, 12/13, 1, 1/2];%quitarle el primer ecro para que sea igual a a
    
   % se desconocen tam t y u (numero de particiones)
   hmax=0.001; fac=0.9; facmax=1.5;
   
   dim=size(x0,1);
   K=zeros(dim,6);% 6 columas con las 6 Ks
   u=zeros(dim,N*10);
   t=zeros(1,N*10);
   
   u(:,1)=x0;
   rechazo=0;
   
   h=(tfin-tini)/N; t(1)=tini; 
   n=1;
   while t(n)<tfin
        % calcular en un bucle for K(:,j) 
        for s=1:6
            aux=zeros(dim,1);
            for j=1:s-1 
                aux = aux + a(s,j)*K(:,j);
            end
            K(:,s) = F(t(n)+c(s)*h, u(:,n)+h*aux, par);
        end
        % estimar el error ERR;
        %t(n)+h;
        z1= u(:,n)+h*(b(1)*K(1)+b(3)*K(3)+b(4)*K(4)+b(5)*K(5));
        z2= u(:,n)+h*(b2(1)*K(1)+b2(3)*K(3)+b2(4)*K(4)+b2(5)*K(5)+b2(6)*K(6));
        ERR= norm(z1-z2)/h;
        % comparar el error con la tolerancia:
        %  ? si el error es menor que la tolerancia: 
         if ERR<TOL
            % ? definir u(:,n+1), t(n+1); ? actualizar n;
            t(n+1)=t(n)+h; 
            u(:,n+1)=z1; 
            n=n+1;
        %  ? o bien si el paso es menor que hmin;
         else
            if h<hmin % ? dar un mensaje de aviso e interrumpir el programa;
                disp('salida forzada');
                break;
            else rechazo=rechazo+1;%  ? en los restantes casos, actualizar la variable rechazo;
            end
        % finalmente, definimos el paso optimo h para enfectuar el siguiente calculo
         h = min([hmax, h*facmax, h*fac*(TOL/ERR)^(1/4)]); % (?)
         end
         
   end
    
   
    

end

