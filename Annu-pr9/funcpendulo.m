function f = funcpendulo(t,x,par) 


%%% como se hace esto?? como añado la t?
% como comparo con la version lineal? la x es una funcion, como en los
% ejerc anteriores??
% donde entra R-K??



    M=par(1);
    l=par(2); 
    g=par(3);
    b=par(4);
   
    %u = zeros()
    
    %%%
    f = [x(2); -2*b*x(2) - (g/l)*sin(x(1)) + M ]; % x',x''

     % intervalo [0,10]

end