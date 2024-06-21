% Clear environment variables
clc;
clear;
close all;

% Load the FIS from the .mat file
load('ANFIS_WO_FIS.mat', 'fis');

% Suppose you have new data
test_data = xlsread('ANFIS_WO_sync7.csv');
test_rho = test_data(:, 1);
test_omega = test_data(:, 2);


inputData = [test_rho, test_omega];

rawOutputs = evalfis(inputData, fis);
totalOutput = sum(rawOutputs, 2);
normalizedOutputs = rawOutputs ./ totalOutput;

%%Display and save results
disp('rawOutputs:');
disp(rawOutputs);

disp('Normalized Outputs:');
disp(normalizedOutputs);
save('NormalizedOutputs.mat', 'normalizedOutputs');

