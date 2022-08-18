%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Final Project Structure with Code
%   A Boat Traversing a River
%
%   Author: Marcus Rüter
%   Date: 08/11/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear Cache
..
    
%% Initialization
..
color = lines(6);           % Default Matlab colors for piecewise plots
B = ..;                     % Point B [m]
delta = ..;                 % delta [m] to create B+delta
vB = 5;                    % Boat velocity [m/s]
x0 = ..;  %0 or 3.65?                  % Start x-value [m]
y0 = ..;  %0 or use p(x0)?                  % Initial condition [m]
theta = pi/3 ;                 % Start value of theta
nSI = [4,16,64,256];                 % Array of numbers of subintervals
nSIMax = nSI(end);          % Maximum number of subintervals
nN = nSI+..;                % Array of numbers of nodes
h = (..) ./ nSI;            % Array of step sizes
nRun = length(nSI);         % Number of runs
y = zeros(nRun,nN(end));    % Array of y-values at nodes x_i
w = zeros(nRun,nN(end));    % Array of w-values at nodes x_j
T = zeros(..);              % Array of travel times
nPP = nN(end)*10+1;         % Number of points for plotting
xPlot = linspace(x0,B,nPP); % x-values for plotting (1D array)
yPlot = zeros(nRun,nPP);    % y-values for plotting for all runs (2D array)
xRiver = [..];              % x-values of river data points
vRiver = [..];              % v-values of river data points
xRiverScaled = xRiver/B;    % Scaled xRiver-values for least squares
nDP = length(..);           % Number of river data points
polyOrd = ..;               % Polynomial order for least squares
p = zeros(polyOrd,nDP);     % Vector of basis functions
M = zeros(polyOrd,polyOrd); % M-matrix
b = zeros(polyOrd,1);       % Right-hand side b-vector

set(0,'DefaultFigureRenderer','painters');  % Create vector graphics

%% Least-squares Data Fitting
%Do the least squares fitting of vR(x) with a polynomial of degree <= 7
%Don't use basis functions - not necessary, just the least squares fit
%HW 6 P1
..
xdata = [0,1,2,3,4,5,6,7,8];
vRdata = [6,8,3,5,3,4,2,1,3];
p = polyfit(xdata,vRdata,7);   %Mp = b;
%vRapprox(x) = p(1)*x^7 + p(2)*x^6 + ...

