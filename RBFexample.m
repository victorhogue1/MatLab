#1. Create RBF interpolation using
#rbf=rbfcreate(x, f); #?x? ? coordinates of the nodes and ?f? - values of the function at the nodes

rbf = rbfcreate(x, f ,'RBFFunction', 'multiquadric');

#2. Calculate interpolated values ?fi? at nodes ?xi? using
fi = rbfinterp(xi, rbf); #rbf ? is structure returned by rbf=rbfcreate(x, f)

%1D example
x = 0:1.25:10; 
f = sin(x);
xi = 0:.1:10;

%Matlab interpolation
fi = interp1(x,f,xi);

% RBF interpolation
rbf=rbfcreate(x, f);
fi = rbfinterp(xi, rbf);

%2D example
x = rand(50,1)*4-2; 
y = rand(50,1)*4-2; 
z = x.*exp(-x.^2-y.^2);

ti = -2:.05:2;
[XI,YI] = meshgrid(ti,ti);

%Matlab interpolation
ZI = griddata(x,y,z,XI,YI,'cubic');

%RBF interpolation
rbf=rbfcreate([x'; y'], z');
ZI = rbfinterp([XI(:)'; YI(:)'], op);
ZI = reshape(ZI, size(XI));

#Optional parameters:

##1. Radial Base Function:
##rbfcreate(x, f ,'RBFFunction', 'multiquadric');
##available RBF functions are: multiquadric, gaussian, linear, cubic, thinplate
##2. Smoothing level: (must be a positive scalar)
##rbfcreate(x, f ,'RBFSmooth', 0.1);
##3. Multiquadric and gaussian functions have definable constants
##rbfcreate(x, f ,?RBFConstant', 0.1);
##
##RBF interpolation usually produces much better results that standard Matlab functions but computation complexity of RBF interpolation is n^3 thus it is not recommended to use it for more then 2000 nodes.