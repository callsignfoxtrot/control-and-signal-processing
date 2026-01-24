%closed loop system


%{
Problem: Step Response of Two Closed-Loop Systems

Obtain the unit step responses of the following systems and plot both curves
in a single figure window.

System 1:  C1(s)/R(s) = 1 / (s^2 + 0.5*s + 1)
System 2:  C2(s)/R(s) = 1 / (s^2 + 0.5*s + 4)

Tasks:
- Compute the step response of both systems.
- Plot both responses in the same figure.
- Label axes, add grid, and include a legend.
%}
 



clc;
figure(1)

t = 0:0.1:20;

num1 = [0 0 1];
den1 = [1 0.5 1];

num2 = [0 0 1];
den2 = [1 0.5 4];

[y1, x1, t] = step(num1, den1, t);
[y2, x2, t] = step(num2, den2, t);

plot(t, y1, 'g', t, y2, 'r')
xlabel('t(s)')
ylabel('outputs y1 and y2')
title('Step response of two systems')
legend('y1', 'y2')