%% Anonymous Functions:
% f(x) for linear IVP
% Y(x) = f(x); Y(A) = 0;
% fLin = @(x) (vR(x)./(vB.*cos(theta))) - tan(theta);
fLin = @(x,theta) computeLSRiverVel(B,polyOrd,aLS,x')/..;

% f(x,y(x)) for non-linear IVP
% fNonLin = @(x,y)) (vR(x)/vB).*(sqrt((B-x.^2)+y.^2(x))/(B-x)) - y(x)/(B-x);  
fNonLin = @(x,y) computeLSRiverVel(B,polyOrd,aLS,x')/.. 
% Derivative of f(x,y(x)) w.r.t. y for non-linear IVP
dfNonLinDy = @(x,y) computeLSRiverVel(B,polyOrd,aLS,x') .*..;
% Integrand for numerical integration
f = @(x,y) sqrt( .. );

%% Compute Numerical Results for Linear or Non-linear IVP
if whichProblem == 1            % Find (fixed) theta only for linear IVP
    %???..
    y(end,end) = 10;            % Large value at y(B) to start while loop
    yPlot(end,end) = 10;        % Large val. at yPlot(B) to st. while loop

    % Loop until y(B) <= 0.1 or yPlot(B) <= 0.1 (for collocation method)
    while (y(B) > 0.1 && yPlot(B) > 0.1)
        % Decrease theta
         theta 
        [y(end,:),~] = yourMethod(..);
        % or
        [yPlot(end,:),~] = yourCollocationMethod(..);
    end

% Solve linear or non-linear IVP
for ..            
    ..

    if whichProblem == 1        % Linear IVP
        problem = "Linear Problem";         % Define problem for plot

        [y(i,1:nN(i)),method] = yourMethod(..);
        % or
        [yPlot(i,:),method] = yourCollocationMethod(..);
    else                        % Non-linear IVP
        problem = "Non-linear Problem";     % Define problem for plot

        [y(i,1:nN(i)),method] = yourMethod(..);
        % or
        [yPlot(i,:),w(i,1:nN(i)),method] = yourCollocationMethod(..);
    end
end

%% (Numerical) Integration (and Interpolation for Non-linear IVP)
for ..           
    ..

    if whichProblem == 1                % Linear IVP
        ..
    else                                % Non-linear IVP
        % Determine evaluation points x_EP
        
        [yEP,~] = evaluateInterpolant(..);
        %or
        % Initialize y_EP
        % Determine y_EP based on w-values and phi-functions

        [..] = yourMethod(f,xEP,yEP);
   end
end

%% Interpolation for Plotting (only for non-collocation methods)
for ..
    ..

    [yPlot(i,:),interpolant] = evaluateInterpolant(..);
end

%% Plot Results
figure(1);                                  % Open Figure 1

% Title for collocation method
titleText = sprintf('%s, %s, %s',problem,method,integration);
% or
% Title for all other methods
titleText = ...
        sprintf('%s, %s, %s, %s',problem,method,interpolant,integration);

title(titleText);                           % Create title
xlabel('$x$ [m]','interpreter','latex');    % x-label
xlim([x0 B]);                               % x-limits
set(gcf,'Position',[30 350 1250 750]);      % Plot window size and position
set(gca,'LineWidth',2,'FontSize',18);       % Axes line width and font size
grid on;                                    % Turn on grid
hold on;                                    % Set hold to on

colororder({'k','k'});                      % Color order for two y-axes
yyaxis right;                               % Define right y-axis
ylabel('$v_R$ [m/s]','interpreter','latex');% y-label for right y-axis
ylim([-0.5 5]);                             % y-limits for right y-axis

% Plot LS fitting function plus horizontal line (optional) and data points
plot(xPlot,vRPlot,'-','LineWidth',2,'Color',color(1,:));
plot([x0 B],[0 0],'-','LineWidth',2,'Color',color(1,:));
plot(xRiver,vRiver,'o','MarkerSize',8,'Linewidth',2,'Color',color(2,:));

% Plot arrows to indicate direction of current (optional)
arrowsX = x0+10:(B-20)/40:B-10;             % x-positions of arrows
arrowsY = zeros(length(arrowsX),1);         % y-positions of arrows
vR = computeLSRiverVel(B,polyOrd,aLS,arrowsX);  % River velocity at x-pos.
quiver(arrowsX',vR-0.05,arrowsY,vR-0.05,'-^','LineWidth',2,...
    'AutoScale','off','ShowArrowHead','off','Alignment','head',...
    'MarkerSize',4,'Color',color(1,:));     % Plot arrows

yyaxis left;                                % Define left y-axis
ylabel('$y$ [m]','interpreter','latex');    % y-label for left y-axis
% y-limits for left y-axis based on maximum values of numerical results
ylim([floor(min(yPlot(2,:))/20)*20 ceil(max(yPlot(2,:))/20)*20]);

for i = 1:nRun                              % Loop over all runs
    % Plot numerical solution y(x)
    p(i) = plot(xPlot, yPlot(i,:),'-','LineWidth',3,'Color',color(i+2,:));

    % Add data points only if needed
    plot(x0:h(i):B, y(i,1:nN(i)),'o','LineWidth',3,'Color',...
        color(i+2,:),'MarkerSize',10/i,MarkerFaceColor=color(i+2,:));
end

% Create plot legend
legend([p(1) p(2) p(3) p(4)],...
    sprintf('$y_1(x)$, $y_1(B) = $ %3.2em, $T_1 = $ %5.3fs',...
    yPlot(1,end),T(1)),...
    sprintf('$y_2(x)$, $y_2(B) = $ %3.2em, $T_2 = $ %5.3fs',...
    yPlot(2,end),T(2)),...
    sprintf('$y_3(x)$, $y_3(B) = $ %3.2em, $T_3 = $ %5.3fs',...
    yPlot(3,end),T(3)),...
    sprintf('$y_4(x)$, $y_4(B) = $ %3.2em, $T_4 = $ %5.3fs',...
    yPlot(4,end),T(4)),...
    'Location','NW','interpreter','latex');

%% Function computeLSRiverVel
function [vRAtX] = computeLSRiverVel(B,polyOrd,a,x)

..

end

%% Function computeFEulerLinSol
function [y,method] = computeFEulerLinSol(y0,f,theta,x)

..

end

%% Function computeBEulerLinSol
function [y,method] = computeBEulerLinSol(y0,f,theta,x)

..

end

%% Function computeTrapezoidalLinSol
function [y,method] = computeTrapezoidalLinSol(y0,f,theta,x)

..

end

%% Function computeHeunLinSol
function [y,method] = computeHeunLinSol(y0,f,theta,x)

..

end

%% Function computeCollocationLinSol
function [y,method] = computeCollocationLinSol(y0,f,theta,x,xPlot)

% Initialization
..

eps = 1/(2*h);                      % Shape parameter (depending on h)
..

for ..                              % Loop over all columns of A
    % Determine A(1,j) by evaluating phi_j(x_1)
end

for ..                              % Loop over all remaining rows of A
    for ..                          % Loop over all columns of A
        % Determine A(i,j) by evaluating phi'_j(x_i)
    end
end

% Determine right-hand side vector b

% Solve linear system for weights w

for ..                              % Loop over all points for plotting
    for ..                          % Loop over all rows of w
        % Construct solution y(xPlot) at all points included in xPlot
    end
end

end

%% Function evaluatePhiJatX
function phiVal = evaluatePhiJatX(nodeJ,x,eps,deriv)

% Initialization
% Define radius r(x - x_j)

if deriv == 0                       % Determine function (0th derivative)
    % Evaluate MQ radial basis function phi_j
elseif deriv == 1                   % Determine first derivative
    % Determine first derivative of MQ function phi_j
end

end

%% Function computeFEulerNonLinSol
function [y,method] = computeFEulerNonLinSol(y0,f,x)

..

end

%% Function computeBEulerNonLinSol
function [y,method] = computeBEulerNonLinSol(y0,f,dfdy,x)

..

end

%% Function computeTrapezoidalNonLinSol
function [y,method] = computeTrapezoidalNonLinSol(y0,f,dfdy,x)

..

end

%% Function computeHeunNonLinSol
function [y,method] = computeHeunNonLinSol(y0,f,x)

..

end

%% Function computeCollocationNonLinSol
function [y,w,method] = computeCollocationNonLinSol(y0,f,dfdy,x,xPlot)

% Initialization
..
eps = 1/(2*h);                      % Shape parameter (depending on h)
..

for ..                              % Loop over all nodes
    for ..                          % Loop over all rows of w
        % Construct solution y(x_i) based on w at all nodes x_i
        % Construct derivative y'(x_i) based on w at all nodes x_i
    end
end

% Compute residual

% Loop until ||res|| <= tol or k >= maxIt
    for ..                          % Loop over all columns of J
        % Determine J(1,j) by evaluating phi_j(x_1)
    end

    for ..                          % Loop over all remaining rows of J
        for ..                      % Loop over all columns of J
            % Deter. J(i,j) by eval. phi'_j(x_i) - dfdy(x_i,y_i)*phi_j(x_i)
        end
    end

    % Compute Delta from J Delta = res

    % Update w
    % Update k

    % Reinitialize yAtXi to recalculate elements
    % Reinitialize yPrimeAtXi to recalculate elements

    for ..                          % Loop over all nodes
        for ..                      % Loop over all rows of w
            % Construct solution y(x_i) based on w at all nodes x_i
            % Construct derivative y'(x_i) based on w at all nodes x_i
        end
    end

    % Update residual
end

if k == maxIt                       % Output err. mess. if maxIt is reached
    error('Maximum number of iterations reached');
end

for ..                              % Loop over all points for plotting
    for ..                          % Loop over all rows of w
        % Construct solution y(xPlot) at all points included in xPlot
    end
end

end

%% Function evaluateInterpolant
function [yEP,interpolant] = evaluateInterpolant(whichInterpolant,x,y,xEP)

switch whichInterpolant     % Choose interpolant
    % Depending on the problem, there might be different cases. In each
    % case:
    [yEP,interpolant] = yourMethod(x,y,xEP);
end

end

%% Function evaluatePieceLinInterpolant
function [yEP,interpolant] = evaluatePieceLinInterpolant(x,y,xEP)

% Initialization
interpolant = 'Piecewise Linear Interpolant';   % Define interpol. for plot
h = x(2) - x(1);                    % Reconstruct h based on nodes x_i
nSI = (x(end) - x(1))/h;            % Reconstruct n_SI based on nodes x_i
nEP = length(xEP);                  % Number of evaluation points
yEP = zeros(nEP,1);                 % Interpolant at evaluation points x_EP

% Define Lagrangean basis functions as anonymous functions
L_i = @(xEPinSI,i) (xEPinSI-x(i+1)) / ..;
L_ip1 = @(xEPinSI,i) (xEPinSI-x(i)) / ..;

for ..                              % Loop over all subintervals
    % Find indices of evaluation points x_EP that are inside subinterval i
    indices = find(xEP >= x(i) & xEP <= x(i+1));

    % Evaluate Lagrangean interpolant at x_EP inside subinterval i
    yEP(indices) = y(i)*L_i(xEP(indices),i) + ..;
end

end

%% Function evaluatePieceQuadInterpolant
function [yEP,interpolant] = evaluatePieceQuadInterpolant(x,y,xEP)

..

% Define Lagrangean basis functions as anonymous functions
L_i = ..
..

for ..                              % Loop over every other subinterval
    % Find indices of eval. points x_EP that are inside subinter. i and i+1
    indices = find(xEP >= x(i) & xEP <= x(i+2));

    % Evaluate Lagrangean interpolant at x_EP inside subintervals i and i+1
    yEP(indices) = y(i)*L_i(xEP(indices),i) + ..;
end

end

%% Function evaluateCubicSpline
function [yEP,interpolant] = evaluateCubicSpline(x,y,xEP)

% Initialization
..
M = zeros(n,1);                     % Vector of M_i-values
f = zeros(n,1);                     % Right-hand side vector f
g = zeros(n-2,1);                   % Right-hand side vector g
a = h/6*ones(n-2,1);                % Vector a of lower diagonal elements
b = 2*h/3*ones(n-2,1);              % Vector b of diagonal elements
c = h/6*ones(n-3,1);                % Vector c of upper diagonal elements
alpha = zeros(n-2,1);               % Vector alpha
beta = zeros(n-2,1);                % Vector beta
nLU = n-2;                          % Define nLU for n in LU-factorization

for ..                       % Loop over all rows of f from 2 to n-1
    % Calculate right-hand side vector f
end

% Incorporate natural cubic spline boundary conditions        
f = f(2:n-1);                       % Shrink f-vector

% Determine LU-factorization:
% Define beta_1-value

for ..                              % Loop over remaining rows
    alpha(j) = ..                   % Compute alpha_j
    beta(j) = ..                    % Compute beta_j
end

% Employ forward substitution to solve Lg=f:
% Define g_1-value

for ..                              % Loop over remaining rows
    g(j) = ..                       % Compute g_j
end

% Employ back substitution to solve UM=g:
M(n-1) = ..;                        % Define M_n-value

for ..                              % Loop over remaining rows
    M(j+1) = ..;                    % Compute M_j
end

% Determine natural cubic spline:
for ..                              % Loop over all end points of subinter.
    % Find indices of eval. points x_EP that are inside subinterval j-1
    indices = find(xEP >= x(j-1) & xEP <= x(j));

    % Evaluate natural cubic spline at x_EP inside subinterval j-1
    yEP(indices) = ((x(j)-xEP(indices)).^3 * M(j-1) + ..;
end

end

%% Function evaluateRBFInterpolant
function [yEP,interpolant] = evaluateRBFInterpolant(x,y,xEP)

% Initialization
..
eps = 1/(2*h);                      % Shape parameter (depending on h)
..

for ..                              % Loop over all rows of A
    for ..                          % Loop over all columns of A
        % Determine A(i,j) by evaluating phi_j(x_i)
    end
end

% Solve linear system for weights w

for ..                              % Loop over all evaluation points
    for ..                          % Loop over all rows of w
        % Construct solution y(x_EP) at all evaluation points x_EP
    end
end

end

%% Function computeTrapezoidalRuleSol
function [TnSI,integration] = computeTrapezoidalRuleSol(f,x,y)

% Initialization
..

% Calculate T_nSI according to the trapezoidal rule
TnSI = h/2*(..);

end

%% Function computeSimpsonsRuleSol
function [SnSI,integration] = computeSimpsonsRuleSol(f,x,y)

% Initialization
..

% Calculate S_nSI according to Simpson's rule
SnSI = h/3*(..);

end

%% Function compute1pGaussQuadSol
function [InSI,integration] = compute1pGaussQuadSol(f,x,y)

% Initialization
..

% Calculate I_nSI according to 1-point Gauss quadrature
InSI = ..;

end

%% Function compute2pGaussQuadSol
function [InSI,integration] = compute2pGaussQuadSol(f,x,y)

% Initialization
..

% Calculate I_nSI according to 2-point Gauss quadrature
InSI = ..;

end
