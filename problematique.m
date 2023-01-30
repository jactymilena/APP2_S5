
%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Trajectoire - polynome d'interpolation

xn = [0 8 15 20 25 ];
yn = [ 30 19 20 16 12.7843 ];
names = {'A', 'B', 'C', 'D', 'E'}

P = [ 1 xn(1) xn(1)^2 xn(1)^3 xn(1)^4;
      1 xn(2) xn(2)^2 xn(2)^3 xn(2)^4;
      1 xn(3) xn(3)^2 xn(3)^3 xn(3)^4;
      1 xn(4) xn(4)^2 xn(4)^3 xn(4)^4;
      1 xn(5) xn(5)^2 xn(5)^3 xn(5)^4 ]

A = pinv(P)*yn'

r = roots([A(5)*4 A(4)*3 A(3)*2 A(2)])
x = linspace(0,25);
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

p = [ 1 xn(1) xn(1)^2 xn(1)^3 xn(1)^4 xn(1)^5 xn(1)^6 xn(1)^7;
      1 xn(2) xn(2)^2 xn(2)^3 xn(2)^4 xn(2)^5 xn(2)^6 xn(2)^7;
      1 xn(3) xn(3)^2 xn(3)^3 xn(3)^4 xn(3)^5 xn(3)^6 xn(3)^7;
      1 xn(4) xn(4)^2 xn(4)^3 xn(4)^4 xn(4)^5 xn(4)^6 xn(4)^7;
      1 xn(5) xn(5)^2 xn(5)^3 xn(5)^4 xn(5)^5 xn(5)^6 xn(5)^7 ]

k = pinv(p)
yn_t = yn'
%coeff = k.*yn_t

%plot(xn, yn, 'o')
  
%[p,S] = polyfit(x,y,n)

%x1 = linspace(0,100);
%y1 = polyval(p,x1);
%figure
%plot(x,y,'o')
%hold on
%plot(x1,y1)
%hold off

%g = 0.0001*x.^2 - 0.0092*x + 0.8668;

% Erreur quadratique
%E = sum((g-y).^2)
%E2 = (g-y)'*(g-y);

% RMSE
%err_rms = sqrt(mean((g-y).*(g-y)))

%% Coussin-trampoline

mg = 9.81*80;
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
C = ( (g*(1-kf)) / v0 ) - ( b*v0 / m );
K = ( (-g*(1-kf)) / v0^2 ) - ( b / m );

% Vitesses
dvi = vi - v0;
dvf = vf - v0;

% Hauteur z
z = (log(dvf) - log(dvi)) ./ K 

