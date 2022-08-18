% Function to Interpolate
f = @(x) 10*sin(2*x) + 20*exp(-10*(x-2).^2) + cos(10*x);

%syms z
%g = piecewise((z>=0)&(z<=2),0,(z>2)&(z<=3),1);

%k0=(@x) (1+t(1)*x)^3 + (1+t(2)*x)^2 + (1+t(3)*x)^1; 
%k1=(@x) (1+t2(1)*x)^6 + (1+t2(2)*x)^5 + (1+t2(3)*x)^4 + (1+t2(4)*x)^3 + (1+t2(5)*x)^2 + (1+t2(6)*x)^1; 
%k2=(@x) (1+t3(1)*x)^30 + (1+t3(2)*x)^29 + (1+t3(3)*x)^28 + (1+t3(4)*x)^27 + (1+t3(5)*x)^26 + (1+t3(6)*x)^25 + (1+t3(7)*x)^24 + (1+t3(8)*x)^23 + (1+t3(9)*x)^22 + (1+t3(10)*x)^21 + (1+t3(11)*x)^20 + (1+t3(12)*x)^19 + (1+t3(13)*x)^18 + (1+t3(14)*x)^17 + (1+t3(15)*x)^16 + (1+t3(16)*x)^15 + (1+t3(17)*x)^14 + (1+t3(18)*x)^13 + (1+t3(19)*x)^12 + (1+t3(20)*x)^11 + (1+t3(21)*x)^10 + (1+t3(22)*x)^9 + (1+t3(23)*x)^8 + (1+t3(24)*x)^7 + (1+t3(25)*x)^6 + (1+t3(26)*x)^5 + (1+t3(27)*x)^4 + (1+t3(28)*x)^3 + (1+t3(29)*x)^2 + (1+t3(30)*x)^1; 
t = 0:1:3
t2 = 0:.5:3
t3 = 0:.1:3
y = f(t)
y2 = f(t2)
y3

g1 = zeros(1,length(t));
g2 = zeros(1,length(t2)); 
g3 = zeros(1,length(t3));
for i = 1:length(t)
  if (t(i) < 2)
      g1(i) = 0;
  else
      g1(i) = 1;
  end
end
for i = 1:length(t2)
  if (t2(i) < 2)
      g2(i) = 0;
  else
      g2(i) = 1;
  end
end
for i = 1:length(t3)
  if (t3(i) < 2)
      g3(i) = 0;
  else
      g3(i) = 1;
  end
end


n = 3;
n2 = 6;
n3 = 30;
k = zeros(length(t));
k2 = zeros(length(t2));
k3 = zeros(length(t3));
interpol = k;
interpol2 = k2;
interpol3 = k3;


for i = 1:n
  k(i) = @(x) (1+t(i)*x)^n;  %[k0, k1, k2, ... kn]
  interpol = interpol + f(t(i))*k(i);
end  

for i = 1:n2
  k2(i) = @(x) (1+t2(i)*x)^n2;  %[k0, k1, k2, ... kn]
  interpol2 = interpol2 + f(t2(i))*k2(i);
end  

for i = 1:n3
  k3(i) = @(x) (1+t3(i)*x)^n3;  %[k0, k1, k2, ... kn]
  interpol3 = interpol3 + f(t3(i))*k3(i);
end  

          
% Plot Function To Interpolate over [0,3]

%Plot f functions for h = 1, 0.5, 0.1
figure
plot(t,f(t), 'LineWidth',3);
hold on;
plot(t2,f(t2), 'LineWidth',3);
plot(t3,f(t3), 'LineWidth',3);
legend('h=1','h=0.5','h-0.1')
title('function f')
hold off;

figure
plot(t,interpol(t), 'LineWidth',3);
hold on;
plot(t2,interpol(t2), 'LineWidth',3);
plot(t3,interpol(t3), 'LineWidth',3);
legend('h=1','h=0.5','h-0.1')
title('function f interpolated')
hold off;

for i = 1:n
  k(i) = (1+t(i)*x)^n;  %[k0, k1, k2, ... kn]
  interpol = interpol + g(t(i))*k(i);
end  

for i = 1:n2
  k2(i) = (1+t2(i)*x)^n2;  %[k0, k1, k2, ... kn]
  interpol = interpol + g(t2(i))*k2(i);
end  

for i = 1:n3
  k3(i) = (1+t3(i)*x)^n3;  %[k0, k1, k2, ... kn]
  interpol = interpol + g(t3(i))*k3(i);
end  

%Plot g functions for h = 1, 0.5, 0.1
figure
plot(t,g1, 'LineWidth',3);
hold on;
plot(t2,g2, 'LineWidth',3);
plot(t3,g3, 'LineWidth',3);
legend('h=1','h=0.5','h-0.1')
title('function g')
hold off;

figure
plot(t,interpol, 'LineWidth',3);
hold on;
plot(t2,interpol2, 'LineWidth',3);
plot(t3,interpol3, 'LineWidth',3);
legend('h=1','h=0.5','h-0.1')
title('function g interpolated')
hold off;
