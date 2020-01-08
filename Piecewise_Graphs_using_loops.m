clc
clear
format compact
close all

x = [0:0.01:6];
for i = [1:601] %index for x and y
    if (x(i)<=2)
        y(i) = x(i)^2; %calculates y if x <=2
    elseif ((x(i)>2)&&(x(i)<=4))
        y(i) = -1.5*x(i)^2+9.5*x(i)-9; %calculates y if 2 < x <= 4
    elseif ((x(i)>4)&&(x(i)<=6))
        y(i) = -2.5*x(i)+15; %calculates y if 4 < x <= 6
    end
end
plot(x,y)