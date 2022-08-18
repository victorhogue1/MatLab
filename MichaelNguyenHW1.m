%Problem 5
clc
clear
%Set up partition t with width 0.1
%x = linspace(-5,5,0.1);
x = -5:0.1:5;

%Initialize y-values of g2 and g3 to be all zero at each t
g2 = zeros(length(x),1);
g3 = g2;
g4 = g2;
H = zeros(5,1);
counter = -1;

%Using the for loop, i will iterate through each partition of t
for t = -2:2
disp(counter)
g2 = zeros(length(x),1);
g3 = g2;
  counter = counter + 1;
  for i=1:length(x)
    if (x(i)>=-1)&&(x(i)<=1)  %For x between -1 and 1, g3(x) = 1
      g3(i) = 1;
    end
    %For tau between -3+t and -2+t, g2(x) = 1
    if (x(i)>=(-3+counter))&&(x(i)<=(-2+counter))  
      g2(i) = 2;
    end
  end
  hold off
  for i=1:length(x)
    if(g2(i)>0)&&(g3(i)>0)
      H(t+3) = H(t+3) + 1*2*0.1 %Add the integrand's value*width
    end
  end
end


for t = 1:5
  fprintf('The sums are:\n')
  fprintf('t = %f, H = %3.5f\n',t-3,H(t)) 
end 
figure
tdata = -2:1:2;
tinterp = -5:0.1:5;
Hdata = H';
Hinterp = interp1(tdata,Hdata,tinterp)
plot(tdata,Hdata,'ro');
hold on
plot(tinterp,Hinterp)
hold off




%Why is the value not exactly the same?
%The endpoint boundary at t = 2, -2 being set to 1 for g2, and similarly for g3, 
%is causing the difference of and additional 0.1 for each    