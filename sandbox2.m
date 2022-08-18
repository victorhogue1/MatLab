n1 = 100;
n2 = 200;
xspan1 = linspace(0,8,n1);
xspan2 = linspace(0,8,n2);
ynum1 = zeros(length(xspan1),1);
dy1 = ynum1;
ynum2 = zeros(length(xspan2),1);
dy2 = ynum2; 
dx1 = xspan1(2) - xspan1(1);
dx2 = xspan2(2) - xspan2(1);

%Euler Process
ynum1(1) = 0;   %y0 = 0 initial condition
ynum2(1) = 0;
%dy(1) = -2*xspan(1)*ynum1(1)+1
%ynum1(2) = ynum1(1) + dx1*dy1(1)

for i = 2:n1
   dy1(i-1) = -2*xspan1(i-1)*ynum1(i-1) + 1;
   ynum1(i) = ynum1(i-1) + dx1*dy1(i-1);
end

for i = 2:n2
   dy2(i-1) = -2*xspan2(i-1)*ynum2(i-1) + 1;
   ynum2(i) = ynum2(i-1) + dx2*dy2(i-1);
end

figure()
plot(xspan1,ynum1)
hold on
plot(xspan2,ynum2)

