% Clear environment variables
clc;
clear;
close all;

%% Data Preprocessing

% Read data
data = xlsread('ANFIS_WO_20240609.csv');

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
fis = newfis('ANFIS-WO','mamdani', 'min', 'max', 'min', 'max', 'centroid');

% Add Input Variable And Custom Membership Fuction
% (A3,A6)
fis = addvar(fis, 'input', 'A3', [-25 10]);
fis = addmf(fis, 'input', 1, 'CustomA3', 'custom', {@custom_mf3});
fis = addvar(fis, 'input', 'A6', [-0.6 0.6]);
fis = addmf(fis, 'input', 2, 'CustomA6', 'custom', {@custom_mf6});

% Add Output Variable
fis = addvar(fis, 'output', 'Variance', [0 1]);
fis = addmf(fis, 'output', 1, 'HighVariance', 'constant', [1]);
fis = addmf(fis, 'output', 1, 'LowVariance', 'constant', [0]);

% Calculation And Apply Rules

% Define The Membership Values of A3 And A6
A3_mf_output = arrayfun(@(x) custom_mf3(x, Am3), rho);
A6_mf_output = arrayfun(@(x) custom_mf6(x, Am7, Am8), omega);
% Calulate The Output Value Of A3 And A6
G_7w = min(A3_mf_output, A6_mf_output);

% Using Logical Judgment And Add Rules
% G_7w_threshold = 0.5;
% for i = 1:length(G_7w)
%         if G_7w(i) > G_7w_threshold
%             fis = addrule(fis, "if A3 is CustomA3 and A6 is CustomA6 then Variance is LowVariance (1)");
%         else
%             fis = addrule(fis, "if A3 is CustomA3 and A6 is CustomA6 then Variance is HighVariance (1)");
%         end
% end


% Test the Fis



%%


            
            

