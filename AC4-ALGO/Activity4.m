%    Workbook: Weekly_Water_Consumption.csv
%    Worksheet: in

%% Problem statement:
% Given a set of data in "Weekly_Water_Consumption.csv" about the consumption of water in a house on seven days of a week on average, design an algorithm to:
% 1. Calculate the total usage of water (in litres) and the total time used (in minutes) on each day.
% 2. Plot the total consumption on each day in a single graph

%% Requirements: 
% Input - Flow rates of different equipments (in Litre/minutes)
% Output - Time consumed by each equipment (in minutes)
% Equation - Litres consumed = Flow rate*time of use

%% Import the data
[raw0_0] = xlsread('Weekly_Water_Consumption.csv','B2:G8');
[raw0_1] = xlsread('Weekly_Water_Consumption.csv','B12:B18');
raw = [raw0_0,raw0_1];

%% Create output variable
data = raw;

%% Allocate imported array to column variable names
Flowrate = data(:,6);

%% Clear temporary variables
clearvars raw raw0_0 raw0_1 R;

%% Daily_usage_time
% Calculates total time water was consumed by all equipments in a day

for i=1:7
    Total_time(i,1)=0;
    for j=1:5
        Total_time(i,1) = addTime(Total_time(i,1),data(i,j)); %addTime() is a custom function to add two inputs
    end
end

%% Daily_water_usage
% Calculates total water consumption by all equipments in a day

for i=1:7
    Total_usage(i,1)=0;
    for j=1:5
        Total_usage(i,1)=addTime(Total_usage(i,1),(produ(data(i,j),Flowrate(j,1)))); %produ() is a custom function to multiply two inputs
    end
end

%% Create a table with all the original data and results
finaltable=table
finaltable.Day=(1:7)';
finaltable.WashBasin=data(:,1);
finaltable.BathroomShower=data(:,2);
finaltable.HealthFaucet=data(:,3);
finaltable.BathroomTap=data(:,4);
finaltable.ToiletFlush=data(:,5);
finaltable.TotalTimeofUse_in_minutes=Total_time(:);
finaltable.TotalUsage_in_litres=Total_usage(:);

%% Plotting the total consumption on each day in a single graph
scatter(finaltable.Day,finaltable.TotalUsage_in_litres);
title('Total usage vs Days of the week');
xlabel('Days of the week (Sunday-Saturday)');
ylabel('Total usage (in Litres)');



