clear
clc

%M = 5;
%epsilon = 1.25;
%xc = [0, 0.6, 1]';

M = 5;
epsilon = 1.25;
xc = [2, 5]';
x = linspace(xc(1),xc(end),M)'

%my_fun = @(x) exp(sin(pi*x));
yc = [6, 1]';

phi = @(x) sqrt(1 + (x^2)*(epsilon^2));  #Phi for multiquadratic
#f = my_fun(xc);
f = yc;
N = length(xc);
r = zeros(N,N);
B = r;
for i=1:N
  for j=1:N
    r(i,j) = abs( xc(i) - xc(j) )
    B(i,j) = phi(r(i,j))
  end
end

%Solve B*a=f for expansion coefficients a
a = B\f

%Construct evaluation matrix H
h = zeros(M,N);
H = h;
for i = 1:M
  for j = 1:N
    h(i,j) = abs(x(i)-xc(j));
    H(i,j) = phi(h(i,j))
  end
end

%Interpolated values
fa = H*a

figure
hold on
plot(x,fa)
plot(x,fa,'b*')
plot(xc,f,'r*')
hold off
title('Problem 2 Plot: RBF Interpolation')
