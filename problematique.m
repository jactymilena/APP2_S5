
%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Trajectoire

x = [0 8 15 20 25 ];
y = [ 30 19 20 16 15 ];
n = 4;

[p,S] = polyfit(x,y,n)

x1 = linspace(0,25);
y1 = polyval(p,x1);
figure
plot(x,y,'o')
hold on
plot(x1,y1)
hold off




