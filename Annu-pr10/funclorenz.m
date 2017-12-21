function f = funclorenz( t,u,par )
%
    sigm = par(1);
    ro = par(2);
    beta = par(3);

    x=u(1); % u
    y=u(2); % u'
    z=u(3); % u''

    f1 = sigm*(y - x);
    f2 = ro*x - y - x*z;
    f3 = x*y - beta*z;

    f= [f1;f2;f3];
end

