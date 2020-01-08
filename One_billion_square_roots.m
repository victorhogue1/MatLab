clc
clear
format compact

tic; %Starts the timer
for i = 1:1000000000  %Calculates one billion square roots
    sqrt(i);
end
time = toc; %Saves the timer value
%Displays the amount of time
fprintf('MatLab calculated one billion square roots in %3.2f',time)
