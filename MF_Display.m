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


%% Member Function Display
% Create input ranges
x1_values = linspace(-10, 25, 100);
x2_values = linspace(-10, 25, 100);
x3_values = linspace(-25, 10, 100);
x4_values = linspace(-25, 10, 100);

x5_values = linspace(-0.6, 0.6, 100);
x6_values = linspace(-0.6, 0.6, 100);

% Calculate membership values
mu1_values = arrayfun(@(x) custom_mf1(x, Am1), x1_values);
mu2_values = arrayfun(@(x) custom_mf2(x, Am2), x2_values);
mu3_values = arrayfun(@(x) custom_mf3(x, Am3), x3_values);
mu4_values = arrayfun(@(x) custom_mf4(x, Am4), x4_values);

mu5_values = arrayfun(@(x) custom_mf5(x, Am5, Am6), x5_values);
mu6_values = arrayfun(@(x) custom_mf6(x, Am7, Am8), x6_values);

% Plot membership functions A1-A4
figure;

% Plot A1
subplot(2, 2, 1);
plot(x1_values, mu1_values, 'b', 'LineWidth', 2);
title('Custom Membership Function Of A1', 'FontSize', 20, 'FontName', 'Times New Roman');
xlabel('p (r/min)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Membership value', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
set(gca, 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times New Roman'); 
hold on;
plot(Am1, custom_mf1(Am1, Am1), 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am1
text(Am1, custom_mf1(Am1, Am1) - 0.02, 'Am1', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Plot A2
subplot(2, 2, 2);
plot(x2_values, mu2_values, 'b', 'LineWidth', 2);
title('Custom Membership Function Of A2', 'FontSize', 20, 'FontName', 'Times New Roman');
xlabel('p (r/min)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Membership value', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
set(gca, 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times New Roman'); 
hold on;
plot(Am2, custom_mf2(Am2, Am2), 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am2
text(Am2, custom_mf2(Am2, Am2) + 0.02, 'Am2', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Plot A3
subplot(2, 2, 3);
plot(x3_values, mu3_values, 'b', 'LineWidth', 2);
title('Custom Membership Function Of A3', 'FontSize', 20, 'FontName', 'Times New Roman');
xlabel('p (r/min)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Membership value', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
set(gca, 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times New Roman'); 
hold on;
plot(Am3, custom_mf3(Am3, Am3), 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am3
text(Am3, custom_mf3(Am3, Am3) + 0.02, 'Am3', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Plot A4
subplot(2, 2, 4);
plot(x4_values, mu4_values, 'b', 'LineWidth', 2);
title('Custom Membership Function Of A4', 'FontSize', 20, 'FontName', 'Times New Roman');
xlabel('p (r/min)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Membership value', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
set(gca, 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times New Roman'); 
hold on;
plot(Am4, custom_mf4(Am4, Am4), 'bo', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am4
text(Am4, custom_mf4(Am4, Am4) - 0.02, 'Am4', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Add overall title for A1-A4
annotation('textbox', [0 0.9 1 0.1], 'String', 'Custom Membership Functions Of A1, A2, A3, A4 For Wheel Velocity Difference p', ...
    'EdgeColor', 'none', 'HorizontalAlignment', 'center', 'FontSize', 24, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Set background to pure white
set(gcf, 'Color', 'w');

% Plot membership functions A5-A6
figure;

% Plot A5
subplot(1, 2, 1);
plot(x5_values, mu5_values, 'r', 'LineWidth', 2);
title('Custom Membership Function Of A5', 'FontSize', 20, 'FontName', 'Times New Roman');
xlabel('w (rad/s)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Membership value', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
set(gca, 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times New Roman'); 
hold on;
plot(Am5, custom_mf5(Am5, Am5, Am6), 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am5
text(Am5, custom_mf5(Am5, Am5, Am6) -0.01 , 'Am5', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
plot(Am6, custom_mf5(Am6, Am5, Am6), 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am6
text(Am6, custom_mf5(Am6, Am5, Am6) + 0.01, 'Am6', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Plot A6
subplot(1, 2, 2);
plot(x6_values, mu6_values, 'r', 'LineWidth', 2);
title('Custom Membership Function Of A6', 'FontSize', 20, 'FontName', 'Times New Roman');
xlabel('w (rad/s)', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
ylabel('Membership value', 'FontSize', 16, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
set(gca, 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'Times New Roman'); 
hold on;
plot(Am7, custom_mf6(Am7, Am7, Am8), 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am7
text(Am7, custom_mf6(Am7, Am7, Am8) + 0.01, 'Am7', 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');
plot(Am8, custom_mf6(Am8, Am7, Am8), 'ro', 'MarkerSize', 8, 'LineWidth', 2); % Annotate Am8
text(Am8, custom_mf6(Am8, Am7, Am8) - 0.01, 'Am8', 'VerticalAlignment', 'top', 'HorizontalAlignment', 'right', 'FontSize', 12, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Add overall title for A5-A6
annotation('textbox', [0 0.9 1 0.1], 'String', 'Custom Membership Functions Of A5, A6 For Wheel Angular Velocity w', ...
    'EdgeColor', 'none', 'HorizontalAlignment', 'center', 'FontSize', 24, 'FontWeight', 'bold', 'FontName', 'Times New Roman');

% Set background to pure white
set(gcf, 'Color', 'w'); 


