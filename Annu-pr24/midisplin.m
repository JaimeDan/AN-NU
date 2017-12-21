%practica 24
function [t,u] = midisplin(pqr,tini,tfin,N,a,b,C1,C2)
   fun = @fundisplin1;%(t,x,pqr)
   fun2 = @fundisplin2;
   if (C1==0 && C2==0)
       %los dos valen 0
       [t1,u1] = mirk4(tini,tfin,N,[a;0],fun,pqr); %v1
       [t2,u2] = mirk4(tini,tfin,N,[0;1],fun2,pqr);%v2
       t=t1;
       if (u2(1,N+1)~=0)
           s=b-u1(1,N+1);
           s=s/(u2(1,N+1));
           u=u1+s*u2;
       else
           if (u1(1,N+1)==b)
               %inf soluciones
               disp('infinitas soluciones');
               u=u1+u2;%por ejemplo esta
           else
               disp('no hay solucion');
           end
       end
   else
       if (C1==1 && C2==0)
           [t1,u1] = mirk4(tini,tfin,N,[0;a],fun,pqr);
           [t2,u2] = mirk4(tini,tfin,N,[1;0],fun,pqr);
           t=t1;
           if (u2(1,N+1)~=0)
               s=b-u1(1,N+1);
               s=s/(u2(1,N+1));
               u=u1+s*u2;
           else
               if (u1(:,N+1)==b)
                   %inf soluciones
                   disp('infinitas soluciones');
                   u=u1+u2;%por ejemplo esta
               else
                   disp('no hay solucion');
               end
           end
       else 
           if(C1==0 && C2 == 1)
               [t1,u1] = mirk4(tini,tfin,N,[a;0],fun,pqr); %v1
               [t2,u2] = mirk4(tini,tfin,N,[0;1],fun2,pqr);%v2
               t=t1;
               if (u2(2,N+1)~=0)
                   s=b-u1(2,N+1);
                   s=s/(u2(2,N+1));
                   u=u1+s*u2;
               else
                   if (u1(2,N+1)==b)
                       %inf soluciones
                       disp('infinitas soluciones');
                       u=u1+u2;%por ejemplo esta
                   else
                       disp('no hay solucion');
                   end
               end
           else 
               if (C1==1 && C2==1)
                   [t1,u1] = mirk4(tini,tfin,N,[0;a],fun,pqr);
                   [t2,u2] = mirk4(tini,tfin,N,[1;0],fun,pqr);
                   t=t1;
                   if (u2(2,N+1)~=0)
                       s=b-u1(2,N+1);
                       s=s/(u2(2,N+1));
                       u=u1+s*u2;
                   else
                       if (u1(2,N+1)==b)
                           %inf soluciones
                           disp('infinitas soluciones');
                           u=u1+u2;%por ejemplo esta
                       else
                           disp('no hay solucion');
                       end
                   end
               end%end c1=1 y c2 = 2
           end
       end
   end
end
