
clc

%Row vector
a = [1 2 3]
%Same as a = [1,2,3];

%Column Vector
b = [4; 5; 6]

%Transpose
a'

a+b
a'+b
a*b  % a is 1 row and 3 columns (1 x 3), and b is (3 x 1), and c = a*b is allowed because
%the 3's match, and the result c is (1 x 1) = a scalar
%specifically a*c = 1*4 + 2*5 + 3*6 = 32  
a.*b  %elementwise --> [1*4, 2*5, 3*6] = [4, 10, 18] 
%a/b   %undefined - can't divide by a vector
a./b'  %elementwise division --> [1/4, 2/5, 1/2]

%Dimensions Rule for Matrix Multiplication
% A is m x n, B is n x k, then A*B is m x k 
