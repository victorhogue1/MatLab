%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   HW#7 P1 Template
%   Numerical schemes to solve IVPs
%
%   Authors: Elias Gueidon and Marcus Rüter
%   Date: 07/2019 and 08/03/2022
%   Edited by: Caleb Chung
%   Date: 8/12/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Please fill in the missing parts as indicated by "..", or write your own
% Matlab script

%% Clear Cache
clc;
clearvars;
close all;
    
%% Initialization

h = [0.5,0.25,0.125,0.0625];                                       % Array of step sizes
X = [2,3,4,5,6,7];                                       % x-values of interest
x0 = 1;                                        % Start x-value
b = 8;                                         % End x-value
y0 = 2;                                        % Initial value y_0
set(0,'DefaultFigureRenderer','painters');      % Create vector graphics
whichMethod = 3;                               % 1 - Forward Euler method
                                                % 2 - Backward Euler method
                                                % 3 - Trapezoidal method
                                                % 4 - Heun's method
                                                % 5 - New method

results = zeros(length(h),length(X));           % Results array
dataPlot1 = zeros(length(x0:h(1):b),1);         % Plot1 array
dataPlot2 = zeros(length(x0:h(end):b),1);       % Plot2 array

% Anonymous functions
f = @(x,y) (sin(2*x)-2*x*y)/(x^2);                                  % f(x,y)-function
dfdy = @(x,y) -2/x;                               % Derivative df(x,y)/dy
Y = @(x) (4+cos(2)-cos(2*x))/(2*x^2);                                    % True solution Y(x)

%% Compute Numerical Results
% Loop over h-array to compute all y_n+1 for different step sizes h
for i = 1:length(h)
    x = x0:h(i):b;                              % Nodes array
    nSI = (b-x0)/h(i);                          % Number of subintervals
    
    switch whichMethod                          % Numerical methods
        case 1
            [y,method] = computeFEulerSol(y0,f,x);
        case 2
            [y,method] = computeBEulerSol(y0,f,dfdy,x);
        case 3
            [y,method] = computeTrapezoidalSol(y0,f,dfdy,x);
        case 4
            [y,method] = computeHeunSol(y0,f,x);
        case 5
            [y,method] = computeNewMethodSol(y0,f,x);
        otherwise
            error('Unknown numerical method!');
    end
    
    % Loop over x-values of interest to store results
    for j = 1:length(X)
        id = (X(j) - x0) / (h(i)) + 1;
        results(i,j) = y(id);
    end
    
    % Store results for plots of first and last element in h-array
    if i == 1
        dataPlot1 = y;
    elseif i == length(h)
        dataPlot2 = y;
    end
end

% Compute (true) errors at x-values of interest
errors = Y(X) - results;

%% Plot Results
figure(1);
xPlot = linspace(x0,b,2000);
hold on;
grid on;
title(sprintf('HW #7, Problem 1, %s',method));
xlabel('$x$','interpreter','latex');
ylabel('$y$','interpreter','latex');
xlim([x0 b]);
ylim([-0.2 2]);
plot(xPlot,Y(xPlot), 'LineWidth',4);
plot(x0:h(1):b,dataPlot1,'.-', 'LineWidth',2, 'MarkerSize',18);
plot(x0:h(end):b,dataPlot2,'.-', 'LineWidth',2, 'MarkerSize',18);
legend('True solution $Y(x)$','Approx. solution $y(x)$ w/$h = 0.5$',...
    'Approx. solution $y(x)$ w/$h = 0.0625$','Location','NE',...
    'interpreter','latex');
set(gcf,'Position',[30 350 1200 750]);
set(gca,'LineWidth',2,'FontSize',20);

