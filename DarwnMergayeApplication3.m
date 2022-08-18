% Darwn Mergaye
% Eng 1221
% Application 3
% 2/23/2022

% Inputs
% T, vector of temperatures
% T-set, scalar set-point
% P, I, D, scalar  control parameters
% N, scalar number of terms for the integral term

% y, scalar output for actuator

clear
clc
%x =  [1,2,3,4,5];
%N = 3;

##if length(x)==1
##  path = 1;
##elseif (length(x)>1)&&(length(x)<N)
##  path = 2;
##elseuf length(x)>N
##  path = 3;
##end


%Initialize variables
%T_set = input('Enter the set point T_set:');
%P = input('Enter the coefficient P:');
%D = input('Enter the cooefficient D:');
%I = input('Enter the coefficient I:'); 
%N = input('Enter the number of terms N:');
T = [];
y = 0;
%x = zeros(length(N)); 
T_set = 40;
P = -0.1;
D = -0.4;
I = -0.01;
N = 5;

clear temperature measurement;

%Run measurement simulations
%T(1) = 20;
for k = 1:50
  if k > 1
    fprintf('\nBefore: T(%i) = %3.2f, y = %3.2f \n', k-1, T(k-1), y)   
  end 
  %Take "temperature measurement", i.e. run the function
  T(k) = temperature_measurement(y);
  %Calculate error x(k) = T(k) - T_set and store in array x
  x(k) = T(k) - T_set
  if length(x)==1
    y = P*T(k);
    disp("A")
  elseif (length(T)>1)&&(length(T)<N)
    y = P*T(k)+D*(x(k)-x(k-1)) + I*sum(x);
    disp("B")
  elseif length(T)>=N
    y = P*T(k)+D*(x(k)-x(k-1)) + I*sum(x(k-N+1:k));
    disp("C")
  end
fprintf('After: T(%i) = %3.2f y = %3.2f \n', k, T(k), y)   
end

%Plots
t = 0:(length(T)-1);
figure
plot(t,T)
xlabel('Tempature Measurements (Arbitrary Units;')
ylabel('Temperature (Arbitrary Units)') 
  


