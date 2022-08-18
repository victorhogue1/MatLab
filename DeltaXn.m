%Dxn function
%Inputs: function J (2x2), residual function r (2x1), xn_minus_1
function Dxn = DeltaXn(J11,J12,J21,J22,r1,r2,xn_minus_1)
x1 = xn_minus_1(1);
x2 = xn_minus_1(2);
J = [J11(x1,x2), J12(x1,x2); J21(x1,x2), J22(x1,x2)];
r = [r1(x1,x2),r2(x1,x2)]';
Dxn = -1*inv(J)*r;
end

