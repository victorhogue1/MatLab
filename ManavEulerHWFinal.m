%(a) Solve analytically: y' = -2xy + 1
% y' + 2xy = 1
% Solution by integration factor
% I = e^integral(2x) = e^(x^2)
% y'*I + 2xy*I = I
% (I*y)' = I
% I*y = integral(I)
% y = integral(I)/I
% y = integral(e^(x^2))/I
% use Gaussian error function (see Chegg solution for steps)

%(b)
%syms y x
%ode = diff(y,x) == -2*x*y + 1
%ySol(x) = dsolve(ode)
f = @(x,y) -2*x*y+1
%y(0) = 0, therefore C1 = 0
ysol = @(t) (sqrt(pi)/2)*erfi(t).*e.^(-t.^2)
xspan = linspace(-1,3,1000);
%slope_field(f,[-1,3],[-1,3])
x_domain = [-1,3];
y_domain = [-1,3];
%function fig = slope_field(f,x_domain,y_domain,density,color,width)
    
    % sets default values of density, color, and width if not specified
    %if nargin == 3
        density = 20;
        color = 'k';
        width = 1.25;
    %end
    
    % domain limits (rounds values in case non-integers are entered)
    xmin = floor(x_domain(1));
    xmax = ceil(x_domain(2));
    ymin = floor(y_domain(1));
    ymax = ceil(y_domain(2));
    
    % creates mesh
    x = xmin:((xmax-xmin)/density):xmax;
    y = ymin:((xmax-xmin)/density):ymax;
    
    % length of lines
    L = 0.75*(xmax-xmin)/density;
    
    % initializes figure and sets axes limits
    fig = figure;
    axis equal;
    xlim([xmin-L/2,xmax+L/2]);
    ylim([ymin-L/2,ymax+L/2]);
    
    % plots lines (slopes)
    hold on;
    for i = 1:length(x)
        for j = 1:length(y)
            
            % initially assumes the slope will not be indeterminate
            indeterminate = false;
            % calculates slope and avoids division by 0 errors
            try
                slope = f(x(i),y(j));
            catch
                indeterminate = true;
            end
            % angle formed by slope
            if indeterminate
                angle = pi/2;
            else
                angle = atan(slope);
            end
            % calculates components of line
            dx = L*cos(angle)/2;
            dy = L*sin(angle)/2;
            % plots line (but only if slope is real)
            if isreal(slope)
                plot([x(i)-dx,x(i)+dx],[y(j)-dy,y(j)+dy],'color',color,'linewidth',width);
            end
            
        end
    end
    hold off;


hold on
plot(xspan,ysol(xspan),'LineWidth',2)
hold off


% (c)
%Initialize sizes, x, y, and dy vectors to store numerical solutions
n1 = 100;
n2 = 200;
xspan1 = linspace(0,8,n1);
xspan2 = linspace(0,8,n2);
ynum1 = zeros(length(xspan1),1);
dy1 = ynum1;
ynum2 = zeros(length(xspan2),1);
dy2 = ynum2; 
dx1 = xspan1(2) - xspan1(1);
dx2 = xspan2(2) - xspan2(1);

%Euler Process
ynum1(1) = 0;   %y0 = 0 initial condition
ynum2(1) = 0;
%dy(1) = -2*xspan(1)*ynum1(1)+1
%ynum1(2) = ynum1(1) + dx1*dy1(1)

for i = 2:n1
   dy1(i-1) = -2*xspan1(i-1)*ynum1(i-1) + 1;
   ynum1(i) = ynum1(i-1) + dx1*dy1(i-1);
end

for i = 2:n2
   dy2(i-1) = -2*xspan2(i-1)*ynum2(i-1) + 1;
   ynum2(i) = ynum2(i-1) + dx2*dy2(i-1);
end

figure()
plot(xspan1,ynum1)
hold on
plot(xspan2,ynum2)
plot(xspan2,ysol(xspan2))
legend('Num Sol n=100', 'Num Sol n=200', 'Analytic Sol')


%%%%%%
%Sources:
%slope_field function
%https://www.mathworks.com/matlabcentral/fileexchange/85433-slope-field-generator-for-odes-slope_field

