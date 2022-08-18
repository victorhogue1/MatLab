% Function 1 To Interpolate

f = @(x) 10*sin(2*x) + 20*exp(-10*(x-2).^2)+cos(10*x);

% Plot Function To Interpolate over [0,3]
%h=1
t_evaluate = 0:0.01:3;

figure

plot(t_evaluate,f(t_evaluate),'LineWidth',3);

hold on;

% Sample Sites

h1_samples = 0:1:3

plot(h1_samples,f(h1_samples),'o','LineWidth',6);

% Kernel Function

mu = 1;

K = @(x,y) (1+y*x)^3; 


% Gram Matrix

GramMatrix1 = zeros(length(h1_samples));

for i = 1:length(h1_samples)
    for j = 1:length(h1_samples)
        GramMatrix1(i,j) = K(h1_samples(i),h1_samples(j));
    end
end

% Sampled Output
Y1 = f(h1_samples)';

% Weights

Weights = pinv(GramMatrix1)*Y1;

% Evaluating the Approximation

Z1 = zeros(1,length(t_evaluate));

for i = 1:length(t_evaluate)
    sum = 0;
    for j = 1:length(h1_samples)
        sum = sum + Weights(j)*K(t_evaluate(i),h1_samples(j));
    end
    Z1(i) = sum;
end

%h=0.5
t2_evaluate = 0:0.01:3;

figure

plot(t2_evaluate,f(t2_evaluate),'LineWidth',3);

hold on;

% Sample Sites

h2_samples = 0:0.5:3

plot(h2_samples,f(h2_samples),'o','LineWidth',6);

% Kernel Function

mu = 0.5;

K = @(x,y) (1+y*x)^6; 


% Gram Matrix

GramMatrix2 = zeros(length(h2_samples));

for i = 1:length(h2_samples)
    for j = 1:length(h2_samples)
        GramMatrix2(i,j) = K(h2_samples(i),h2_samples(j));
    end
end

% Sampled Output
Y2 = f(h2_samples)';

% Weights

Weights = pinv(GramMatrix2)*Y2;

% Evaluating the Approximation

Z2 = zeros(1,length(t2_evaluate));

for i = 1:length(t2_evaluate)
    sum = 0;
    for j = 1:length(h2_samples)
        sum = sum + Weights(j)*K(t2_evaluate(i),h2_samples(j));
    end
    Z2(i) = sum;
end

%h=0.1
t3_evaluate = 0:0.01:3;

figure

plot(t3_evaluate,f(t3_evaluate),'LineWidth',3);

hold on;

% Sample Sites

h3_samples = 0:0.1:3

plot(h3_samples,f(h3_samples),'o','LineWidth',6);

% Kernel Function

K = @(x,y) (1+y*x)^30; 


% Gram Matrix

GramMatrix3 = zeros(length(h3_samples));

for i = 1:length(h3_samples)
    for j = 1:length(h3_samples)
        GramMatrix3(i,j) = K(h3_samples(i),h3_samples(j));
    end
end

% Sampled Output
Y3 = f(h3_samples)';

% Weights

Weights = pinv(GramMatrix3)*Y3;

% Evaluating the Approximation

Z3 = zeros(1,length(t3_evaluate));

for i = 1:length(t3_evaluate)
    sum = 0;
    for j = 1:length(h3_samples)
        sum = sum + Weights(j)*K(t3_evaluate(i),h3_samples(j));
    end
    Z3(i) = sum;
end


% Plot

figure

plot(t_evaluate,Z1,'LineWidth',3);
hold on

plot(t_evaluate,f(t_evaluate),'--','LineWidth',3);
plot(h1_samples,f(h1_samples),'o','LineWidth',6);

plot(t_evaluate,Z2,'LineWidth',3);
hold on 

plot(t2_evaluate,f(t2_evaluate),'--','LineWidth',3);
plot(h2_samples,f(h2_samples),'o','LineWidth',6);

plot(t_evaluate,Z3,'LineWidth',3);
hold on 

plot(t3_evaluate,f(t3_evaluate),'--','LineWidth',3);
plot(h3_samples,f(h3_samples),'o','LineWidth',6);

%Function 2 to interpolate 
%g = @(x) 0*(x>= 0 && x<= 2);
%g = @(x) 1*(x>2 && x<=3);
%interp with h = 1
x_h1 = 0:1:3;
g_h1 = g(x_h1)
n_h1 = length(x_h1)-1;

