clc
clear
format compact
disp('Problem 1')
for i = 1:2
    kml = input('Input kml: ');
    mpg = kmlTOmpg(kml);
    fprintf('\nkm/L: %.i mpg: %3.5f\n',kml,mpg)
end
disp('Problem 2')
x1 = [-2.5, 3];
x2 = linspace(-3,4,1000);
y1 = ycalc(x1);
y2 = ycalc(x2);
fprintf('x = %3.2f y = %3.2f\n',x1',y1')
figure(1)
plot(x2,y2)
xlabel('x')
ylabel('y')
title('Problem: 2')
disp('Problem 36')
R = 10;
C = 10^-6;
power = [-2:.1:6];
omega = 10.^power;
RV = rvcal(omega,R,C);
figure(2)
title('Ratio of Magnitudes of Voltage vs. Frequency of Input Signal') 
plot(omega,RV)
xlabel('Frequency of Input Signal (Hz)')
ylabel('Transfer Function')
