function [U,S,V] = mysvd(A)
[m,n] = size(A);
U = zeros(m);
V = zeros(n);
D = zeros(m,n);
S = zeros(m,n);
     [V, D] = eig(A'*A);
     V=V(:, n:-1:1);
     D= D(n:-1:1, n:-1:1);
     S= zeros(m,n);
     S(1:n,1:n)= sqrt(D);
     SSize= size(D(D>0));
     s= SSize(1);
     USize=size(U);
     VSize=size(V);
     u=USize(1);
     v=VSize(1);
     S = S(1:u,1:v)
     for i = 1:min(s,u)    
         U(:,i)= 1/S(i,i)*A*V(:,i);
     end 
     [T,~] = qr(U);
     U = T;    
end





##
##
##
##function [U,S,V] = mysvd(A)
##[m,n] = size(A);
##U = zeros(m);
##V = zeros(n);
##D = zeros(m,n);
##S = zeros(m,n);
##%[U2,D] = eig(A'*A);
##[V,D] = eig(A*A');
##%[~, UPermutation] = sort(sum(DU), 'descend')
##%[~, VPermutation] = sort(sum(DV), 'descend');
##%V = V(:, VPermutation)
##%D = DU(:, VPermutation)
##     %V=V(:, n:-1:1);
##     %k = min(m,n)
##     D=D(n:-1:1, n:-1:1);
##     S(1:n,1:n)= sqrt(D)
##     SSize=size(D(D>0));
##     s=SSize(1)
##     for i = 1:s
##         U(:,i)= (1/S(i,i))*A*V(:,i);
##     end 
##     USize=size(U);
##     VSize=size(V);
##     u=USize(1);
##     v=VSize(1);
##     S = S(1:u,1:v);
##     T = zeros(size(U));
##     [T,~] = qr(U);
##     %if  U(1,1)/T(1,1)> 0 
##         U=T;
##     %else
##     %    U=-T;
##     %    V=-V;
##     %end
##
####%A=[2 4 1 3; 0 0 2 1];
####[m,n] = size(A);
####U = zeros(m);
####%S=zeros(size(A));
####% Get V
####[aatVecs, aatVals] = eig(A*A');
####[~, aatPermutation] = sort(sum(aatVals), 'descend');
####%U = aatVecs(:, aatPermutation);
####
####[ataVecs, ataVals] = eig(A'*A);
####[~, ataPermutation] = sort(sum(ataVals), 'descend');
####V = ataVecs(:, ataPermutation)
####
####S=zeros(m,n);
####S(1:n,1:n)= sqrt(aatVals);
####SSize=size(aatVals(aatVals>0));
####s=SSize(1);
####
####% Get S
####singularValues = sum(aatVals(:, aatPermutation)).^0.5;
####for i=1:nnz(singularValues)
####    S(i, i) = singularValues(i);
####end
####for i=1:s
####U(:,i) = A*V(:,i)./singularValues(i);
####end
####USize=size(U);
####VSize=size(V);
####u=USize(1);
####v=VSize(1);
####S = S(1:u,1:v);
####
####
####%A
####%U*sigma*V'
####     
####end