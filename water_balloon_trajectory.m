clc
clear
format compact
close all
%Use v0 = 50
g = 9.8067;
th = [15:15:75];
v0 = input('Enter v0: ');
max_D = max(v0^2*sind(2*th)/g);
x = [0:max_D];
a = tand(th);
b = g./(2*(v0*cosd(th)).^2);
colors = ['b','g','r','c','m'];
hold on
for i = 1:length(th)
    y = a(i)*x-b(i)*x.^2;
    y_pos = y(find(y>=0))
    new_y = [y_pos,0*[length(y_pos):max_D]]
    plot(x,new_y,colors(i))
end
xlabel('Distance')
ylabel('y(x)')
legend('th = 15','th = 30','th = 45','th = 60','th = 75','location','best')
hold off