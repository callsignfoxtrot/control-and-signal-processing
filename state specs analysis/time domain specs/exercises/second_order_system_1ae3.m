%Second order system


%{
Exercise 3: Time-Domain Analysis of a Second-Order System

Given the closed-loop transfer function:
             C(s)
G(s) = ------------
         R(s) = s^2 + 2*zeta*wn*s + wn^2

Where:
- Damping ratio, zeta = 0.6
- Natural frequency, wn = 8

Tasks:
1. Obtain the step, impulse, and ramp responses of the system.
2. Compute time-domain specifications (rise time, peak time, maximum overshoot, settling time, delay time) from step response.
3. Verify the results theoretically.
%}




clc;
clear;
close all;

% Given parameters
zeta = 0.6;
wn = 8;

% Transfer function
num = wn^2;
den = [1 2*zeta*wn wn^2];
sys = tf(num, den);

% Time vector
t = 0:0.001:5;

% Step response
figure;
step(sys, t);
grid on;
title('Step Response');

% Impulse response
figure;
impulse(sys, t);
grid on;
title('Impulse Response');

% Ramp response
ramp = t;
[y_ramp, t_ramp] = lsim(sys, ramp, t);

figure;
plot(t_ramp, y_ramp, 'LineWidth', 1.5);
grid on;
title('Ramp Response');
xlabel('Time (s)');
ylabel('Output');

% Time-domain specifications from step response
info = stepinfo(sys);

disp('Time Domain Specifications:');
disp(info);

% Theoretical values
wd = wn*sqrt(1 - zeta^2);
Tp = pi/wd;
Ts = 4/(zeta*wn);
Mp = exp(-zeta*pi/sqrt(1 - zeta^2))*100;

fprintf('\nTheoretical Values:\n');
fprintf('Peak Time Tp = %.4f s\n', Tp);
fprintf('Settling Time Ts = %.4f s\n', Ts);
fprintf('Percent Overshoot Mp = %.2f %%\n', Mp);
