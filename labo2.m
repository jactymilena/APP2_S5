%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Probleme 9

xn = [ 1.0 3.0 4.0 6.0 7.0 ];
yn = [ -1.6 4.8 6.1 14.6 15.1 ];

M = 2;

phi1 = ones(size(xn))';
phi2 = xn';

P = [ phi1 phi2 ;];
A = pinv(P)*yn';

x = linspace(0, 15.1);
g = A(2).*xn + A(1);

figure
plot(xn, yn, 'x')
hold on
plot(xn, g)
hold off

% Erreur quadratique
E = sum((g-yn).^2)

% RMSE
errr_rms = sqrt(mean((g-yn).*(g-yn)))

% Correlation
y_mean = mean(yn)
R_2 = (sum((g - y_mean).^2)) / ( sum((yn - y_mean).^2) )
