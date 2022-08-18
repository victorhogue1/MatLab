% Backward Euler Method % 
clear; clc;           % clear memory and clear screen
tic;                  % begin timer
x(1) = 0; y(1) = 1;   % define initial value
max = 4; min = 0;     % max and min values
f = @(x,y)y;          % first-order DE
n1 = 50;              % number of points
h = (max - min)/n1;   % step size

%%% \\\\ start recursion (Euler's Method) \\\\ 
for n = 2:n1
x(n) = x(1) + (n-1)*h;
y(n) = y(n-1) + h*f(x(n-1),y(n-1));
end
%%%% \\\\ end of recursion \\\\ %%%%

plot(x,y,'r*');       % plot approximate solution
hold on;              % allows for superposition of multiple plots

error1 = norm(y - exp(x));  % error using norm

n2 = 100;             % update number of points
h = (max - min)/n2;   % update step size
%%% \\\\ start recursion \\\\ 
for n = 2:n2
x(n) = x(1) + (n-1)*h;
y(n) = y(n-1) + h*f(x(n-1),y(n-1));
end
%%%% \\\\ end of recursion \\\\ 

error2 = norm(y - exp(x));    % error using norm

plot(x,y,'b*');         % plot approximate solution

plot(x,exp(x),'k');     % plot exact solution
legStr = {'Approx 1','Approx 2','Exact'};
legend( legStr, 'location', 'northeast' );
title('Euler Method')   % place title on plot
xlabel('x');            % label x-axis
ylabel('y');            % label y-axis
grid on;                % turn on grid for visual appeal
disp('*************************');
disp('Summary of Results');
disp('Number of points'); n1
error1
disp('Number of points'); n2
error2
toc;                    % end timer and display time
disp('End of Run')  % tell user code has ended 
disp('*************************');
