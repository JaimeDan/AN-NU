function f = funcdispnolin( t,x,ffxfy )
%

v= x(2);
w= ffxfy{1}(t,x(1),x(2));
z= x(4);
u= ffxfy{3}(t,x(1),x(2))*x(4) + ffxfy{2}(t,x(1),x(2))*x(3);

f = [v;w;z;u];

% pr27-1
%nO    f=[x(2);2*x(1)^3];

end

