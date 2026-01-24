%Time Domain Step Response

%{
Problem 1: L1a - Time Domain Specifications and Steady State Errors

Obtain the unit step response of the system whose closed-loop transfer function is:
         C(s)/R(s) = 25 / (s^2 + 4s + 25)

Tasks:
1. Plot the unit step response of the system.
2. Obtain the time-domain specifications:
   i) Maximum overshoot (Mp)
  ii) Peak time (tp)
 iii) Rise time (tr)
  iv) Delay time (td)
   v) Settling time (ts)
3. Verify the results theoretically using standard second-order system formulas.

On plot right click mouse and select characteristics option to see time response specifications

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

