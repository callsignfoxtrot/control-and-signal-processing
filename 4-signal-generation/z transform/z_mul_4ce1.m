clc;
clear all;


syms z;


X1 = 1 + 2*z^(-1) + 3*z^(-2);
X2 = 1 + 3*z^(-1) + 4*z^(-2);


X3 = expand(X1 * X2);


disp('X3(z) = X1(z) * X2(z) =');
X3