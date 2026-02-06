clc;
clear all;
close all;

n = 0:5;

% Generate signals
x1 = 1.*(n>=1 & n<=4);   % x1(n)
x2 = 1.*(n>=2 & n<=4);   % x2(n)

N1 = length(x1);
N2 = length(x2);

% Linear convolution
x3 = conv(x1, x2);

n1 = 0:1:(N1+N2-2);

% Plots
subplot(3,1,1);
stem(n, x1, 'filled');
xlabel('n');
ylabel('x1(n)');
title('Signal x1(n)');
grid on;

subplot(3,1,2);
stem(n, x2, 'filled');
xlabel('n');
ylabel('x2(n)');
title('Signal x2(n)');
grid on;

subplot(3,1,3);
stem(n1, x3, 'filled');
xlabel('n');
ylabel('x3(n)');
title('x1(n) * x2(n)');
grid on;
