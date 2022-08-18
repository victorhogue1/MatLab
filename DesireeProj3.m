%data = zeros(1,501)

%Data file includes signal, signal with noise, and derivative of signal
%Presumably 167 data points each, making the 501 data points found in the file
signal = zeros(1,167);
noiseSignal = signal;
ddtSignal = signal;
%[signal, noiseSignal, ddtSignal] = load("project3.mat")
data = load("project3.mat")