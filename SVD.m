%clc
%A = [1 2;3 4;5 6;7 8;]'
%[U,S,V] = svd(A)
%[U,S,V] = mysvd(A)

%U*S*V'
%testmysvdscripts

clear all;

clc;

err=0;

for jjj=1:100
    
    n=randi([1 8],1,2);
    m=n(1); n=n(2);
    
    A=randi([-6 6],m,n);
    
    [U S V]=mysvd(A)
    
    [X Sp Y]=svd(A)
    
    nm=norm(A-U*S*V','fro')+norm(U'*U-eye(m),'fro')+norm(V'*V-eye(n),'fro')+norm(S-Sp,'fro')
    
    if nm>1 || isnan(nm)
        
        AA=A;
        UU=U;
        SS=S;
        VV=V;
        U*S*V';
        err=nm;
        %return
    end
    
    err=nm+err;
    
end

if err<1
    
    disp('Your code looks like it is running well')
    
else
    
    disp('There may be a bug in your code. Look at the following matrix and vector')
    
    AA,
    
end
