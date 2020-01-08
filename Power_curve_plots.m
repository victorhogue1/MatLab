clc
clear
format compact
close all

x = [0:50];
y0 = 0*x;  %y0 = zeros(51) was glitching on the legend
y2 = x.^2-50*x+400;
y3 = (1/25)*x.^3-3*x.^2+59*x-229;

hold on
plot(x,y0)
plot(x,y2,'--g')
plot(x,y3,':r')
title('Power curve plots.m')
ylabel('y(x)')
xlabel('x')
legend('y0','y2','y3','location','North')
hold off