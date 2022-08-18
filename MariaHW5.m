##
##4. Implement a forward substitution algorithm that solves L~z = ~b, with inputs: a lower
##triangular matrix L ? Cn×n and right hand side vector ~b ? Cn and returns (outputs)
##the solution ~z. Call your Matlab function forwardsub.m.
##5. Implement a Matlab function called myLU.m that implements an LU factorization with
##partial pivoting (the algorithm is detailed in Algorithm 21.1 of Trefethen and Bau’s
##Book). The function should take as an input the matrix A ? Cn×n and return a permutation matrix P ? Cn×n
##, and upper and lower matrices U,L ? Cn×n
##respectively.
##(Alternatively, you may choose to return the permutation vector ~p of indices instead
##of the matrix P.)
##6. Implement a Matlab function called myLinSolve.m that solves A~x = ~b, given A ? Cn×n
##and ~b ? Cn as inputs and returns as output the solution ~x ? Cn
##.
##Your code must call your LU and forward substitution routines along with the back
##substitution routine we wrote in class (and is now posted on Blackboard). You may
##not use Matlab’s \ or LinSolve routines.

%4. forwardsub.m
clc
clear
 
L = [2,3,4,1;0,4,2,4;0,0,-1,5;0,0,0,2]
b = [1;2;3;4]
n = length(L)
L\b
z = zeros(size(b));
 
for i = n:-1:1
  btemp = b(i) %RHS copy
  disp('test')
  for j = n:-1:i
    i
    j
    if j == i
      z(i) = btemp/L(i,j)
      break;
    else
      btemp = btemp - L(i,j)*z(j)
    end
  end
end

%5. myLU.m
A = [5,3,6;2,2,5;-2,4,3];
m = length(A);
U = eye(size(A));
P = eye(size(A));
for k = 1:(m-1)
  %Select pivot`
  pivot = 0;
  for i = k:m
    if U(k,i) > pivot
      U(k,i) = pivot;
      i_pivot = i;
    end
  end
  i = i_pivot;
  %Switch row k and row i
  %On U
  temp_row = U(k,k:m);
  U(k,k:m) = U(i,k:m);
  U(i,k:m)=  temp_row;
  %On L
  temp_row = L(k,1:(k-1));
  L(k,1:(k-1)) = L(i,1:(k-1));
  L(i,1:(k-1))=  temp_row;
  %On P
  temp_row = P(k,:);
  P(k,:) = P(i,:);
  P(i,:)=  temp_row;
  %Eliminate
  for j = k+1:m
     L(j,k) = U(j,k)/U(k,k);
     U(j,k:m) = U(j,k:m)-L(j,k)*U(k,k:m)
  end
end
L
U
P
