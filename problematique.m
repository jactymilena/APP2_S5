
%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Trajectoire - polynome d'interpolation

x = [0 8 15 20 25 ];
y = [ 30 19 20 16 15 ];
n = 4;

[p,S] = polyfit(x,y,n);

x1 = linspace(0,25);
y1 = polyval(p,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

%% Trajectoire - polynome d'approximation
dx = 10;
x = [0:dx:100];
y = [ 0.87 0.78 0.71 0.61 0.62 0.51 0.51 0.49 0.46 0.48 0.46 ];
n = 2;

[p,S] = polyfit(x,y,n)

x1 = linspace(0,100);
y1 = polyval(p,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off

g = 0.0001*x.^2 - 0.0092*x + 0.8668;

% Erreur quadratique
E = sum((g-y).^2)
E2 = (g-y)'*(g-y);

% RMSE
err_rms = sqrt(mean((g-y).*(g-y)))

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
