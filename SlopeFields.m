# Slope Fields
% define input values
clear; clc;             % clear memory
tic;
x = linspace(-4,4,30);  % Define linear space
y = x;                  % copy x into y
[X Y] = meshgrid(x,y);  % create grid
f = @(x,y)(y + 2).*(y-2); % define function rhs of DE

% deltay , relative to 1 unit deltax
dY = f(X,Y);
dX = ones(size(dY)) ;


L = sqrt(dX.^2 + dY.^2) ;     % used to normalize vectors

% plot the field
quiver(X,Y,dX./L ,dY./L ,0.5) % scaling factor 0.5

axis([-4 4 -4 4],'square');
grid on;
title('Plot os Slope Field');
xlabel('x');
ylabel('y');
hold on;

% Graph of particular solution
g = @(x,y)(-2*exp(4*x) + 2) ./ (1 + exp(4*x));
plot(x,g(x,y),'r');
disp('*************************');
disp('Summary of Results');
toc;                % end timer and display time
disp('End of Run')  % tell user code has ended 
disp('*************************');