%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Probleme 6
x0 = -0.5;
m = 10;
g = -9.81;
k1 = 500;
k3 = 200;
mg = m*g;

x = 0;
dx = x - x0;

% b) -0.1933 m
xeq_b = roots([k3 0 k1 -mg]);

% c)
f = -(k1 + 3*k3*x0.^2)*dx - k1*x0 - k3*x0.^3 + mg;

% d)
keq = k1 + 3.*k3.*xeq_b.^2;

% e)
xeq_e = mg / 522.4;

% f)
xeq_f = mg / k1;

%% Probleme 7

x = [ 2.3 14.7 29.7 31.9 45.7 58.6 ];
h = [ 184 860 1345 1385 1360 965 ];

plot(x, h, 'o')
