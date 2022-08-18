residual_criterion_flag = false;
eps = 10^(-12);
%Max number of iterations
n_max = 10 + 1;
%Current iteration
n = 1; 
%Matrix of x's
X = zeros(2,n_max);
%Residual function
r1 = @(x1,x2) -1*(x1*x2^3 + x1^2 - 9); 
r2 = @(x1,x2) -1*(3*x1^2 - x2^3 - 4);
%Jacobian
J11 = @(x1,x2) x2^3+2*x1;
J12 = @(x1,x2) 3*x2^3*x1;
J21 = @(x1,x2) 6*x1*x2;
J22 = @(x1,x2) 3*x1^2 - 3*x2^2;
%Guess
X(:,1) = [1.2,2.5]';

xn_minus_1 = X(:,1);

for n = 1:n_max
  %Update xn_minus_1
  if (n > 1)
    xn_minus_1 = xn;
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


