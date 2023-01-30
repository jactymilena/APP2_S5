
%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Trajectoire - polynome d'interpolation

xn = [0 8 15 20 25 ];
yn = [ 30 19 20 16 12.7843 ];
names = {'A', 'B', 'C', 'D', 'E'}

phi1 = ones(size(xn))';
phi2 = xn';
phi3 = (xn.^2)';
phi4 = (xn.^3)';
phi5 = (xn.^4)';

%P = vander(xn)

P = [ phi1 phi2 phi3 phi4 phi5; ];

A = pinv(P)*yn'

r = roots([A(5)*4 A(4)*3 A(3)*2 A(2)])
x = linspace(0, 25);
g = A(1) + A(2)*x + A(3)*x.^2 + A(4)*x.^3 + A(5)*x.^4;

figure
hold on
plot(xn, yn, 'o')
plot(x, g)
title("Polynôme d'interpolation")
text(xn, yn+0.45, names)
hold off

%% Trajectoire - polynome d'approximation
dx = 10;
xn = [0:dx:100];
yn = [ 0.87 0.78 0.71 0.61 0.62 0.51 0.51 0.49 0.46 0.48 0.46 ];
N = 11;

phi1 = ones(size(xn))';
phi2 = xn';
phi3 = (xn.^2)';
phi4 = (xn.^3)';
phi5 = (xn.^4)';
phi6 = (xn.^5)';
phi7 = (xn.^6)';
phi8 = (xn.^7)';

% Pour M = 8
P8 = [ phi1 phi2 phi3 phi4 phi5 phi6 phi7 phi8 ; ];
A8 = pinv(P8)*yn';

% Pour M = 7
P7 = [ phi1 phi2 phi3 phi4 phi5 phi6 phi7 ; ];
A7 = pinv(P7)*yn';

% Pour M = 6
P6 = [ phi1 phi2 phi3 phi4 phi5 phi6 ; ];
A6 = pinv(P6)*yn';

% Pour M = 5
P5 = [ phi1 phi2 phi3 phi4 phi5 ; ];
A5 = pinv(P5)*yn';

% Pour M = 4
P4 = [ phi1 phi2 phi3 phi4 ; ];
A4 = pinv(P4)*yn';

% Pour M = 3
P3 = [ phi1 phi2 phi3 ; ];
A3 = pinv(P3)*yn';

% Polynômes d'approximations
g8 = A8(1) + A8(2)*xn + A8(3)*xn.^2 + A8(4)*xn.^3 + A8(5)*xn.^4 + A8(6)*xn.^5 + A8(7)*xn.^6 + A8(8)*xn.^7;
g7 = A7(1) + A7(2)*xn + A7(3)*xn.^2 + A7(4)*xn.^3 + A7(5)*xn.^4 + A7(6)*xn.^5 + A7(7)*xn.^6;
g6 = A6(1) + A6(2)*xn + A6(3)*xn.^2 + A6(4)*xn.^3 + A6(5)*xn.^4 + A6(6)*xn.^5;
g5 = A5(1) + A5(2)*xn + A5(3)*xn.^2 + A5(4)*xn.^3 + A5(5)*xn.^4;
g4 = A4(1) + A4(2)*xn + A4(3)*xn.^2 + A4(4)*xn.^3;
g3 = A3(1) + A3(2)*xn + A3(3)*xn.^2;

% Représentation
figure
plot(xn, yn, 'x')
hold on
plot(xn, g8, 'red')
plot(xn, g7, 'green')
plot(xn, g6, 'blue')
plot(xn, g5, 'magenta')
plot(xn, g4, 'black')
plot(xn, g3, 'cyan')
hold off

% Calcul des erreurs pour 5 et 6

% Erreur quadratique
E5 = sum((g5-yn).^2)
E6 = sum((g6-yn).^2)

% RMSE
errr_rms_5 = sqrt(mean((g5-yn).*(g5-yn)))
errr_rms_6 = sqrt(mean((g6-yn).*(g6-yn)))

% Correlation
y_mean = mean(yn);
R_2_5 = (sum((g5 - y_mean).^2)) / ( sum((yn - y_mean).^2) )
R_2_6 = (sum((g6 - y_mean).^2)) / ( sum((yn - y_mean).^2) )

% Choix : M = 6, car c'est dont la correlation est le plus proche de 1

%% Coussin-trampoline

m = 80 + 8;
g = 9.8;
mg = m*g;
h0 = 5;
hr = 0;
k = 6000;

a = (1/2)*k;
b = mg;
c = -mg*h0;

hf1 = (-b + sqrt((b^2)-(4*a*c)))/(2*a)
hf2 = (-b - sqrt((b^2)-(4*a*c)))/(2*a)

%% Ballon-mousse et minuterie

vb = -1;
mb = 8;
coeff_res = 0;

%% Bassin d'eau

kf = 0.95;
b = 47;
g = 9.8;
m = 80;
mg = m*g;
h1 = 10;
vf = 1;

% Vitesse initiale
vi = sqrt(2*g*h1);

% Point d'operation
v0 = sqrt( (mg.*(1-kf)) ./ b )

% Constantes
C = ( (g*(1-kf)) / v0 ) - ( b*v0 / m )
K = ( (-g*(1-kf)) / v0^2 ) - ( b / m )

% Vitesses
dvi = vi - v0;
dvf = vf - v0;

% Hauteur z
z = (log(dvf) - log(dvi)) ./ K 

