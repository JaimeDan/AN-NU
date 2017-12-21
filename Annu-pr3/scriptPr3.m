
N = 40;
x0 = 1;
x1 = 1/3;

x=miecdiferencias(x0,x1,N);

% salida por consola
x
% grafico
plot(x)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    COMPROBACION CON LA SOLUCION REAL
% Inicializamos el vector de comprobación
u = zeros(1, N + 1); 

% Hallamos los valores de alfa y beta
aux1 = [1, 1; 1/3, 3];
aux2 = [x(1); x(2)];
aux3 = aux1 \ aux2;
alfa = aux3(1)
beta = aux3(2)
clear aux1;
clear aux2;
clear aux3;
    
% Hallamos los valores reales [± aprx]
for I = 1 : N + 1
    u(I) = (((1/3) ^ (I - 1)) * alfa) + ((3 ^ (I - 1)) * beta);
end

% Mostramos la solucion real y su aproximada
plot(u,'r*') 
hold off


% Vector de errores cometidos
error = abs(x - u)

%ERROR EN EL ÚLTIMO x(I) CALCULADO
%error = abs(x(N + 1) - u(N + 1))


%%%%    OBSERVACIONES:
%           beta = 0 >>> la solucion real depende de alfa; si no, tiende a
%           infinito. La solución aproximada siempre tiende a infinito por
%           los errores que arrastramos [N -> infinito ==> Error ->
%           Infinito].
%           alfa = 0 >>> la solución real depende solo de beta [y los
%           valores iniciales]; si no, si beta es cero, tiende a cero.
%