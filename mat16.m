clc
clear
format compact


format short g
j = [-110:50]; %1850-2010 as years from (city data)
m = [-60:50]; %1900-2010 as years from 1960 (MSA data)
n = [40:50]'; %2000-2010 as years from 1960 (predicted years)
pop_exp = @(n) 1312474*1.026.^(n); %Models 2000-2010 with exponential function
model_exp = ceil(pop_exp(n))'; %Predicted MSA 2000-2010 with exponential function 
model_past_exp = ceil(pop_exp(m))'; %Predicted MSA 1900-2010 with exponential function
for i = 1:11
    fprintf('Year: %.i Exponential model MSA population: %3.f\n',n(i)+1960,model_exp(i))
end
load Atlanta_data.mat
msa_quad = polyfit(MSAdate-1960, MSA, 2); %Calculates MSA quadratic model
city_quad = polyfit(citydate-1960, city, 2); %Calculates city quadratic model
msamodel_quad = polyval(msa_quad,m); %Predicted MSA 1900-2010 with quadratic model
citymodel_quad = polyval(city_quad,j); %Predicted MSA 1850-2010 with quadratic model

figure(1)
hold on
plot(MSAdate-1960,MSA,'*')
plot(m,msamodel_quad,'g')
plot(m,model_past_exp,'r')
title('MSA Data with Quadratic Model and Exponential Model')
xlabel('Years from 1960') 
ylabel('Population')
legend('Raw Data','MSA Quadratic Model', 'Exponential Model', 'Location', 'SouthEast')
hold off

figure(2)
hold on
plot(citydate-1960,city,'*')
plot(j,citymodel_quad,'g')
title('City Data with Quadratic Model')
xlabel('Years from 1960') 
ylabel('Population')
legend('Raw Data','MSA Quadratic Model','Location','SouthEast')
hold off





