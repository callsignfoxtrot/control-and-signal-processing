%Factored Form and Pole-Zero Plot

%{
Exercise 3:
Consider the transfer function:
       G(s) = (s^2 + 6*s + 8) / (s^4 + 8*s^3 + 12*s^2 + 16*s + 20)

Obtain the factored form (zeros, poles) and plot the pole-zero map.
%}



% Define numerator and denominator
num = [1 6 8];               
den = [1 8 12 16 20];         

% Create transfer function
G = tf(num, den);

% Compute zeros and poles
z = zero(G)
p = pole(G)

[z,p,k]=tf2zp(num,den)


% Pole-zero map
figure;
pzmap(G);
title('Pole-Zero Map of G(s)');
grid on;

