par=[];
%fun=@funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; N=1000;
%fun=@funccorazon; x0=[0;2]; tini=0; tfin=2*pi; N=1000;
%%%@funccorazon,[0:0.01:2*pi],[0;2]);

%M=1; l=1; g=9.8; b=0.25;
%par = [M,l,g,b]; fun=@funcpendulo; x0=[pi;0]; tini=0; tfin =10; N=1000;
%par =  [l,g,b]; fun=@funcpendulolin; x0=[pi;0]; tini=0; tfin =10; N=1000;

%%% pr10- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%tini=0; tfin=10; N=1000;

% (x(0), y(0)) = (30, 50) y (x(0), y(0)) = (100, 5000)
%a = 1; b = 1; c = 1; d = 2;
%a=3; b=0.2; c=0.6; d=5;
%a = 0.4; b = 0.01; c = 0.3; d = 0.005;
%par=[a,b,c,d]; fun=@funcdeppresa; x0=[100;5000]; tini=0; tfin=100;

%a=1; b=1; c=1; d=0.2; e=0.4; f=0.0001; par=[a,b,c,d,e,f];fun=@funccompet;

%a= 1; b=1; % a =1..10 %val ini proximos al origen
%x0=[0.1;0.2]; tinic=0; tfin=10; N=1000; a=1; b=1;
%x0=[2;8]; tini=0; tfin=100; N = 4000; a=30; b=1; % pr11
%par = [a,b]; fun=@funcvanderpol; jac=@jacvanderpol; itmax=5;

%a=1; par = [a]; fun=@funcduffing;

%ro=0.1; sigm=10; beta=8/3; par=[sigm,ro,beta]; fun=@funclorenz; x0 = [0;5;75];

%pr8
%intervalo 0 pi/2, con dato inicial x(0) = 0
%para varias elecciones de N = 25, 40, 50, 100...
%fun=@funcecrigida; x0=0; tini=0; tfin=pi/2; N = 50;


%pr12
%fun=@funbelza; x0=[0.25;0.75;0.25]; par=[0.0002,0.0008,5000,0.75];

%pr20
%necesita tini,tfin,N,x0,fun,par

%pr22
%N=1000;
%fun=@func22_1; x0=1; tini=0;tfin=2;
%fun = @func22_2;x0=1;tini=0;tfin=10;

%pr23
fun=@funcoscil; x0=1/exp(1); tini=0; tfin=8; N=1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%pr24 - disparo lineal %%%%%%%%%%%
%N=1000;
%pqr={@(t) 0*t, @(t) 4+0*t, @(t) -4*t};
%tini=0;tfin=1;a=0;b=2;C1=0;C2=0;

%seguir copiando ejemplos para:
%pr25
%cosa={@(t,x,y) 3*y+2*x+3*cos(t),2,3};
%tini=0;tfin=5; a=-2;b=1;C1=0;C2=1;



%pr26 disparo no lineal %%%%%%%%%%%%%% tini,tfin,N,a,b,ffxfy,tol,C1,C2
%los ejemplos los usa en pr27
N=1000; tol=0.005;

% pr27 -1
%exac = @(t) 1/(1+t);
%ffxfy={@(t,x,y) 2*x^3, @(t,x,y) 6*x^2, @(t,x,y) 0*x};
%tini=1;tfin=2; a=1/2;b=1/3;C1=0;C2=0;

% pr27 -2
%exac =  @(t) 1/(3+2*t);
%ffxfy={@(t,x,y) 8*x^3, @(t,x,y)24*x^2, @(t,x,y) 0*x};
%tini=0;tfin=1; a=1/3;b=-2/25;C1=0;C2=1;

%pr27-3 x??(t) = (?tx?(t)+x(t)+t)3 + 1, 1 ? t ? e, x?(1) = 1, x?(e) = 2. 
%Comparar con la solucion exacta x(t) = t ln(t).
%exac=@(t) t*log(t);
%ffxfy={@(t,x,y) (-t*y+x+t)*3,@(t,x,y) 3, @(t,x,y) -3*t};
%tini=1;tfin=exp(1);a=1;C1=1; b=exp(1);C2=0;%b=2;C2=1;


% pr28
%[2*sen(t^2) + 8*t^2]*x(t) - 4*t^2*x(t) log(x(t)) + 2*t *sin(t^2)x'(t)
%x(0) = e, x(?10,5?) = e2.
%Sabiendo que la solucio ?n exacta es solex = exp(2 ? cos(t2))
exac=@(t) exp(2-cos(t^2));
ffxfy = {@(t,x,y) (2*sin(t^2) + 8*t^2)*x...
          - 4*t^2*x* log(x) + 2*t *sin(t^2)*y,...
          @(t,x,y) (2*sin(t^2) + 8*t^2)-4*t^2*(log(x)+1),...
          @(t,x,y) 2*t*sin(t*t)};
 tini=0;tfin=(10.5*pi)^(1/2);a=exp(1);b=exp(2);
