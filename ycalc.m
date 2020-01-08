function [y] = ycalc(x)
%Calculates the function y given x
y = -0.2*x.^4+exp(-0.5*x).*x.^3+7*x.^2;
end

