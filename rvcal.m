function [RV] = rvcal(omega,R,C)
%Calculates RV, the ratio of magnitudes of voltages for a low pass RC
%filter
RV =(sqrt(1+(omega.*R.*C).^2)).^(-1);
end

