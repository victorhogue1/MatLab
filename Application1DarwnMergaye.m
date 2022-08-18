% Homework Application 1
% Darwn Mergaye`
% Date: 1/27/2022

clear
clc

%Problem 1
%(a) Load image
load puppy

%(b) Create brightened copy
puppy2 = puppy + 50;

%(c) Create contraat scaleed image
a = 0.5/255;
b = 0.5;
y = single (puppy);
z = a*y.^2 + b*y; %Assumed elementwise exponent because unable to square a non-square matrix
puppy3 = uint8(z);

%(d) Create darkest parts extracted image
puppy4 = puppy.*(puppy - puppy3);

%Display results in figure
figure
subplot(2,2,1)
imshow(puppy)
title('(1) Original')
subplot(2,2,2)
imshow(puppy2)
title('(2) Brightened')
subplot(2,2,3)
imshow(puppy3)
title('(3) Contrast Scaled')
subplot(2,2,4)
imshow(puppy4)
title('(4) Darkest Features')

%Save images as jpg
print -djpg puppies.jpg

%Problem 2
%Initial message
msg = 'We hold these truths to be self-evident, that all men are created equal, that they are endowed by their Creator with certain unalienable Rights, that among these are Life, Liberty and the pursuit of Happiness.';
%Calculate message length and create encryption key
msglen = length(msg);
key = randi(11,1,msglen) - 6;
%Encrypt message
msgencrypt = char(msg + key);

%Display encrypted and unencrypted messages
disp('Encrypted message:')
disp(msgencrypt)
disp('Unencrypted message:')
disp(char(msgencrypt - key))

%Problem 3
%Construct independent variable partition from -2pi to 2pi
t = linspace(-2*pi,2*pi,1000);

%Construct the three partial harmonics and sawtooth function
fun1 = @(t) (8/pi^2)*cos(t);
fun2 = @(t) (8/pi^2)*cos(t) + (8/(9*pi^2))*cos(3*t);
fun3 = @(t) (8/pi^2)*cos(t) + (8/(9*pi^2))*cos(3*t) + (8/(25*pi^2))*cos(5*t) + (8/(49*pi^2))*cos(7*t);
x_exact = sawtooth(t+pi, 1/2);

%Create new figure and display results
figure
plot(t,fun1(t),t,fun2(t),t,fun3(t),t,x_exact)
legend('1st harmonic', '1st & 3rd harmonics', '1,3,5,7 harmonics', 'Exact Sawtooth')
title('Harmonics 1,3,5,7 and Exact Sawtooth Wave')
xlabel('Angle (unitless, presumably radians)')
ylabel('Amplitude (unitless)')

%Save plot as jpg
print -djpg sawtoothplot.jpg