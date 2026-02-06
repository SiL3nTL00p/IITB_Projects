

clear; clc; close all;


T = [0, 5, 10, 15, 20, 25, 30];


O2_data = [
    14.6, 12.9, 11.4;
    12.8, 11.3, 10.3;
    11.3, 10.1, 8.96;
    10.1, 9.03, 8.08;
    9.09, 8.17, 7.35;
    8.26, 7.46, 6.73;
    7.56, 6.85, 6.20
];

O2_c10 = O2_data(:, 2); % Column 2 is c = 10 g/L


p2 = polyfit(T, O2_c10, 2); 
val_quad = polyval(p2, 12);

% 2. Cubic Fit (Degree 3)
p3 = polyfit(T, O2_c10, 3);
val_cubic = polyval(p3, 12);

% 3. Output Results
fprintf('--- Part (a) Results (c = 10 g/L, T = 12 C) ---\n');
fprintf('Oxygen Conc. (Quadratic Fit): %.4f mg/L\n', val_quad);
fprintf('Oxygen Conc. (Cubic Fit):     %.4f mg/L\n', val_cubic);
fprintf('Difference:                   %.4f mg/L\n', abs(val_quad - val_cubic));
disp('Comment: The cubic polynomial offers a higher degree of freedom and may capture the curvature better, though both values are close.');

% 4. Plotting [cite: 15, 16, 17]
figure('Name', 'Dissolved Oxygen Interpolation');
hold on;
grid on;

% Plot discrete data points
plot(T, O2_c10, 'ro', 'MarkerFaceColor', 'r', 'DisplayName', 'Data (c=10 g/L)');

% Generate smooth curves for plotting
T_fine = linspace(min(T), max(T), 100);
plot(T_fine, polyval(p2, T_fine), 'b--', 'LineWidth', 1.5, 'DisplayName', 'Quadratic Fit');
plot(T_fine, polyval(p3, T_fine), 'k-', 'LineWidth', 1.5, 'DisplayName', 'Cubic Fit');

% Formatting
xlabel('Temperature (^{\circ}C)');
ylabel('Dissolved Oxygen (mg/L)');
title('Dissolved Oxygen vs Temperature (c = 10 g/L)');
legend('Location', 'best');

% Export figure
saveas(gcf, 'MM220A1.png');
disp('Figure saved as MM220A1.png');

% --- Part (b): Linear Interpolation for c=15, T=12 and T=23 ---

% Define the full grid for interpolation
C_vec = [0, 10, 20]; % Chloride concentrations
[C_grid, T_grid] = meshgrid(C_vec, T);

% Interpolate at specific points
% We use linear interpolation as requested [cite: 18]
val_b1 = interp2(C_grid, T_grid, O2_data, 15, 12, 'linear');
val_b2 = interp2(C_grid, T_grid, O2_data, 15, 23, 'linear');

fprintf('\n--- Part (b) Results (Linear Interpolation, c = 15 g/L) ---\n');
fprintf('Oxygen Conc. at T = 12 C: %.4f mg/L\n', val_b1);
fprintf('Oxygen Conc. at T = 23 C: %.4f mg/L\n', val_b2);