%% Output Results
fprintf('y-values at x-values of interest:\n');
fprintf('--------------y-----------------------------------------------------------------------------\n');
fprintf('    h         %2d           %2d           %2d           %2d           %2d           %2d\n',X');
fprintf('-------------------------------------------------------------------------------------------\n');
fprintf(' %.4f  %11.8f  %11.8f  %11.8f  %11.8f  %11.8f  %11.8f\n',...
    [h',results]');

fprintf('\nTrue errors at x-values of interest:\n');
fprintf('-------------------------------------------------------------------------------------------\n');
fprintf('    h         %2d           %2d           %2d           %2d           %2d           %2d\n',X');
fprintf('-------------------------------------------------------------------------------------------\n');
fprintf(' %.4f  %11.8f  %11.8f  %11.8f  %11.8f  %11.8f  %11.8f\n',...
    [h',errors]');

fprintf('\nRatio at which the error decreases:\n');
fprintf('-------------------------------------------------------------\n');
fprintf(' x   %.4f  -->  %.4f  -->  %.4f  -->  %.4f\n', h');
fprintf('-------------------------------------------------------------\n');
fprintf('%2d         %.5f      %.5f      %.5f\n',...
    [X',(errors(1:end-1,:) ./ errors(2:end,:))']');

%% computeFEulerSol Function
function [y,method] = computeFEulerSol(y0,f,x)

% Initialization
method = 'Forward Euler Method';    % Define method for plot
h = x(2) - x(1);                    % Step size h
nSI = (x(end) - x(1))/h;           % Number of subintervals
y = zeros(nSI);                      % y-array (approximate solution)
y(1) = y0;                          % Initial condition

% Loop over all subintervals
for n = 1:nSI
    % Compute y_n+1 according to the Forward Euler method
    y(n+1) = y(n) + h*f(n);
end

end

%% computeBEulerSol Function
function [y,method] = computeBEulerSol(y0,f,dfdy,x)

% Initialization
method = 'Backward Euler Method';   % Define method for plot
h = x(2) - x(1);                    % Step size h
nSI = (x(end) - x(1))/h;           % Number of subintervals
y = zeros(nSI);                      % y-array (approximate solution)
y(1) = y0;                          % Initial condition
eps = 1e-12;                        % Tolerance
maxIt = 150;                        % Maximum number of iterations
whichMethod = 1;                   % 1 - Newton's method
                                    % 2 - Predictor-corrector method

% Loop over all subintervals
for n = 1:nSI
    j = 1;                          % Iteration index
    ynp1 = zeros(1,maxIt);          % y_n+1^(j) initialization
    
    % Initial guess/predictor based on the Forward Euler method
    ynp1(j) = y(n) + h*f(x(n),y(n));
    
    if whichMethod == 1
        % Compute initial residual res = -F
        res = -(ynp1(j) - y(n) - h*f(x(n+1),ynp1(j)));
        
        % Loop until |res| <= eps or j >= maxIt
        while abs(res) > eps && j < maxIt
            % Compute first-order derivative of F = -res
            dFdy = 1 - h*dfdy(1/y(n));
            
            % Compute delta from F' delta = res
            delta = res/dFdy;
            
            % Update ynp1, j, and residual
            ynp1(j+1) = ynp1(j) + h*f(x(n),y(n));
            j = j+1;
            res = -(ynp1(j) - y(n) - h*f(x(n+1),ynp1(j)));
        end
    else
        % Compute initial corrector
        ynp1(j+1) = y(n) + h*f(x(n),y(j));
        
        % Loop until |y_n+1^(j+1) - y_n+1^(j)| <= eps or j >= ma     xIt
        while abs(ynp1(j+1)-ynp1(j)) > eps && j < maxIt
            % Update j
            j = j+1;
            
            % Compute corrector
            ynp1(j+1) = y(n) + h*f(x(n),y(j));
        end
    end

    % Define y_n+1 as last Newton/Predictor-corrector iteration
    y(n+1) = ynp1(j);
end

end

%% computeTrapezoidalSol Function
function [y,method] = computeTrapezoidalSol(y0,f,dfdy,x)

% Initialization
method = 'Trapezoidal Method';      % Define method for plot
h = x(2) - x(1);                    % Step size h
nSI = (x(end) - x(1))/h;           % Number of subintervals
y = zeros(nSI);                      % y-array (approximate solution)
y(1) = y0;                          % Initial condition
eps = 1e-12;                        % Tolerance
maxIt = 150;                        % Maximum number of iterations
whichMethod = 1;                   % 1 - Newton's method
                                    % 2 - Predictor-corrector methodm

% Loop over all subintervals
for n = 1:nSI
    j = 1;                          % Iteration index
    ynp1 = zeros(1,maxIt);          % y_n+1^(j) initialization
    
    % Initial guess/predictor based on the Forward Euler method
    ynp1(j) = y(n) + h*f(x(n),y(n));
    
    if whichMethod == 1
        % Compute initial residual res = -F
        res = -(ynp1(j) - y(n) - h/2*(f(x(1),y0)+f(x(1)+h,ynp1(j))));
        
        % Loop until |res| <= eps or j >= maxIt
        while abs(res) > eps && j < maxIt
            % Compute first-order derivative of F = -res
            dFdy = 1 - h/2*dfdy(x(n),y(n));
            
            % Compute delta from F' delta = res
            delta = res/dFdy;
            
            % Update ynp1, j, and residual
            ynp1(j+1) = ynp1(j) + delta;
            j = j+1;
            res = -(ynp1(j) - y(n) - h/2*(f(x(n),y(n))+f(x(n)+h,ynp1(j))));
        end
    else
        % Compute initial corrector
        ynp1(j+1) = y(n) + h/2*(f(x(1),y0)+f(x(1)+h,ynp1(j)));
        
        % Loop until |y_n+1^(j+1) - y_n+1^(j)| <= eps or j >= maxIt
        while abs(ynp1(j+1)-ynp1(j)) > eps && j < maxIt
            % Update j
            j = j+1;
            % Compute corrector
            ynp1(j+1) = y(n) + h/2*(f(x(n),y(n))+f(x(n)+h,ynp1(j)));
        end
    end
    
    % Define y_n+1 as last Newton/ssssssssssssssssssssssssssssssssssadfPredictor-corrector iteration
    y(n+1) = ynp1(j);
end

end

%% computeHeunSol Function
function [y,method] = computeHeunSol(y0,f,x)

% Initialization
method = 'Heun''s Method';          % Define method for plot
h = x(2) - x(1);                    % Step size h
nSI = (x(qend) - x(1))/h;           % Number of subintervals
y = zeros(nSI);                      % y-array (approximate solution)
y(1) = y0;                          % Initial condition

% Loop over all subintervals
for n = 1:nSI
    % y_n+1 based on the Forward Euler method
    yFEnp1 = y(n) + h*f(x(n),y(n));   
    % Compute y_n+1 according to Heun's method
    y(n+1) = y(n) + h/2*(f(x(n),y(n))+f(x(n)+h,yFEnp1));
end

end

%% computeNewMethodSol Function
function [y,method] = computeNewMethodSol(y0,f,x)

% Initializatio                                                                                                                       n
method = 'New Method';              % Define method for plot
h = x(2) - x(1);                    % Step size h
nSI = (x(end) - x(1))/h;           % Number of subintervals
y = zeros(nSI);                      % y-array (approximate solution)
y(1) = y0;                          % Initial condition

% Loop over all subintervals
for n = 1:nSI
    % Compute y_n+1 according to the new method
    y(n+1) = y(n) + (h/2)*f(x(n),y(n));
end

end
