clear,clc

%Part A

%Setting the Constants
m = 10
k = 15
b = 8

%Setting up the varaibles
syms x(t)


h_eqn = m*diff(x,t,3)+ b*diff(x,t)+k*x==0;  %Given equation

%Defining the the diff. eqn.
     
DX_1 = diff(x,t);
DX_3 = diff(x,t,3);
cond = [x(0)==25, DX_1(0)==5]

%solves the differential equation
h_solve = dsolve(h_eqn,cond)

%setting the time scale
time = linspace(0,10,1000);

%evaluating the differential equation which turns it into a vector
h_t = eval(h_solve)

%plotting the function
plot(t,h_t)
title('External Force vs. time (Alsayab Elnagieb)')
xlabel('time')
ylabel('External Force')

%Part B

sysm t
F_ext = exp(-2*t)*heaviside(t-3)
