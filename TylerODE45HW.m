clear
clc

t0 = -10; 
tmax = 3;
%First run
%x10 = 0.040241238486443190689;
%x20 = 0.99626504413279005590;
%Second run
x10 = 0.0
x20 = 1.0;

[t,xNS]=ode45('F',[t0,tmax],[x10,x20]);
[t,xNS(:,1)] %displays x'(t)

figure
plot(t,xNS(:,1))
%semilogy(t,xNS(:,1))
title('x`(t)')
xlabel('Time (seconds)')
ylabel('Distance (meters)')

