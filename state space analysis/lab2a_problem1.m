 
%SISO Response

%{

Problem 1

To represent a transfer function in state space form and vice versa.
Also to obtain the step response of a SISO system.

Given transfer function:
G(s) = (s^3 + 5s^2 + 4s + 6) / (4s^3 + 7s^2 + 12s + 9)
%}

num = [1 5 4 6];
den = [4 7 12 9];
G = tf(num, den);

% Transfer function to state space
[A, B, C, D] = tf2ss(num, den)

% State space to transfer function
[num_ss, den_ss] = ss2tf(A, B, C, D)

% Step response from state space model
figure(1)
step(A, B, C, D)
grid on