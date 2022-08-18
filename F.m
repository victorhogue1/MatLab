function xp = F(t,x)
%xp is a column vector with entries [x'(t); x''(t)]
%x contains the initial conditions [x(t0); x'(t0)]
%t is a vector [t0, tf]
xp=zeros(2,1); % since output must be a column vector
xp(1)=x(2);
xp(2)=t*x(1); % don’t forget ; after each line
end