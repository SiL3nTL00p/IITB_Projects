

clear; clc;



x = [0, 2, 4, 6, 8];
y = [0, 2, 4, 6, 8];



Temp_Data = [
    100.00, 90.00, 80.00, 70.00, 60.00;   % y = 0
    85.00,  64.49, 53.50, 48.15, 50.00;   % y = 2
    70.00,  48.90, 38.43, 35.03, 40.00;   % y = 4
    55.00,  38.78, 30.39, 27.07, 30.00;   % y = 6
    40.00,  35.00, 30.00, 25.00, 20.00    % y = 8
];



% (a) Calculate T at x = 4, y = 3.2 [cite: 28]
Ta = interp2(x, y, Temp_Data, 4, 3.2, 'linear');

% (b) Calculate T at x = 4.3, y = 2.7 [cite: 29]
Tb = interp2(x, y, Temp_Data, 4.3, 2.7, 'linear');


fprintf('--- Assignment 2 Results ---\n');
fprintf('Temperature at (x=4, y=3.2):   %.4f deg C\n', Ta);
fprintf('Temperature at (x=4.3, y=2.7): %.4f deg C\n', Tb);
