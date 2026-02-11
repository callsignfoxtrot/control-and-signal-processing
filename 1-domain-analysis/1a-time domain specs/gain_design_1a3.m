%Gain design

%{
Problem 3: Gain Design to Meet a Steady-State Error Specification

Given the open-loop transfer function:
                 K(s + 5)
        G(s) = -----------------
               s(s + 6)(s + 7)(s + 8)

Tasks:
- Consider the system initially with K = 1.
- Compute the velocity error constant (Kv) and steady-state error for a ramp input.
- Determine the required gain K to achieve a desired steady-state velocity error of 0.1%.
- Form the closed-loop system with the calculated K using feedback.
- Check the stability by finding the poles of the closed-loop transfer function.
- Use minreal and MATLAB control system functions (tf, conv, dcgain, feedback) as needed.
%}



clc;
clear;
close all;


% Open-loop transfer function
numg = [1 5];
deng = poly([0 -6 -7 -8]);
G = tf(numg, deng);

% Velocity error constant Kv
numgkv = conv([1 0], numg);     % multiply by s
GKv = tf(numgkv, deng);
GKv = minreal(GKv)

Kvi = dcgain(GKv)              % Kv without gain K

% Desired steady-state ramp error
ess = 0.1

% Gain required
K = 1/(ess * Kvi)

% Closed-loop system
T = feedback(K*G, 1);
poles = pole(T)
