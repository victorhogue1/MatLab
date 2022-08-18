function x = newtons(n)
 x = zeros(n,1);
 x(1) = 1;
 # use for loop
 for (i=2:n) # start from 1
   i
   x(i-1)
   x(i)=x(i-1)-(cos(x(i-1))-x(i-1))./(-sin(x(i-1)-1)); #Newton's formula ,calculate the next approximatio
 end
end
