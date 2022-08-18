%function mybinplot(N)
clc
clear
N = 150;
x = [0:N]; % for base numbers 0 to N
p = 0;
while 2^p<=N
            p= p+1;
end
z = zeros(p,N+1);

for k = 0:N
%----------------decimal k to binary b
  for  j =1:k
  b = zeros(1,p);
    if k~=0
        m = k;
        power = p-1;
        for i = 1:length(b)
            if m >= 2^power
                b(1,i) = 1;
                m = m-2^power;
            end
            power = power-1;
        end  %i   
    end %if
  z(:,k+1) = b';
  end %j 
end %k

y = 1:p;
disp(z)
imagesc(x,y,z)
%disp(x)
%end
%-----------------end