%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Trajectoire - polynome d'interpolation

xnI = [0 8 15 20 25 ];
ynI = [ 30 19 20 16 12.2662];
names = {'A', 'B', 'C', 'D', 'E'};

phi1I = ones(size(xnI))';
phi2I = xnI';
phi3I = (xnI.^2)';
phi4I = (xnI.^3)';
phi5I = (xnI.^4)';

P = [ phi1I phi2I phi3I phi4I phi5I; ];

A = pinv(P)*ynI'

r = roots([A(5)*4 A(4)*3 A(3)*2 A(2)])
x = linspace(0, 25);
g_x = A(1) + A(2)*x + A(3)*x.^2 + A(4)*x.^3 + A(5)*x.^4;


% Trajectoire - polynome d'approximation
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

hold on
plot(xn, g8, 'red')
plot(xn, g7, 'green')
plot(xn, g6, 'blue')
plot(xn, g5, 'magenta')
plot(xn, g4, 'black')
plot(xn, g3, 'cyan')
plot(xn, yn, 'x')
title("Polynôme d'approximation")
xlabel('Pourcentage ouverture de la valve (%)')
ylabel('Coéfficient (\mu)')
legend('M=8','M=7','M=6','M=5','M=4','M=3');
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

% Vitesses
hi = 30;
hf = 12.7843;
g = 9.8;
xf = 25;
km_h = 1000/3600;

% En posant la vitesse

vf = 20*km_h;
mu_20 = ((hi - hf) - ((1/(2*g))*vf^2))/xf

vf = 21*km_h;
mu_21 = ((hi - hf) - ((1/(2*g))*vf^2))/xf

vf = 22*km_h;
mu_22 = ((hi - hf) - ((1/(2*g))*vf^2))/xf

vf = 23*km_h;
mu_23 = ((hi - hf) - ((1/(2*g))*vf^2))/xf

vf = 24*km_h;
mu_24 = ((hi - hf) - ((1/(2*g))*vf^2))/xf

vf = 25*km_h;
mu_25 = ((hi - hf) - ((1/(2*g))*vf^2))/xf


% Représentation en fonction de la vitesse en utilisant le polynôme d'interpolation
mu = (mu_20 + mu_25)./2;
v1 = sqrt(2.*g.*(hi - (mu.*x) - g_x));
v2 = sqrt(2.*g.*(hi - (mu_20.*x) - g_x));
v3 = sqrt(2.*g.*(hi - (mu_21.*x) - g_x));
v4 = sqrt(2.*g.*(hi - (mu_22.*x) - g_x));
v5 = sqrt(2.*g.*(hi - (mu_23.*x) - g_x));
v6 = sqrt(2.*g.*(hi - (mu_24.*x) - g_x));
v7 = sqrt(2.*g.*(hi - (mu_25.*x) - g_x));


% Vrai vitesse selon mu = 0.62 (40%)
mu = 0.62;
v = sqrt(2.*g.*(hi - (mu.*x) - g_x))
vRMS1 =  sqrt(2.*g.*(hi - ((mu-errr_rms_6).*x) - g_x));
vRMS2 =  sqrt(2.*g.*(hi - ((mu+errr_rms_6).*x) - g_x));


figure
%plot(x, vf)
%plot(x, v1./km_h, 'blue')
hold on
plot(x, v2./km_h, 'red')
plot(x, v3./km_h, 'magenta')
plot(x, v4./km_h, 'green')
plot(x, v5./km_h, 'cyan')
plot(x, v6./km_h, 'black')
plot(x, v7./km_h, 'blue')
hold off
title("Graphique des vitesses en fonction de la distance")
xlabel('Distance en x (m)')
ylabel('Vitesse (km/h)')
legend('Vitesse finale = 20 km/h','Vitesse finale = 21 km/h','Vitesse finale = 22 km/h','Vitesse finale = 23 km/h','Vitesse finale = 24 km/h','Vitesse finale = 25 km/h')


figure
hold on
plot(x, g_x)
plot(xnI, ynI, 'x')
title("Polynôme d'interpolation")
text(xnI, ynI+0.45, names)
xlabel('Distance en x (m)')
ylabel('Distance en y (m)')
hold off

figure
plot(x, v./km_h, 'cyan')
hold on 
plot(x,vRMS1./km_h)
plot(x,vRMS2./km_h)
hold off
title("Vitesse de la trajectoire avec \mu = 0.62 avec RMSE")
xlabel('Distance en x (m)')
ylabel('Vitesse (km/h)')

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
km_h = 1000/3600;
vbi = -1;
vpi = 20.8762*km_h;
mb = 8;
mp = 80;
Lt = 3;

% G1 : ballon attrapé

vpbf = (mp*vpi + mb*vbi) / (mp + mb)
delta_t1 =  Lt/vpbf

% G2 : ballon pas attrapé
e = 0.8;
vbf = (e*(vpi - vbi) + ((mp*vpi + mb*vbi) / mp)) / (1 + (mb/mp))
vpf = (mp*vpi + mb*vbi - mb*vbf) / mp
delta_t2 =  Lt/vpf


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
