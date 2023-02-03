%% Reset
clc 
clear all
close all

%% Probleme 3
xn = [0:0.1:0.5];
yn = [ 12.5 170 207.5 185 162.5 200 ];

% Approximation pour M = 6, 5, 4, 3
phi1 = ones(size(xn))';
phi2 = (xn.^1)';
phi3 = (xn.^2)';
phi4 = (xn.^3)';
phi5 = (xn.^4)';
phi6 = (xn.^5)';

P6 = [ phi1 phi2 phi3 phi4 phi5 phi6; ];
P5 = [ phi1 phi2 phi3 phi4 phi5; ];
P4 = [ phi1 phi2 phi3 phi4; ];
P3 = [ phi1 phi2 phi3; ];

A6 = pinv(P6)*yn';
A5 = pinv(P5)*yn';
A4 = pinv(P4)*yn';
A3 = pinv(P3)*yn';

x = linspace(0, 0.5);
g6 = A6(6)*xn.^5 + A6(5)*xn.^4 + A6(4)*xn.^3 + A6(3)*xn.^2 + A6(2)*xn + A6(1);
g5 = A5(5)*xn.^4 + A5(4)*xn.^3 + A5(3)*xn.^2 + A5(2)*xn + A5(1);
g4 = A4(4)*xn.^3 + A4(3)*xn.^2 + A4(2)*xn + A4(1);
g3 = A3(3)*xn.^2 + A3(2)*xn + A3(1);

E6 = sum((g6-yn).^2)
E5 = sum((g5-yn).^2)
E4 = sum((g4-yn).^2)
E3 = sum((g3-yn).^2)

err_rms6 = sqrt(mean((g6-yn).*(g6-yn)))
err_rms5 = sqrt(mean((g5-yn).*(g5-yn)))
err_rms4 = sqrt(mean((g4-yn).*(g4-yn)))
err_rms3 = sqrt(mean((g3-yn).*(g3-yn)))

y_m = mean(yn)
R6_2 = (sum((g6-y_m).^2)) ./ (sum((yn-y_m).^2)) 
R5_2 = (sum((g5-y_m).^2)) ./ (sum((yn-y_m).^2))
R4_2 = (sum((g4-y_m).^2)) ./ (sum((yn-y_m).^2))
R3_2 = (sum((g3-y_m).^2)) ./ (sum((yn-y_m).^2))

figure
plot(xn, g6, 'red')
hold on
plot(xn, g5, 'blue')
plot(xn, g4, 'green')
plot(xn, g3, 'cyan')
plot(xn, yn, 'o')
legend('M=6', 'M=5', 'M=4', 'M=3')
hold off
