
%% Clean up
clc % vide ligne de commande
clear all % vide workspace
close all % vide fenetres et graphiques

%% Trajectoire - polynome d'interpolation

x = [0 8 15 20 25 ];
y = [ 30 19 20 16 15 ];
n = 5;

p = [ 1 x(1) x(1)^2 x(1)^3 x(1)^4;
      1 x(2) x(2)^2 x(2)^3 x(2)^4;
      1 x(3) x(3)^2 x(3)^3 x(3)^4;
      1 x(4) x(4)^2 x(4)^3 x(4)^4;
      1 x(5) x(5)^2 x(5)^3 x(5)^4 ]
      

coeff = pinv(p'*p)*p'*y'

r = roots([coeff(5)*4 coeff(4)*3 coeff(3)*2 coeff(2)])

 

%[p,S] = polyfit(x,y,n);

%x1 = linspace(0,25);
%y1 = polyval(p,x1);
%figure
%plot(x,y,'o')
%hold on
%plot(x1,y1)
%hold off
 


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
C = ( (g.*(1-kf)) ./ v0 ) - ( b.*v0 ./ m )
K = ( (g.*(1+kf)) ./ v0.^2 ) - ( (b.*v0) ./ m );

% Vitesses
dvi = vi - v0;
dvf = vf - v0;

% Hauteur z
z = ( (dvf^2 - dvi^2) / 2*C ) * -K 


