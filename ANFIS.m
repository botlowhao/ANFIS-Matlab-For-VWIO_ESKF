% Clear environment variables
clc;
clear;
close all;

%% Data Preprocessing

% Read data
data = xlsread('ANFIS_WO_sync8.csv');

% Extract columns
rho = data(:, 1);
omega = data(:, 2);

% Calculate statistical values
rho_min = min(rho);
rho_max = max(rho);
rho_mean = mean(rho);
rho_std = std(rho);

omega_min = min(omega);
omega_max = max(omega);
omega_mean = mean(omega);
omega_std = std(omega);

% Set data for Am1-Am6
Am1 = rho_max;
Am2 = rho_max;
Am3 = rho_min;
Am4 = rho_min;

Am5 = omega_min;
Am6 = omega_max;
Am7 = omega_min;
Am8 = omega_max;

%% Create Fuzzy Inference System

% Initialize  Fuzzy Inference System
fis = newfis('ANFIS-WO', 'mamdani', 'min', 'max', 'min', 'max', 'centroid');

% Add Input Variable p And Custom Membership Function A1-A4
fis = addvar(fis, 'input', 'p', [-25 25]);
fis = addmf(fis, 'input', 1, 'A1', 'custom', @(x) custom_mf1(x, Am1));
fis = addmf(fis, 'input', 1, 'A2', 'custom', @(x) custom_mf2(x, Am2));
fis = addmf(fis, 'input', 1, 'A3', 'custom', @(x) custom_mf3(x, Am3));
fis = addmf(fis, 'input', 1, 'A4', 'custom', @(x) custom_mf4(x, Am4));

% Add Another Input Variable w And Custom Membership Function A5-A6
fis = addvar(fis, 'input', 'w', [-0.6 0.6]);
fis = addmf(fis, 'input', 2, 'A5', 'custom', @(x) custom_mf5(x, [Am5, Am6]));
fis = addmf(fis, 'input', 2, 'A6', 'custom', @(x) custom_mf6(x, [Am7, Am8]));

% Add Output Variable Variance
fis = addvar(fis, 'output', 'Variance', [0 1]);
fis = addmf(fis, 'output', 1, 'HighVariance', 'constant', 1);
fis = addmf(fis, 'output', 1, 'LowVariance', 'constant', 0);

% Define rules
rules = [
    % Rule format: [input1_mf input2_mf output_mf weight operator]
    % Operator 1 for AND which uses min
    1 2 1 1 1; % min(A1(p), A2(w)) -> High Variance
    2 2 1 1 1; % min(A2(p), A2(w)) -> High Variance
    4 2 1 1 1; % min(A4(p), A2(w)) -> High Variance
    1 1 1 1 1; % min(A1(p), A1(w)) -> High Variance
    4 1 1 1 1; % min(A4(p), A1(w)) -> High Variance
    3 2 2 1 1; % min(A3(p), A2(w)) -> Low Variance
    2 1 2 1 1; % min(A2(p), A1(w)) -> Low Variance
    3 1 1 1 1; % min(A3(p), A1(w)) -> High Variance
];

% Add All Rules To FIS
fis = addrule(fis, rules);
rules_display = showrule(fis);

save('./ANFIS_WO_FIS.mat', 'fis');

% Draw A Structure Disgram Of FIS
% plotfis(fis);











