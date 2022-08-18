load('project3.mat')

% Numerical Differentation

%f = @(x) x.^2 + sin(3*x);
%fdiff = @(x) 2*x + 3*cos(3*x);

% h step size
h = 0.01;
%t = 0:h:3;
t = linspace(0,10,501);
%y = f(t);
%ynoise = y + 0.1*rand(1,length(y));
%diffy = fdiff(t);

y = originalfunction;
ynoise = functionwithnoise;
diffy = derivative;


% (f(x+h) - f(x))/h

differentiation1 = (y(2:end) - y(1:end-1))/h;
difft = t(1:end-1);

figure
plot(t,diffy);
hold on;
plot(difft,differentiation1);
hold on;
title('Calculus 1 Numerical Differentiation');
hold off;


% (f(x+h) - f(x-h))/ 2h
differentiation2 = (y(3:end)-y(1:end-2))/(2*h);
difft2 = t(2:end-1);

figure
plot(t,diffy);
hold on;
plot(difft2,differentiation2);
hold on;
title('Symmetric Numerical Differentiation');
hold off;

% (f(x+2h) - f(x)) / (2*h)
differentiation3 = (y(3:end) - y(1:end-2))/(2*h);
difft3 = t(1:end-2);

figure
plot(t,diffy);
hold on;
plot(difft3,differentiation3);
hold on;
title('One Sided Numerical Differentiation');
hold off;

figure
plot(difft,abs(diffy(1:end-1)-differentiation1),'DisplayName','Experiment 1');
hold on;
plot(difft2,abs(diffy(2:end-1)-differentiation2),'DisplayName','Experiment 2');
hold on;
plot(difft3,abs(diffy(1:end-2)-differentiation3),'DisplayName','Experiment 3');
hold on;
title('Error From the Numerical Differentiation (No Noise)');
hold on;
legend;
hold off;

% Noise Plots
noisedifferentiation1 = (ynoise(2:end) - ynoise(1:end-1))/h;
noisedifferentiation2 = (ynoise(3:end)-ynoise(1:end-2))/(2*h);
noisedifferentiation3 = (ynoise(3:end) - ynoise(1:end-2))/(2*h);

figure
plot(t,ynoise);
hold on;
title('Signal with Noise');
hold off;

figure
plot(difft,abs(diffy(1:end-1)-noisedifferentiation1),'DisplayName','Experiment 1');
hold on;
plot(difft2,abs(diffy(2:end-1)-noisedifferentiation2),'DisplayName','Experiment 2');
hold on;
plot(difft3,abs(diffy(1:end-2)-noisedifferentiation3),'DisplayName','Experiment 3');
hold on;
title('Error From the Numerical Differentiation (With Noise)');
hold on;
legend;
hold off;

%Root Mean Square Errors

error1wonoise = sqrt(sum((diffy(1:end-1)-differentiation1).^2)/length(differentiation1));
error2wonoise = sqrt(sum((diffy(2:end-1)-differentiation2).^2)/length(differentiation2));
error3wonoise = sqrt(sum((diffy(1:end-2)-differentiation3).^2)/length(differentiation3));
error1wnoise = sqrt(sum((diffy(1:end-1)-noisedifferentiation1).^2)/length(noisedifferentiation1));
error2wnoise = sqrt(sum((diffy(2:end-1)-noisedifferentiation2).^2)/length(noisedifferentiation2));
error3wnoise = sqrt(sum((diffy(1:end-2)-noisedifferentiation3).^2)/length(noisedifferentiation3));

disp('Root Mean Square Error Without Noise')
fprintf('RMS = %5.3f\n', [error1wonoise,error2wonoise,error3wonoise])
disp('Root Mean Square Error With Noise')
fprintf('RMS = %5.3f\n', [error1wnoise,error2wnoise,error3wnoise])

