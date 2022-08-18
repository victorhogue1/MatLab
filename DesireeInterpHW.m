% Desiree Lastname
% Date Created: 11/4/2021
% Synopsis: Plots interpolations via Kernel and Gram Matrix calculations
% Plot Descriptions:
%   Figure 1: Plots of the three sets of (t,f(t)) intervals with h = 1, 0.5, and 0.1, along with 1000 point plot of f(t)
%   Figure 2: Plots the interpolation for h = 1, 0.5, and 0.1 from left to right, on top of the data points and 1000 
%             point plot of f(t). 

%Anonymous Function
f = @(x) 10*sin(2*x) + 20*exp(-10*(x-2).^2)+cos(10*x);

%testing
x_h1 = 0:1:3;
x_h05 = 0:0.5:3;
x_h01 = 0:0.1:3;
x_span = linspace(0,3,1000);
#x_a = 0:0.1:3;
#f_a = f(x_a);
%subplot(1,4,1)
plot(x_span,f(x_span),'-r','LineWidth',1)
hold on
%subplot(1,4,2)
%plot(x_span,f(x_span),'-r','LineWidth',1)
%subplot(1,4,2)
plot(x_h05,f(x_h05),'*g')
hold off
%subplot(1,4,3)
plot(x_h1,f(x_h1),'*b')
%subplot(1,4,4)
plot(x_h01,f(x_h01),'oy')
hold off

%interpolation with h = 1
    %make a list of x values based off h
    %go through it and sample f and g
x_h1 = 0:1:3;
f_h1 = f(x_h1)
g_h1 = g(x_h1)
n_h1 = length(x_h1)-1;
f_vm_h1 = Vandermonde(x_h1,f_h1,0:0.01:3) %should have interpolated it


%interp with h = 0.5
x_h05 = 0:0.5:3;
f_h05 = f(x_h05)
g_h05 = g(x_h05)
f_vm_h05 = Vandermonde(x_h05,f_h05,0:0.01:3)

%interp with h = 0.1
x_h01 = 0:0.1:3;
f_h01 = f(x_h01)
g_h01 = g(x_h01)
f_vm_h01 = Vandermonde(x_h01,f_h01,0:0.01:3) %should have interpolated it
    


%% 

function z = Vandermonde(interp_t,interp_y,range)
    %giving it interpolated values, then let it work its magic
    num_interp = length(interp_t);
    VandermondeMatrix = [];
    for i = 1:num_interp
       VandermondeMatrix = [VandermondeMatrix;interp_t(i).^(0:num_interp-1)]; 
    end
    
    weights = inv(VandermondeMatrix)*interp_y';
    
    polynomial_interp = @(x) x.^(0:num_interp-1)*weights;
    %everything before this, creates a polynomial function based on the
    %Vandemonde method for approximating a function.
    
    %alright, given that "model" lets evaluate at a finer tolerance
    z = zeros(1,length(range));
    for i = 1:length(range)
        z(i) = polynomial_interp(range(i));
    end
    
end




function val = g(x)
    %use a for loop to get around that issue
    val = ones(1,length(x)); %make a blank dataset with the same length as input x
    %use a for loop to go through and and value at any specific x part
    for i = 1:length(x) 
        %check x(i), so the ith element of x
        %and input val(i) (g(i)) which is the ith element of g
        if x(i)>= 0 && x(i)<= 2
            val(i) = 0;
        elseif x(i)>2 && x(i)<=3
            val(i) = 1;
        end
    end

end


clear
clc

% Function to Interpolate
f = @(x) 10*sin(2*x) + 20*exp(-10*(x-2).^2) + cos(10*x);

%Sample Sites
t = 0:1:3;
t2 = 0:.5:3;
t3 = 0:.1:3;
tspan = linspace(0,3,1000);

