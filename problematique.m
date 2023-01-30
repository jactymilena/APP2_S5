
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

P = [ phi1 phi2 phi3 phi4 phi5; ]

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

%p = [ 1 xn(1) xn(1)^2 xn(1)^3 xn(1)^4 xn(1)^5 xn(1)^6 xn(1)^7;
%      1 xn(2) xn(2)^2 xn(2)^3 xn(2)^4 xn(2)^5 xn(2)^6 xn(2)^7;
%      1 xn(3) xn(3)^2 xn(3)^3 xn(3)^4 xn(3)^5 xn(3)^6 xn(3)^7;
%      1 xn(4) xn(4)^2 xn(4)^3 xn(4)^4 xn(4)^5 xn(4)^6 xn(4)^7;
%      1 xn(5) xn(5)^2 xn(5)^3 xn(5)^4 xn(5)^5 xn(5)^6 xn(5)^7 ]

% Pour M = 8
P8 =  [ N         sum(xn)    sum(xn.^2) sum(xn.^3)  sum(xn.^4)  sum(xn.^5)  sum(xn.^6)  sum(xn.^7);
       sum(xn)    sum(xn.^2) sum(xn.^3) sum(xn.^4)  sum(xn.^5)  sum(xn.^6)  sum(xn.^7)  sum(xn.^8);
       sum(xn.^2) sum(xn.^3) sum(xn.^4) sum(xn.^5)  sum(xn.^6)  sum(xn.^7)  sum(xn.^8)  sum(xn.^9);
       sum(xn.^3) sum(xn.^4) sum(xn.^5) sum(xn.^6)  sum(xn.^7)  sum(xn.^8)  sum(xn.^9)  sum(xn.^10);
       sum(xn.^4) sum(xn.^5) sum(xn.^6) sum(xn.^7)  sum(xn.^8)  sum(xn.^9)  sum(xn.^10) sum(xn.^11);
       sum(xn.^5) sum(xn.^6) sum(xn.^7) sum(xn.^8)  sum(xn.^9)  sum(xn.^10) sum(xn.^11) sum(xn.^12);
       sum(xn.^6) sum(xn.^7) sum(xn.^8) sum(xn.^9)  sum(xn.^10) sum(xn.^11) sum(xn.^12) sum(xn.^13);
       sum(xn.^7) sum(xn.^8) sum(xn.^9) sum(xn.^10) sum(xn.^11) sum(xn.^12) sum(xn.^13) sum(xn.^14); ];
  
Y8 =  [ sum(yn) sum(yn.*xn) sum(yn.*xn.^2) sum(yn.*xn.^3) sum(yn.*xn.^4) sum(yn.*xn.^5) sum(yn.*xn.^6) sum(yn.*xn.^7) ]';                                                          
A8 = P8\Y8;

% Pour M = 7
P7 =  [ N         sum(xn)    sum(xn.^2) sum(xn.^3)  sum(xn.^4)  sum(xn.^5)  sum(xn.^6);
       sum(xn)    sum(xn.^2) sum(xn.^3) sum(xn.^4)  sum(xn.^5)  sum(xn.^6)  sum(xn.^7);
       sum(xn.^2) sum(xn.^3) sum(xn.^4) sum(xn.^5)  sum(xn.^6)  sum(xn.^7)  sum(xn.^8);
       sum(xn.^3) sum(xn.^4) sum(xn.^5) sum(xn.^6)  sum(xn.^7)  sum(xn.^8)  sum(xn.^9);
       sum(xn.^4) sum(xn.^5) sum(xn.^6) sum(xn.^7)  sum(xn.^8)  sum(xn.^9)  sum(xn.^10);
       sum(xn.^5) sum(xn.^6) sum(xn.^7) sum(xn.^8)  sum(xn.^9)  sum(xn.^10) sum(xn.^11);
       sum(xn.^6) sum(xn.^7) sum(xn.^8) sum(xn.^9)  sum(xn.^10) sum(xn.^11) sum(xn.^12); ];
  
