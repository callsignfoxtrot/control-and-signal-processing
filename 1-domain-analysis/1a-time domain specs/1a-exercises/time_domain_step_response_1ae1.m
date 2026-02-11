%Time Domain Step Response

%{
Exercise 1: Impulse Response of a Closed-Loop System

Given the closed-loop transfer function:
                5s^2 + 3s + 6
        C(s) = ----------------
               s^3 + 6s^2 + 11s + 6

Tasks:
- Obtain the unit impulse response of the system.
- Plot the response in MATLAB.
- Label axes and add grid for clarity.
%}

clc;
clear;
close all;

% Impulse response
num = [5 3 6];
den = [1 6 11 6];

figure(1)
impulse(num, den)
grid on
title('Unit impulse response')
xlabel('t')
ylabel('Output')

