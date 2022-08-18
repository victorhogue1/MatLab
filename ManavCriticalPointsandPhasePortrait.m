#Problem 1
f = @(y) y.^2-3*y;
x_domain = [-5,10];
y_domain = [-5,10];
    
    % sets default values of density, color, and width if not specified
        density = 50;
        color = 'k';
        width = 1.25;
    
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
title('Slope field for problem # 1')
    hold off;

    
#Problem 2
f = @(y) 10+3*y-y.^2;
x_domain = [-5,6];
y_domain = [-5,6];
    
    % sets default values of density, color, and width if not specified
        density = 100;
        color = 'k';
        width = 1.25;
    
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
title('Slope field for problem # 2')
    hold off;



#Problem 3
f = @(y) (y.^2)*(4-y.^2);
x_domain = [-8,3];
y_domain = [-8,3];
    
    % sets default values of density, color, and width if not specified
        density = 100;
        color = 'k';
        width = 1.25;
    
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
title('Slope field for problem # 3')
    hold off;
    
    