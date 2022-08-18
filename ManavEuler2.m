%Problem #1
xmin = -5;
xmax = 10;
ymin = -5;
ymax = 10;
points = 50;
x = linspace(xmin, xmax, points);
y = linspace(ymin, ymax, points);
[X Y] = meshgrid(x,y);
f = @(x,y) y.^2 - 3*y;
dY = f(X,Y);
dX = ones(size(dY));
L = sqrt(dX.^2 + dY.^2);

quiver (X, Y, dX./L , dY./L , 0.5); # scaling factor 0.5
axis([xmin xmax ymin ymax],'square');         # square resolution
title('Slope field for Problem #1')
grid on;
xlabel('x');
ylabel('y');
k = 0; %counter for equilibrium (critical) points
critical = zeros(10,2);

for i = 1:(length(dY)-1)
  if (((dY(i,1)>0)&&(dY(i+1,1)<0))||((dY(i,1)<0)&&(dY(i+1,1)>0)))
     k = k + 1;
     critical(k,:) = [x(i),y(i)];
  end
end

fprintf('The critical points located at Y = %5.3f is asymptotically stable.\n',critical(1,1))
fprintf('The critical points located at Y = %5.3f is unstable.\n',critical(1,2))