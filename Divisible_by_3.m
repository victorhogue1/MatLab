clc
clear
format compact
%Use these, and don't forget the :
%v = [1:10]
%v = [1:1000]
%Then change div to 71 and use v = [1:100000]
v = input('Enter a vector: ');
div = 3; %The divisor
remainder = v(find(mod(v,3)==0)); %finds the which in v are divisible by div
fprintf('%.i \n',remainder)