Y7 =  [ sum(yn) sum(yn.*xn) sum(yn.*xn.^2) sum(yn.*xn.^3) sum(yn.*xn.^4) sum(yn.*xn.^5) sum(yn.*xn.^6) ]';                                                          
A7 = P7\Y7;

% Pour M = 6
P6 =  [ N         sum(xn)    sum(xn.^2) sum(xn.^3)  sum(xn.^4)  sum(xn.^5);
       sum(xn)    sum(xn.^2) sum(xn.^3) sum(xn.^4)  sum(xn.^5)  sum(xn.^6);
       sum(xn.^2) sum(xn.^3) sum(xn.^4) sum(xn.^5)  sum(xn.^6)  sum(xn.^7);
       sum(xn.^3) sum(xn.^4) sum(xn.^5) sum(xn.^6)  sum(xn.^7)  sum(xn.^8);
       sum(xn.^4) sum(xn.^5) sum(xn.^6) sum(xn.^7)  sum(xn.^8)  sum(xn.^9);
       sum(xn.^5) sum(xn.^6) sum(xn.^7) sum(xn.^8)  sum(xn.^9)  sum(xn.^10); ];
  
Y6 =  [ sum(yn) sum(yn.*xn) sum(yn.*xn.^2) sum(yn.*xn.^3) sum(yn.*xn.^4) sum(yn.*xn.^5) ]';                                                          
A6 = P6\Y6;

% Pour M = 5
P5 =  [ N         sum(xn)    sum(xn.^2) sum(xn.^3)  sum(xn.^4);
       sum(xn)    sum(xn.^2) sum(xn.^3) sum(xn.^4)  sum(xn.^5);
       sum(xn.^2) sum(xn.^3) sum(xn.^4) sum(xn.^5)  sum(xn.^6);
       sum(xn.^3) sum(xn.^4) sum(xn.^5) sum(xn.^6)  sum(xn.^7);
       sum(xn.^4) sum(xn.^5) sum(xn.^6) sum(xn.^7)  sum(xn.^8); ];
  
Y5 =  [ sum(yn) sum(yn.*xn) sum(yn.*xn.^2) sum(yn.*xn.^3) sum(yn.*xn.^4) ]';                                                       
A5 = P5\Y5;

% Pour M = 4
P4 =  [ N         sum(xn)    sum(xn.^2) sum(xn.^3);
       sum(xn)    sum(xn.^2) sum(xn.^3) sum(xn.^4);
       sum(xn.^2) sum(xn.^3) sum(xn.^4) sum(xn.^5);
       sum(xn.^3) sum(xn.^4) sum(xn.^5) sum(xn.^6); ];
  
Y4 =  [ sum(yn) sum(yn.*xn) sum(yn.*xn.^2) sum(yn.*xn.^3) ]';                                                          
A4 = P4\Y4;

% Polynômes d'approximation
x = linspace(0, 100);
g8 = A8(1) + A8(2)*x + A8(3)*x.^2 + A8(4)*x.^3 + A8(5)*x.^4 + A8(6)*x.^5 + A8(7)*x.^6 + A8(8)*x.^7;
g7 = A7(1) + A7(2)*x + A7(3)*x.^2 + A7(4)*x.^3 + A7(5)*x.^4 + A7(6)*x.^5 + A7(7)*x.^6;
g6 = A6(1) + A6(2)*x + A6(3)*x.^2 + A6(4)*x.^3 + A6(5)*x.^4 + A6(6)*x.^5;
g5 = A5(1) + A5(2)*x + A5(3)*x.^2 + A5(4)*x.^3 + A5(5)*x.^4;
g4 = A4(1) + A4(2)*x + A4(3)*x.^2 + A4(4)*x.^3;

% Erreur Quadratique
E8 = (g8-yn)'*(g8-yn)
% Erreur RMS
%err_rms8 = sqrt(mean((g8-yn').*(g8-yn')))


% Représentation
figure
plot(xn, yn, 'x')
hold on
plot(x, g8, 'red')
plot(x, g7, 'green')
plot(x, g6, 'blue')
plot(x, g5, 'magenta')
plot(x, g4, 'black')
hold off

%k = inv(p);
%yn_t = yn'
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

