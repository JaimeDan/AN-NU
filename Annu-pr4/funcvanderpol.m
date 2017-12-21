%Práctica 4, ejercicio 3
%después:
%figure(1)
%subplot(2,1,1)
%plot(t,u(1,:))
%subplot(2,1,2)
%plot(t,u(2,:))
%figure(2)
%plot(u(1,:),u(2,:))
function f=funcvanderpol(t,x,par)
%f=[]%opcional
%x''+(x^2-1)x'+x = 0, t in [0,10],x(0) = 0, x'(0) = 0.2
%x'=y
%y'=-(x^2-1)y-x
f=[x(2);-(x(1)^2-1)*x(2)-x(1)]
    
