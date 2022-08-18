%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   HW#2 P3 Template
%   Extended Newton method and (the original version of) Newton's method
%
%   Author: Marcus Rüter
%   Date: 06/30/2022
%   Edited by: ...
%   Date: ...
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Please fill in the missing parts as indicated by "..", or write your own
% Matlab script

%% Clear Cache
clc;
clearvars;
close all;

%% Main Script

% Initialization
a = 0;
b = 10;
n_inGuess = 0;                 % Number of initial guesses
x = linspace(0,10,1000);               % x-values of initial guesses
roots = zeros(1000,1);            % Approximated root for each initial guess
n_iter = zeros(1000,1);           % Number of iterations for each init. guess
method = 2;                    % 1: Newton's method, 2: ext. Newton method 

% Anonymous functions
f = @(x) 2*sin(x).*cos(2*x)+ 1/4;                     % f(x)
d1F = @(x) 2*cos(x)*cos(2*x)-4*sin(x)*sin(2*x);                                      % f'(x)
d2F = @(x) -10*sin(x)*cos(2*x)-8*cos(x)*sin(2*x);                                      % f"(x)

for i = 1:length(roots)                    % Loop over all initial guesses
    % Determine the approximated root and n_iter for each initial guess
    [roots(i),n_iter(i)] = Newton(x(i),f,d1F,d2F,method);
end

% Output total number of iterations
fprintf('Total number of iterations for method %d: %d\n',..,...
    sum(n_iter));

figure(1);                      % Open Figure 1
plot(x,..,'LineWidth',2);       % Plot the function f(x)
hold on;                        % Set hold to on
plot(x,..,'LineWidth',2);       % Plot the roots for each initial guess
ylim([-4 12]);                  % Set the y-limits
title('HW#2, Problem 3, Figure 1','FontSize',20);   % Set title
xlabel('$x$','Interpreter','latex');                % Set x-label
ylabel('$y$','Interpreter','latex');                % Set y-label
legend('Function $y = f(x)$','Roots $y = \alpha$','Location','NW',...
    'Interpreter','latex');     % Plot legend (with LaTeX formulas)
grid on;                        % Turn on grid
set(gcf,'Position',[30 350 850 450]);   % Change position and size
set(gca,'LineWidth',2,'FontSize',20);   % Change linewidth of axes

figure(2);                      % Open Figure 2
bar(x,..,'LineWidth',2);        % Bar plot of the number of iterations
title('HW#2, Problem 3, Figure 2','FontSize',20);   % Set title
xlabel('$x_0$','Interpreter','latex');              % Set x-label
ylabel('$n_{iter}$','Interpreter','latex');         % Set y-label
grid on;                        % Turn on grid
set(gcf,'Position',[30 350 850 450]);   % Change position and size
set(gca,'LineWidth',2,'FontSize',20);   % Change linewidth of axes

%% Function Newton
function [root,n_iter] = Newton(x0,f,d1F,d2f,method)

% Initialization
maxIter = 20;                   % Maximum number of iterations
n = 1;                          % Iteration counter (count. starts from 1)
x = zeros(maxIter+1,1);         % x_n-values
x(n) = x0;                      % Initial guess x_0 (note that n=1 for x_0)
eps = 10^(-12);                 % Tolerance for Newton's method
t1 = 0.001;                     % Tolerance t_1 to correct x_n
t2 = 3;                         % Tolerance t_2 to correct x_n

res = -f(x0);                   % Determine residual for initial guess x_0

% Iterate over n until |res| <= eps or n >= maxIter


% Iterate until one condition turns false
##        while (f(x(n)) > .. && (d1F(x(n)) < .. && d1F(x(n)) > ..) && ...
##                d2F(x(n)) < ..) || ...
##                 (f(x(n)) .. && d1F(x(n)) .. && d2F(x(n)) ..) || ...
##                (f(x(n)) .. && (d1F(x(n)) .. && d1F(x(n)) ..) && ...
##                d2F(x(n)) ..) || ...
##                (f(x(n)) .. && d1F(x(n)) .. && d2F(x(n)) ..)
##            x(n) = x(n) + ..;   % Move x_n by t_1 to the right
##        end
##
##        % Iterate until one condition turns false
##        while (f(x(n)) > .. && (d1F(x(n)) > .. && d1F(x(n)) < ..) && ...
##                d2F(x(n)) < ..) || ...
##                (f(x(n)) .. && d1F(x(n)) .. && d2F(x(n)) ..) || ...
##                (f(x(n)) .. && (d1F(x(n)) .. && d1F(x(n)) ..) && ...
##                d2F(x(n)) ..) || ...
##                (f(x(n)) .. && d1F(x(n)) .. && d2F(x(n)) ..)
##            x(n) = x(n) - ..;   % Move x_n by t_1 to the left
##        end
##

while abs(res) > eps && n < maxIter+1
    if method == 2             % Correct x_n for extended Newton method
        % Iterate until one condition turns false
        % Keep moving right
        while 
          %f is positive, decreasing, but f' is bounded below, and concave down
          (f(x(n)) > eps && (d1F(x(n)) < eps && d1F(x(n)) > -1000) && ...
                d2F(x(n)) < eps) || ...
          %OR f is positive, decreasing, and concave up        
                (f(x(n)) > eps && d1F(x(n)) < 0 && d2F(x(n)) < eps) || ...
          %OR f is positive, decreasing, f' is bounded below, and concave down
          (f(x(n)) > eps && (d1F(x(n)) < eps && d1F(x(n)) > -1000) && ...
                d2F(x(n)) > 0) || ...
          %OR is positive, decreasing, and concave up      
                (f(x(n)) > eps && d1F(x(n)) > eps && d2F(x(n)) < eps)
            x(n) = x(n) + t1;   % Move x_n by t_1 to the right
        end

        % Iterate until one condition turns false
        while 
          %f is positive, increasing, but f' is bounded above, and concave down
          (f(x(n)) > eps && (d1F(x(n)) > eps && d1F(x(n)) < 1000) && ...
                d2F(x(n)) < eps) || ...
          %OR f is positive, increasing, and concave up      
                (f(x(n)) > eps && d1F(x(n)) > eps && d2F(x(n)) > eps) || ...
          %OR f is positive, increasing, f' is bounded below, and concave down
          (f(x(n)) > eps && (d1F(x(n)) > eps && d1F(x(n)) < 1000) && ...
                d2F(x(n)) < eps) || ...
          %OR f is positive, increasing, and concave up      
                (f(x(n)) > eps && d1F(x(n)) > eps && d2F(x(n)) > eps)       
            x(n) = x(n) - t1;   % Move x_n by t_1 to the left
        end
    end

    % Newton's method
    res = -f(x(n));               % Determine residual for x_n
    DeltaX = res/d1F(x(n));       % Determine Delta x
    x(n+1) = x(n) + DeltaX;       % Update x_n+1 according to x_n + DeltaX
    n = n + 1;                    % Increase iteration counter
    res = -f(x(n));               % Determine residual for x_n
end

x = x(1:n);                     % Shrink x-array to n elements
root = x(end);                  % Determine approx. root as last x_n-value
n = n - 1;                      % Decrease n (since n starts from 1, not 0)

end