%interp with h = 0.5
x_h05 = 0:0.5:3;
g_h05 = g(x_h05)

%interp with h = 0.1
x_h01 = 0:0.1:3;
g_h01 = g(x_h01)
    

% Plot Function To Interpolate over [0,3]

%h=1
t_evaluate = 0:0.01:3;

figure

plot(t_evaluate,g(t_evaluate),'LineWidth',3);

hold on;

% Sample Sites

h1_samples = 0:1:3

plot(h1_samples,g(h1_samples),'o','LineWidth',6);

% Kernel Function

mu = 1;

K = @(x,y) (1+y*x)^3; 


% Gram Matrix

GramMatrix1 = zeros(length(h1_samples));

for i = 1:length(h1_samples)
    for j = 1:length(h1_samples)
        GramMatrix1(i,j) = K(h1_samples(i),h1_samples(j));
    end
end

% Sampled Output
Y1 = g(h1_samples)';

% Weights

Weights = pinv(GramMatrix1)*Y1;

% Evaluating the Approximation

Z1 = zeros(1,length(t_evaluate));

for i = 1:length(t_evaluate)
    sum = 0;
    for j = 1:length(h1_samples)
        sum = sum + Weights(j)*K(t_evaluate(i),h1_samples(j));
    end
    Z1(i) = sum;
end

%h=0.5
t2_evaluate = 0:0.01:3;

figure

plot(t2_evaluate,g(t2_evaluate),'LineWidth',3);

hold on;

% Sample Sites

h2_samples = 0:0.5:3

plot(h2_samples,g(h2_samples),'o','LineWidth',6);

% Kernel Function

mu = 0.5;

K = @(x,y) (1+y*x)^6; 


% Gram Matrix

GramMatrix2 = zeros(length(h2_samples));

for i = 1:length(h2_samples)
    for j = 1:length(h2_samples)
        GramMatrix2(i,j) = K(h2_samples(i),h2_samples(j));
    end
end

% Sampled Output
Y2 = g(h2_samples)';

% Weights

Weights = pinv(GramMatrix2)*Y2;

% Evaluating the Approximation

Z2 = zeros(1,length(t2_evaluate));

for i = 1:length(t2_evaluate)
    sum = 0;
    for j = 1:length(h2_samples)
        sum = sum + Weights(j)*K(t2_evaluate(i),h2_samples(j));
    end
    Z2(i) = sum;
end
  
%h=0.1
t3_evaluate = 0:0.01:3;

figure

plot(t3_evaluate,g(t3_evaluate),'LineWidth',3);

hold on;

% Sample Sites

h3_samples = 0:0.1:3

plot(h3_samples,g(h3_samples),'o','LineWidth',6);

% Kernel Function

mu = 0.1;

K = @(x,y) (1+y*x)^30; 


% Gram Matrix

GramMatrix3 = zeros(length(h3_samples));

for i = 1:length(h3_samples)
    for j = 1:length(h3_samples)
        GramMatrix3(i,j) = K(h3_samples(i),h3_samples(j));
    end
end

% Sampled Output
Y3 = g(h3_samples)';

% Weights

Weights = pinv(GramMatrix3)*Y3;

% Evaluating the Approximation

Z3 = zeros(1,length(t3_evaluate));

for i = 1:length(t3_evaluate)
    sum = 0;
    for j = 1:length(h3_samples)
        sum = sum + Weights(j)*K(t3_evaluate(i),h3_samples(j));
    end
    Z3(i) = sum;
end


% Plot

figure

plot(t_evaluate,Z1,'LineWidth',3);
hold on

plot(t_evaluate,g(t_evaluate),'--','LineWidth',3);
plot(h1_samples,g(h1_samples),'o','LineWidth',6);

plot(t_evaluate,Z2,'LineWidth',3);
hold on 

plot(t2_evaluate,g(t2_evaluate),'--','LineWidth',3);
plot(h2_samples,g(h2_samples),'o','LineWidth',6);

plot(t_evaluate,Z3,'LineWidth',3);
hold on 

plot(t3_evaluate,g(t3_evaluate),'--','LineWidth',3);
plot(h3_samples,g(h3_samples),'o','LineWidth',6);