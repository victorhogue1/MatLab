%Part One of Project Three 

c = @(x) cos(x)./sqrt(x); %integrand of Ic
s = @(x) sin(x)./sqrt(x); %integrand of Is
n = 100;
h = 1/n; %step size
t_samples = 0:h:1;
t_plot = 0:0.01:1;
integral_trap_c(1) = 0;
integral_trap_s(1) = 0;
%Do i=1 separately, then add it in the loop.
integral_trap_c(1) = sqrt(h)*cos(h)/2;
integral_trap_s(1) = sqrt(h)*sin(h)/2;
%Create a loop to calculate the sum of the rest of the values. 
for i = 2:length(t_samples)-1  
  integral_trap_c(i) = integral_trap_c(i) + h*(c(t_samples(i)) + c(t_samples(i+1)))/2;
end

for i= 2:length(t_samples)-1
    integral_trap_s(i) = integral_trap_s(i) + h*(s(t_samples(i)) + s(t_samples(i+1)))/2;
end 

display(integral_trap_c);
display(integral_trap_s);

figure
plot(t_plot,c(t_plot));
hold on
plot(t_samples,c(t_samples),'ro');
hold on 
plot(t_samples,c(t_samples),'g');
title ('c(x) at n = 100')
hold off

figure
plot(t_plot,s(t_plot));
hold on
plot(t_samples,s(t_samples),'ro');
hold on 
plot(t_samples,s(t_samples),'g');
title ('s(x) at n = 100');
hold off

%When x = t^2

c = @(t) cos(t.^(2))./sqrt(t.^(2)); %integrand of Ic
s = @(t) sin(t.^(2))./sqrt(t.^(2)); %integrand of Is
n = 100;
h = 1/n; %step size
tt_samples = 0:h:1;
tt_plot = 0:0.01:1;
integral_trap_ct = 0;
integral_trap_st = 0;
%Do i=1 separately, then add it in the loop.
integral_trap_ct(1) = sqrt(h)*cos(h)/2;
integral_trap_st(1) = sqrt(h)*sin(h)/2;
%Create a loop to calculate the sum of the rest of the values. 

for i = 2:length(tt_samples)-1  
  integral_trap_ct(i) = integral_trap_ct(i-1) + h*(c(tt_samples(i)) + c(tt_samples(i+1)))/2;
end

for i= 2:length(tt_samples)-1
    integral_trap_st(i) = integral_trap_st(i-1) + h*(s(tt_samples(i)) + s(tt_samples(i+1)))/2;
end 

display(integral_trap_ct);
display(integral_trap_st);

figure
plot(tt_plot,c(tt_plot));
hold on
plot(tt_samples,c(tt_samples),'ro');
hold on 
plot(tt_samples,c(tt_samples),'g');
title ('c(t) at n = 100')
hold off

figure
plot(tt_plot,s(tt_plot));
hold on
plot(tt_samples,s(tt_samples),'ro');
hold on 
plot(tt_samples,s(tt_samples),'g');
title ('s(t) at n = 100');
hold off