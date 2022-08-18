clc 
clear




%Question 1 part b
f = @(x,t) 2*pi*x*(1-x)*cos(2*pi*t) + 2*sin(2*pi*t); %calculated by hand from uxx
alpha = 0;
beta = 1;
n = 10;
h = 1/(n+1);
dt = 1/(n + 1);
x = [alpha+h:h:beta-h]';
t = [alpha+dt:dt:beta-dt]';
u0 = zeros(n,1);
ui(:,1) = u0;
ti= (0:dt:1)';






%Calculate M, the FE mass matrix by M(i,j) = integral(phi(i )*phi*(j))dx from 0 to 1,
%which simplifies to sums of the areas of the unit triangles in terms of h
M = zeros(n);

bfunction = @(i,h,t) 2*pi*cos(2*pi*t)*1/h*(((h*i)^3-(h*(i-1))^3)/3 - ((h*i)^4-(h*(i-1))^4)/4 - (h*(i-1)) * (((h*i)^2-(h*(i-1))^2) / 2 - ((h*i)^3 - (h*(i-1))^3)/3) + ((h*(i+1))^4 - (h*i)^4)/4 - ((h*(i+1))^3 - (h*i)^3)/3 + (h*(i+1)) * ( ((h*(i+1))^2 - (h*i)^2)/2 - ((h*(i+1))^3 - (h*i)^3)/3) )+ 2*sin(2*pi*t)*h;

%now solve DFE wiht Dsolve?
% m*u prime + s*u = fh
%Stiffness Matrix 

Snew = zeros(n);
Mnew = Snew;
%Mass Matrix

M(1:1+n:n*n) = 2*h/3; %Main Diagonal
M(n+1:1+n:n*n) = h/6; %Below Main Diaonal
M(2:1+n:n*n-n) = h/6; %Above

%Stiffness Matrix
S(1:1+n:n*n) = 2/h; %Main Diagonal
S(n+1:1+n:n*n) = -1/h; %Below Main Diagonal
S(2:1+n:n*n-n) = -1/h; %Above

%Converting from vector to matrix
for i = 1:n
  Snew(i,:) = S((i-1)*n+1:i*n);
  Mnew(i,:) = S((i-1)*n+1:i*n);
end
S = Snew;
M = Mnew;


Minv = inverse(M);

MinvS = (Minv)*S;

 
%Solving the time discretization with Euler's method 
for i=1:n+1
    %%Calculate fh the load vector 
    for k = 1:1:n
        %b(k) = integral(@(x) f(x,ti(i)) .* basisFunc(k,h,x), h*(k-1), h*(k+1),'RelTol',0,'AbsTol',1e-12);
        b(k) = bfunction(k,h, ti(i));

    end   
    %Calculate uh by the Explicit Method
    ui(:,i+1) = ui(:,i) +  dt * (-MinvS * ui(:,i) + Minv * b);
end


%Calculate error

e = 0
for i = 1:n % formula says m, but m = n
	for k = 1:n
		e = e + (u(x(i),t(k)) - uh(x(i),t(k)))^2;
	end
end
e = sqrt(e/(n*n))
