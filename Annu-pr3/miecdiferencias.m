function x = miecdiferencias(x0,x1,N)

    % inicializar
    x = zeros(1, N + 1); 
    x(1) = x0;
    x(2) = x1;
    F = @funcecdif;

    for I = 1 : N - 1
        z = [x(I), x(I + 1)];
        x(I + 2) = feval(F, z);
    end

end

