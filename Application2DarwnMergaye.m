%Application 2
%Darwn Mergaye
%Class
%2/8/2022

clc
clear

%load AAPL;
%AdjClose = AAPL(:,6);

load temp_data;
year = temp_data(:,1);
month = temp_data(:,2);
day = temp_data(:,3);
temp = temp_data(:,4);

##a. What was the MEAN daily temperature anomaly for the years 1880 – 1940?
##b. What was the MEAN daily temperature anomaly for the years 1958 – 2018?
##c. On how many days in 1880 – 1940 was the temperature anomaly positive?
##d. On how many days in 1958 – 2018 was the temperature anomaly positive?
##e. What was the date (month, day, and year) on which the highest-ever temperature
##anomaly occurred?
##f. What was the date (month, day, and year) on which the lowest-ever temperature
##anomaly occurred?
##g. What is the difference between the highest-ever and lowest-ever temperature
##anomalies?
##h. What was the date the first time the temperature anomaly was greater than 2.0
##degrees?
##i. How many days was the temperature anomaly in 2018 greater than the temperature
##anomaly on the corresponding date in 1958?

%(a)
disp('What was the MEAN daily temperature anomaly for the years 1880 – 1940?')
mean(temp(find(year<1940)))

%(b)
disp('What was the MEAN daily temperature anomaly for the years 1958 – 2018?')
mean(temp(find(year>1957)))

%(c)
disp('On how many days in 1880 – 1940 was the temperature anomaly positive?')
length(find(year(find((temp>0)))<1940))

%(d)
disp('On how many days in 1958 – 2018 was the temperature anomaly positive?')
length(find(year(find((temp>0)))>1957))

%(e)
disp('What was the date (month, day, and year) on which the highest-ever temperature anomaly occurred?')
month(find(temp==max(temp)))
day(find(temp==max(temp)))
year(find(temp==max(temp)))

%(f)
disp('What was the date (month, day, and year) on which the lowest-ever temperature anomaly occurred?')
month(find(temp==min(temp)))
day(find(temp==min(temp)))
year(find(temp==min(temp)))

%(g)
disp('What is the difference between the highest-ever and lowest-ever temperature anomalies?')
max(temp)-min(temp)

%(h)
disp('What was the date the first time the temperature anomaly was greater than 2.0 degrees?')
min(month(find(temp>2.0)))
min(day(find(temp>2.0)))
min(year(find(temp>2.0)))

%(i)
disp('How many days was the temperature anomaly in 2018 greater than the temperature anomaly on the corresponding date in 1958?')
disp('How many days was the temperature anomaly in 2018 greater than the temperature anomaly on the corresponding date in 1958?')
length(find(temp(find(year==2018))>temp(find(year==1958))))
