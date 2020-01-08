function main
clc
clear
format compact
disp('Problem 5')
%Givens
theta1 = [3*pi/4, 7*pi/4];
theta2 = linspace(0,2*pi,1000); 
%Calls function to calculate radius
r1 = rad_eqn(theta1);
r2 = rad_eqn(theta2);
%Displays results
fprintf('Theta: %3.2f  R: %3.2f\n',theta1',r1')
figure(1)
%Polar graph
polar(theta2,r2)

disp('Problem 8')

%Givens
gamma = 0.696;
r = 0.35;
d = 0.12;
t = 0.002;

%Anonymous function to calculate surface area
W = @(r,d,t,gamma) gamma.*(pi^2)*(2*r+d).*d.*t;
W1 = W(r,d,t,gamma);
fprintf('The weight W = %3.5f\n',W1)


disp('Problem 11')
w = [220, 135];
h = [74, 67];
age = [35, 22];
gen = [1, 0];
for i = 1:2
  [BMI, BFP] = Body_Fat(w(i),h(i),age(i),gen(i));
  fprintf('[Weight, Height, Age, Gender] = [%.i, %.i, %.i, %.i] has BMI = %3.2f and BFP %3.2f\n',w(i),h(i),age(i),gen(i),BMI,BFP)
end



end

function r = rad_eqn(theta)
%Calculates r given theta for problem 5
	r = 2*cos(theta).*sin(theta).*sin(theta/4);
end

function [BMI, BFP] = Body_Fat(w,h,age,gen)
%Calculates body mass index and body fat percentage given weight, height,
%age, and gender (1 = male, 0 = female)
  BMI = 703*w./(h.^2);
	BFP = 1.2*BMI+0.23*age-10.8*gen-0.54;	
end



