clc
clear
format compact
%use v = 25, th = 45
g = 9.8067;
v0 = input('Enter initial velocity in m/s: ');
th = input('Enter angle in degrees: ');
D = (v0^2)*sind(2*th)/g; %Computes distance travelled
H = (v0*sind(th))^2/(2*g); %Computes maximum height
T = 2*v0/g; %Computes time of flight
fprintf('v0 = %.i th = %.i D = %3.2f m H = %3.2f m T = %3.2f s\n',v0,th,D,H,T)
%Note: on the homework, T is wrong. It should be 5.10 not 2.10.

%Assume the height at the plaza and the height at the statue are the same
%Assume no air resistance
%Assume the distance is 200 m
%Assume the height of the Thompson library is 100 m in the middle of the
%flight
%Enter a small speed and distance and increase both until the path has
%height > 100 m and distance = 200 m

%Solution: for these numbers, v0 = 50 and th = 63 are a little higher than
%h = 100 and d = 200.

