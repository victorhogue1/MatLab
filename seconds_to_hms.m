clc
clear
format compact

for i = 1:3
    time = input('\nEnter time in seconds: ');
    h = floor(time/3600);
    m = floor((time-3600*h)/60);
    s = time-3600*h-60*m;
    fprintf('Time: %.i seconds = %.f hours, %.f minutes, %.i seconds\n',time,h,m,s)
end

