% File: prob1_signal_generation.m
% L4a: Signal Generation
% Problem 1


clc;
close all;
clear all;


% 1. Delta Function
n = 0:10;
n0 = 2;
x = (n - n0) == 0;
subplot(2,2,1);
stem(n,x,'filled');
grid on;
title('Delayed Impulse');


% 2. Step Function
n = 0:10;
n0 = 4;
x = (n - n0) >= 0;
subplot(2,2,2);
stem(n,x,'filled');
grid on;
title('Delayed Step');


% 3. Exponential Function
subplot(2,2,3);
n = 0:1:15;
x = (0.8).^n;
stem(n,x,'filled');
grid on;
title('0.8^n');


% 4. Sinusoidal Sequence
subplot(2,2,4);
n = 0:0.1:5;
x = 3*sin(pi*n - pi/4);
stem(n,x,'filled');
grid on;
title('Sinusoidal Sequence');