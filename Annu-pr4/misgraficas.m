%Practica 4
%u=u.';
if size(x0,1) == 1%dimension uno
    then figure(1); plot(t,u(1,:),'r');%r significa en rojo
else
    if size(x0,1) == 2%dimensión dos
        figure(1);
        subplot(2,1,1); plot(t,u(1,:),'r');%r significa en rojo
        subplot(2,1,2); plot(t,u(2,:),'g');%g en verde
        pause(2);
        figure(2);
        plot(u(1,:),u(2,:),'r');
    else 
        if size (x0,1)==3
            figure(1);
            subplot(3,1,1); plot(t,u(1,:),'r');
            subplot(3,1,2); plot(t,u(2,:),'g');
            subplot(3,1,3); plot(t,u(3,:),'b');
            pause(2);
            figure(2);
            plot3(u(1,:),u(2,:),u(3,:),'r');
        end
    end
end