%Sampled Output
y = f(t);
y2 = f(t2);
y3 = f(t3);
yspan = f(tspan);
figure()
subplot(1,3,1)
plot(t,y,'o','LineWidth',3,tspan,yspan,'-r')
subplot(1,3,2)
plot(t2,y2,'o','LineWidth',3,tspan,yspan,'-r')
subplot(1,3,3)
plot(t3,y3,'o','LineWidth',3,tspan,yspan,'-r')

%Kernel Function
% mu = 0.75;
%Professor's
%K = @(x,y) exp(-1/mu*norm(x-y)^2));
%N = 1:1:length(t);
K = @(x,y,n) (1+y*x).^n;

%A = [1 2;
%     3 4];
%A^2 = [1 2; * [1 2;  = [7 10; 
%       3 4]    3 4]     15 22];

%A.^2 = [1 4      
%        9 16];

%Gram Matrix
GramMatrix1 = zeros(length(t));
GramMatrix2 = zeros(length(t2));
GramMatrix3 = zeros(length(t3));

for i = 1:length(t)
  for j = 1:length(t)
     GramMatrix1(i,j) = K(t(i),t(j),length(t)-1);
   end
end

for i = 1:length(t2)
  for j = 1:length(t2)
     GramMatrix2(i,j) = K(t2(i),t2(j),length(t2)-1);
   end
end

for i = 1:length(t3)
  for j = 1:length(t3)
     GramMatrix3(i,j) = K(t3(i),t3(j),length(t3)-1);
   end
end

%Sampled Output
% Professor had 
Y = f(t)';
% Above: 
 y = f(t)';
 y2 = f(t2)';
 y3 = f(t3)';
 yspan = f(tspan)';

%Weights
Weights1 = pinv(GramMatrix1)*y;
Weights2 = pinv(GramMatrix2)*y2;
Weights3 = pinv(GramMatrix3)*y3;

%Evaluating the Approximation
t_evaluate = t; %???
Z1 = zeros(1,length(t_evaluate));

for i = 1:ceil(length(t_evaluate))
  sum = 0;
  for j = 1:ceil(length(t_evaluate))
    sum = sum + Weights1(j)*K(t_evaluate(i),t_evaluate(j),ceil(length(t_evaluate));
  end
  Z1(i) = sum;
end

t_evaluate = t2;
Z2 = zeros(1,ceil(length(t_evaluate)));

for i = 1:ceil(length(t_evaluate))
  sum = 0;
  for j = 1:ceil(length(t_evaluate))
    sum = sum + Weights2(j)*K(t_evaluate(i),t_evaluate(j),ceil(length(t_evaluate));  %K(x,y,n)
  end
  Z2(i) = sum;
end

t_evaluate = t3;
Z3 = zeros(1,ceil(length(t_evaluate)));
for i = 1:ceil(length(t_evaluate))
  sum = 0;
  for j = 1:ceil(length(t_evaluate))
    sum = sum + Weights3(j)*K(t_evaluate(i),t_evaluate(j),ceil(length(t_evaluate));
  end
  Z3(i) = sum;
end


%Plot Result
figure()
subplot(1,4,1)
semilogy(t,Z1,'LineWidth',3);
hold on
semilogy(tspan,f(tspan),'--','LineWidth',3)
semilogy(t,f(t),'o')
hold off

subplot(1,4,2)
semilogy(t2,Z2,'LineWidth',3);
hold on
semilogy(tspan,f(tspan),'--','LineWidth',3)
semilogy(t2,f(t2),'o')
hold off

subplot(1,4,3)
plot(t3,Z3,'LineWidth',3);
hold on
plot(tspan,f(tspan),'--','LineWidth',3)
plot(t3,f(t3),'o')
hold off

subplot(1,4,4)
title('Log(Z3) vs. X')
semilogy(t3,Z3,'LineWidth',3);
hold on
semilogy(tspan,f(tspan),'--','LineWidth',3)
semilogy(t3,f(t3),'o')
hold off


return


