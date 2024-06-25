% Clear environment variables
clc;
clear;
close all;

% Load the saved ANFIS model
load('FIS_WO.mat', 'fis');

% Create Test Data
input_data = xlsread('ANFIS_WO_sync8.csv');

% Initialize Q1 arrays to store results
Q1_results = zeros(size(input_data, 1), 1);

% [output,fuzzifiedIn,ruleOut,aggregatedOut,ruleFiring] = evalfis([2 0.5], fis);

%  Evaluate the system with given inputs
% Iterate through each row of input_data
for i = 1:size(input_data, 1)
    % Extract rho and omega from the current row
    rho_i = input_data(i, 1);
    omega_i = input_data(i, 2);
    
    options = evalfisOptions('NumSamplePoints',50);
    
    % Perform fuzzy inference using evalfis with the extracted inputs
    Q1_results(i) = evalfis([rho_i; omega_i], fis, options);
end

% Display or further process Q1_results as needed
disp(Q1_results);



% outputRange = linspace(fis.output.range(1),fis.output.range(2),length(aggregatedOut))'; 
% plot(outputRange,aggregatedOut,[output output],[0 1])
% xlabel('Tip')
% ylabel('Output Membership')
% legend('Aggregated output fuzzy set','Defuzzified output')