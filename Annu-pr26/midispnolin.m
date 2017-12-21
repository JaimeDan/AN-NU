function [t,u] = midispnolin( tini,tfin,N,a,b,ffxfy, tol,C1,C2 )
%

    % H(s)=v(T,s)=b
    % metodo de newton F(s)=H(s)-b
    % (puntofijo)
    
    Fsk=tol;
    fun=@funcdispnolin;
    
    % pendiente inicial
    if (C1==0 && C2==0) s(1)=(b-a)/(tfin-tini); end % (x(T)-x(t0))/(T-t0)=S; S=x'(t0)
    if (C1==0 && C2~=0) s(1) = b; end %(x(t0),x'(T))  % x'(t0)=x'(T)  % (S-x(t0))/(T-t0)=x'(t0); S=x(T)
    if (C1~=0 && C2==0) s(1) = -a*(tfin-tini)+b; end %(x'(t0),x(T)) % (x(T)-S)/(T-t0)=x'(t0); S=x(t0)
    if (C1~=0 && C2~=0) s(1) = (b-a)/(tfin-tini); end %(x'(to),x'(T)) % (x'(T)-x'(t0))/(T-t0)=S; S=x''(t0)
        
    if (C1==0) 
        [t1,v]=mirk4(tini,tfin,N,[a;s(1);0;1],fun,ffxfy);
        s(2) =s(1)+(b-v(1,N+1))/(tfin-tini);
    else
        [t1,v]=mirk4(tini,tfin,N,[s(1);a;1;0],fun,ffxfy);
        s(2) =s(1)+(b-v(2,N+1))/(tfin-tini);
    end
    
    
    n=2;
    while ( Fsk >= tol)
        
        fun=@funcdispnolin;
        if (C1==0) 
             x0 = [a;s(n);0;1];
        else x0 = [s(n);a;1;0];
        end
        
        v1 =v;
        [t1,v]=mirk4(tini,tfin,N,x0,fun,ffxfy);
        
       
        
        if (C2==0)
             %%%
             s(n+1) = s(n)-(v(1,N+1)-b)/v(3,N+1);% newton

             %Fs = v(1,N+1)-b; %F(s_n)
             %Fs1 = v1(1,N+1)-b; %F(s_n)-F(s_n-1)
             %s(n+1) = s(n)-Fs*(s(n)-s(n-1))/(Fs-Fs1); % secante
             %%% 
             Fsk=v(1,N+1)-b
        else
             %%%
             s(n+1) = s(n)-(v(2,N+1)-b)/v(3,N+1);% newton

             %Fs = v(2,N+1)-b; %F(s_n)
             %Fs1 = v1(2,N+1)-b; %F(s_n)-F(s_n-1)
             %s(n+1) = s(n)-Fs*(s(n)-s(n-1))/(Fs-Fs1); % secante
             %%% 
             Fsk=v(2,N+1)-b
        end;
        n=n+1;
    end
    t=t1;
    u(1,:)=v(1,:);
    u(2,:)=v(3,:);
end

