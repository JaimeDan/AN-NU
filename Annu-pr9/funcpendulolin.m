function f = funcpendulolin(t,x,par)
    
    l=par(1); 
    g=par(2);
    b=par(3);

    f = [x(2); - 2*b*x(2) - (g/l)*x(1)];
    %f = [x(2); -2*b*x(2) - (g/l)*sin(x(1)) + M ]; % x'
    
    
end

