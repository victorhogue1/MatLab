%Robert's Monster
%Variable definitions
% t = time is a set of time intervals dt, where t = [0,120] seconds
% dt = discrete time interval
% n = number of intervals 
total_time = 120; %seconds
n = 120;
dt = total_time/n;
t = 0:dt:(total_time-1);  %[0,119] has length 120
% theta = angle (position of the drum spinning ccw with normal vector 
%         coaxially with the rod)
theta = 0; % [theta] = (radians)
w = 0;     % [omega] = angular velocity (rad/s) = d/dt theta
alpha = 0; % [alpha] = angular accelerationo (rad/s^2) = d/dt w = d^2/dt^2 theta
Ft = 0; % [Ft] = tangential force on drum (Newtons), [N] = [kg*m/s^2]
Fc = 0; % [Fc] = centripetal force (inward force, N)
% Pamb = ambient air pressure; 
Pamb = 0; %(Pascals = Newtons/Meter), (similar to PSI = pounds per square inch)

%Period
T = 0; %[T] = period (s)
f = 1; %[f] = frequency ([Hz] = [1/s] or [cycles/sec])
%Note: f = 2*pi*w

g = 9.8; %[g] = accelration due to gravity [m/s^2]

%Dimensions
Rout = 11.5; %in inches***[r] = radius of drum [m]
Rin = 10.5; %inches*** -- convert to meters [m]
Lrod = 8; %inches*** length of the rod [m]
Rrod = 0.5; %inches*** radius of the rod [m]


%Stages Defintions
%Stage 1: t = [0, t1]. In this stage, the drum begins at rest w0 = 0 and 
%slowly accelerates 

%Stage 2: t = (t1, t2]. 

%Stage 3: t = (t2, t3]

%Stage 4: t = [t4, tf]



