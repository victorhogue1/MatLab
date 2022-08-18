%  n, a, b given
%  deltax = (b-a)/n
%  Trapezoid Rule: integral(f(x) from a to b) = (deltax/2)*[f(x1)+2*f(x1)+2*f(x2)+...+2*f(xn-1)+f(xn)] 


function area = trapezoid[a,b,xvect,yvect] 
%Trapezoid Rule:
  % We have n trapezoids 
  % x is our partition, expressed as a vector of length n, namely x = [x(1),x(2),...x(n),x(n+1)]
  % deltax is the width of each trapezoid
  % f(xi) is the height of the trapezoid at location xi
  deltax = xvect(2)-xvect(1);
  sum = 0;
  sum = sum + f(x(1));
  for i = 1:(n+1)
    sum = sum + 2*f(x(i));
  end
  sum = sum + f(x(n+1));
  sum = sum*deltax/2;  %Final result of trapezoid rule
end

%The homework problem
% Ic = integral(cos(x)/sqrt(x))dx from 0 to 1
% Is = integral(sin(x)/sqrt(x))dx from 0 to 1
% n trapezoids, h = 1/n, a = lim x->0, b = 1, let the integrands be zero at x = 0
%Part (a) 
a = 0;
b = 0;
fc = @(x) cos(x)/sqrt(x);
fs = @(x) sin(x)/sqrt(x);
n = 100:100:1000 %= [100,200,...,900,1000]
myTrapsC = zeros(length(n),1);
myTrapsS = zeros(length(n),1);
for i = 1:length(n)
  %Set up the ith x partition with n(i) number of trapezoids
  deltax = (b-a)/n(i);
  %Initialize the leftmost x value
  xvect(1) = a;
  %Initialize the leftmost corresponding y values of the integrands 
  yvectC(1) = fc(xvect(1));
  yvectS(1) = fs(xvect(1)); 
  for j = 2:n(i)
    %Step x by deltax 
    xvect(j) = xvect(j-1) + deltax;
    %Calculate the corresponding y values of the integrands
    yvectC(j) = fc(xvect(j));
    yvectS(j) = fs(xvect(j));
  end
  myTrapsC(i) = trapezoid(a,b,xvect,yvectC)
  myTrapsS(i) = trapezoid(a,b,xvect,yvectS)
end
%Part (c)
% n = 20:20:200 = [20,40,...,180,200]
% change of variables x = t^2



