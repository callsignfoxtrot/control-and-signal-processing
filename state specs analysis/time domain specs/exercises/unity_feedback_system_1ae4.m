%Unity feedback system


%{
Exercise 4: Steady-State Error Analysis of a Unity Feedback System

Given the open-loop transfer function:
               5*s^2 + 2*s + 1
G(s) = -----------------------------
        s*(s + 2)*(s + 8)*(s + 45)

Tasks:
1. Determine the steady-state error constants:
   - Position error constant (Kp)
   - Velocity error constant (Kv)
   - Acceleration (parabolic) error constant (Ka)
2. Compute the steady-state error for step, ramp, and parabolic inputs.
3. Plot the respective time-domain responses.
%}


clc;
clear;
close all;

% Open-loop transfer function G(s)
num = [5 2 1];
den = conv([1 0], conv([1 2], conv([1 8], [1 45])));
G = tf(num, den)

% Unity feedback closed-loop system
sys = feedback(G, 1);

% Time vector
t = 0:0.01:10;

% --------------------------------
% Error constants (numeric method)
% --------------------------------

% Position error constant Kp
Kp = dcgain(G);

% Velocity error constant Kv
Kv = dcgain(series(tf([1 0],1), G));   % s*G(s)

% Acceleration error constant Ka
Ka = dcgain(series(tf([1 0 0],1), G)); % s^2*G(s)

disp('Error Constants:');
fprintf('Kp = %f\n', Kp);
fprintf('Kv = %f\n', Kv);
fprintf('Ka = %f\n', Ka);

% --------------------------------
% Steady-state errors
% --------------------------------

ess_step = 1/(1 + Kp);
ess_ramp = 1/Kv;
ess_parabolic = 1/Ka;

disp('Steady-State Errors:');
fprintf('Step input error = %f\n', ess_step);
fprintf('Ramp input error = %f\n', ess_ramp);
fprintf('Parabolic input error = %f\n', ess_parabolic);

% --------------------------------
% Time-domain responses
% --------------------------------

% Step response
figure;
step(sys, t);
grid on;
title('Step Response');

% Ramp response
ramp = t;
[y_ramp, t_ramp] = lsim(sys, ramp, t);

figure;
plot(t_ramp, ramp, '--', t_ramp, y_ramp, 'LineWidth', 1.5);
grid on;
title('Ramp Response');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Input ramp', 'Output');

% Parabolic response
parabolic = 0.5*t.^2;
[y_para, t_para] = lsim(sys, parabolic, t);

figure;
plot(t_para, parabolic, '--', t_para, y_para, 'LineWidth', 1.5);
grid on;
title('Parabolic Response');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Input parabolic', 'Output');
