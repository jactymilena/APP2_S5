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

%% Labo 1, Probleme 7

% Reset
clc 
clear all
close all

xn = [ 2.3 14.7 29.7 31.9 45.7 58.6 ];
hn = [ 184 860 1345 1385 1360 965 ];

phi1 = ones(size(xn))';
phi2 = xn';
phi3 = (xn.^2)';

P = [ phi1 phi2 phi3 ; ]
A = pinv(P)*hn';

x = linspace(2.3, 58.6);
g = A(1) + A(2).*xn + A(3).*xn.^2;

figure
plot(xn, hn, 'o')
hold on
plot(xn, g)
hold off

err_rms = sqrt(mean((g - hn).^2))

%% Labo 1, Probleme 8

% Reset
clc 
clear all
close all

tn = [ 2 3 4 6 7 8 10 11 12 15 ];
yn = [ 2.11 1.61 1.25 0.820 0.737 0.810 0.880 0.443 0.070 -0.493 ];
p = 8;

phi1 = ones(size(tn))';
phi2 = tn';
phi3 = cos((2*pi.*tn)./p)';
phi4 = sin((2*pi.*tn)./p)';

P = [ phi1 phi2, phi3 phi4 ; ];
A = pinv(P)*yn';

g = A(1) + A(2).*tn + A(3).*cos((2*pi.*tn)./p) + A(4).*sin((2*pi.*tn)./p);

figure
plot(tn, yn, 'o')
hold on
plot(tn, g)
hold off

% Erreur quadratique
E = sum((g-yn).^2)
err_rms = sqrt(mean((g-yn).^2))
y_m = mean(yn);
R = sum((g-y_m).^2) ./ sum((yn-y_m).^2)
