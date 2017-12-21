%pr27
mispracticas;% tini,tfin,N,a,b,ffxfy, tol,C1,C2 
[t,u]=midispnolin(tini,tfin,N,a,b,ffxfy,tol,C1,C2)
x0=u(:,1);
misgraficas;

% exacta
h=(tfin-tini)/N;
t2=tini:h:tfin;
u2=zeros(1,N+1);
for n=1:N
    u2(n)= exac(t(n));
end

figure(3);
subplot(2,1,1); plot(t,u2(1,:),'b');% r rojo
