clc
clear
residual_criterion_flag = false;
eps = 10^(-12);
%Max number of iterations
n_max = 100 + 1;
%Current iteration
n = 1; 
%Matrix of x's
X = zeros(2,n_max);
%Residual function
% L = x1
% R = x2
r1 = @(x1,x2) 3.1415926*(x2^4-6561)*(15*x1-843)+8*x1^3; 
r2 = @(x1,x2) 3.1415926*(x2^4-2401)*(15*x1-792)+8*x1^3;
%Jacobian
J11 = @(x1,x2) 24*x1^2 + 15*3.1415926*(-6561 + x2^4);
J12 = @(x1,x2) 12*3.1415926*(-281 + 5*x1)*x2^3;
J21 = @(x1,x2) 24*x1^2 + 15*3.1415926*(-2401 + x2^4)
J22 = @(x1,x2) 12*3.1415926*(-264 + 5*x1)*x2^3;
%Guess
X(:,1) = [40,10]';

xn_minus_1 = X(:,1);

for n = 1:n_max
  n
  %Update xn_minus_1
  if (n > 1)
    xn_minus_1 = xn
  end
  %Calculate Dxn
  Dxn = DeltaXn(J11,J12,J21,J22,r1,r2,xn_minus_1);
  %Calculate xn
  xn = xn_minus_1 + Dxn;
  %Append xn to X matrix
  X(:,n) = [xn(1),xn(2)]';
  %Check residual stopping criteria
  if (sqrt(xn(1)^2 + xn(2)^2)<eps)
     residual_criterion_flag = true;
     break;
  end
end

X(:,n)

% if (residual_criterion_flag == false)
  %display n_max iterations and X(:,n_max`)
% else
   %display number of iterations and X(:,n) final result
