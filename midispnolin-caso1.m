function [t,u] = midispnolin( tini,tfin,N,a,b,ffxfy, tol,C1,C2 )
%UNTITLED22 Summary of this function goes here
%   Detailed explanation goes here
    %H(s)=v(T,s)=b
    %metodo de newton F(s)=H(s)-b
    %(puntofijo)
    fun=@funcdispnolin;

    s=(b-a)/(tfin-tini);
    Fsk=tol;

    while ( Fsk >= tol)
        x0 = [a;s;0;1];

        [t1,v]=mirk4(tini,tfin,N,x0,fun,ffxfy);

        %x02=[a;s];
        %[t2,v]=mirk4(tini,tfin,N,x02,ffxfy{1},[]);%f
        %dependencia v y z
        %p y q dependen de f y v
        %f3=ffxfy{3};
        %f2=ffxfy{2};
        %pqr={@(t) f3(t,v), @(t) f2(t,v) , @(t) 0*t }

        %fun=@fundisplin2;
        %x0=[0;1];
        %[t1,z]=mirk4(tini,tfin,N,x0,fun,pqr);%hay que poner bien p y q

        s=s-(v(1,N+1)-b)/v(3,N+1);

        Fsk=v(1,N+1)-b;
    end
    t=t1;
    u(1,:)=v(1,:);
    u(2,:)=v(3,:);
end
