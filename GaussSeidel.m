A = [3 -2 0; -2 3 -1; 0 -1 1];
k = 20;
m = [3; 4; 6];
g = 9.8;
A = A.*k;
b = m.*g;

A \ b  %Gaussian Elimination

gamma = 1;
es = 0.0001;
x0 = [0;0;0];
%Gauss Seidel
x = x0; %initial value of vector x
ea = [1;1;1];

while max(ea) > es
  xold= x;
  [m, n] = size(A);
  for i= 1 : m
    mysum = 0;
    for j = 1 : n
      if j ~= i
        mysum = mysum + A(i,j)*x(j);
       end
     end
    x(i) = (b(i)-mysum)/A(i,i);
    %x(i) = gamma * x(i) + (1-gamma) * xold(i);
  end
  ea = (abs(x-xold)./x)*100;
 end
xsol= x