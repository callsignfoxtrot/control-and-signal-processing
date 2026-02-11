clc;
clear all;
close all;


x1 = input('Enter the first sequence x1[n] = ');
x2 = input('Enter the second sequence x2[n] = ');


N = max(length(x1), length(x2));


% Circular convolution
Y = cconv(x1, x2, N);


% Plot
stem(0:N-1, Y, 'filled');
xlabel('n'); ylabel('Y(n)');
title('Circularly Convoluted Sequence'); grid on;