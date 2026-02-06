clc;
clear;

n = -10:10;

% define x(n) analytically
x  = double(n >= 0) - double(n >= 5);

% define x(-n) analytically
xm = double(-n >= 0) - double(-n >= 5);

% even and odd components
xe = (x + xm)/2;
xo = (x - xm)/2;

subplot(3,1,1);
stem(n,x,'filled');
grid on;
title('x(n)');

subplot(3,1,2);
stem(n,xe,'filled');
grid on;
title('Even Component');

subplot(3,1,3);
stem(n,xo,'filled');
grid on;
title('Odd Component');
