% This script implements the trapezoid rule to approximate the integral of

% a function, f.

clc
clear 
f = @(x) cos(x)./sqrt(x); %function to be integrated Ic
%f = @(t) 2*cos(t.^2); 
g = @(x) sin(x)./sqrt(x); %function to be integrated Is
%g = @(t) 2*sin(t.^2);

n = 100;
h = 1/n; %step size
t_samples = 0:h:1;
t_plot = 0:0.01:1;

integral_trap_c = 0;
integral_trap_s = 0;
% Handle i = 1 manually

integral_trap_c = integral_trap_c + sqrt(h)*cos(h)/2;
integral_trap_s = integral_trap_s + sqrt(h)*cos(h)/2;

for   i = 2:(length(t_samples)-1)
    integral_trap_c = integral_trap_c + h*(f(t_samples(i)) + f(t_samples(i+1)))/2;
    integral_trap_s = integral_trap_s + h*(f(t_samples(i)) + f(t_samples(i+1)))/2;
end

display(integral_trap_c);

figure
plot(t_plot,f(t_plot));
hold on

title('Integral Trap C');

plot(t_samples,f(t_samples),'bo');

hold off

 

display(integral_trap_s);

 

figure

plot(t_plot,g(t_plot));

hold on

title('Integral Trap S');

plot(t_samples,g(t_samples),'ro');

hold off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



##
##clc
##clear
##
##f = @(x) cos(x)./sqrt(x); %integrand of Ic
##g = @(x) sin(x)./sqrt(x); %integrand of Is
##n = 100;
##h = 1/n; %step size
##t_samples = 0:h:1;
##t_plot = 0:0.01:1;
##integral_trap_c = 0;
##integral_trap_s = 0;
##%Handle i = 1 manually
##integral_trap_c = integral_trap + sqrt(h)*cos(h)/2;
##integral_trap_s = integral_trap + sqrt(h)*cos(h)/2;
##for i = 2:(length(t_samples)-1)  
##  integral_trap_c = integral_trap_c + h*(f(t_samples(i)) + f(t_samples(i+1)))/2;
##  
##end
##
##
##  
##  
##display(integral_trap_c);
##figure
##plot(t_plot,f(t_plot));
##hold on
##plot(t_samples,f(t_samples),'bo');
##hold off