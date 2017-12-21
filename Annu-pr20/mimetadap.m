%practica 20
%metodo adaptativo monopaso con estimacion del error en dos pasos sucesivos
%
function [t,u] = mimetadap(tini,tfin,N,Hmin,x0,F,par,met,ord,TOL)
%
    fac = 0.9;
    facmax = 1.5;
    hmax = 0.001;
    hmin= Hmin;
    
    t=zeros(1,N*10);
    dim = size(x0,1);
    u=zeros(dim,N*10);
    
    h=(tfin-tini)/N;
    n=1;
    t(n)=tini;
    u(:,1)=x0;
    while (t(n)<tfin)
        
        [~,u1]=met(t(n),t(n)+h,2,u(:,n),F,par);%
        [~,u2]=met(t(n),t(n)+h,1,u(:,n),F,par);%duda. estimacion del
                                            %error en dos pasos sucesivos

        % estimamos el error local cometido
        Err = (norm (u1(:,3)-u2(:,2)))/h

        if (Err < TOL) % se acepta el paso ya que el error es tolerable
            u(:,n+1)= u1(:,3);
            t(n+1)=t(n)+h;
            n=n+1;
        end
        if (h<hmin)
            S=sprintf('final forzado');
            disp(S);
            break;
        end
        % se adapta h y se repite el proceso
        h=min([hmax,h*facmax,h*fac*(TOL/Err)^(1/ord)])

    end
end
