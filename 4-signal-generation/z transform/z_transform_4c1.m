clc;
clear all;

syms n a z real;

% a) x(n) = (0.5)^n
x1 = (0.5)^n;
disp('Z-transform of (0.5)^n is');
X1 = ztrans(x1, n, z)

% b) x(n) = n
x2 = n;
disp('Z-transform of n is');
X2 = ztrans(x2, n, z)

% c) x(n) = n*a^n
x3 = n*(a^n);
disp('Z-transform of n*(a^n) is');
X3 = ztrans(x3, n, z)