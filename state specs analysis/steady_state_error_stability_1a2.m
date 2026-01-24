%Steady State Errors and Stability


%{
Problem 2: Steady-State Errors and Stability Analysis

Given the open-loop transfer function:
                 500(s + 2)(s + 5)(s + 6)
        G(s) = ----------------------------
                    s(s + 8)(s + 10)(s + 12)

Tasks:
- Find the steady-state errors for step, ramp, and parabolic inputs.
- Check system stability by finding the poles of the closed-loop system.
- Calculate position error constant (Kp), velocity error constant (Kv), and
  corresponding steady-state errors.
- Simplify transfer functions using minreal as needed.
%}


% Open-loop transfer function
numg = 500*poly([-2 -5 -6]);      % zeros at -2, -5, -6
deng = poly([0 -8 -10 -12]);      % poles at 0, -8, -10, -12
G = tf(numg, deng);


% Check stability (closed loop)
T = feedback(G,1);
poles = pole(T)


% Step input (Position error constant)
kp = dcgain(G);                  % Position error coefficient
ess_step = 1/(1 + kp)


% Ramp input (Velocity error constant)
numsg = conv([1 0], numg);       % multiply G(s) by s
sG = tf(numsg, deng);
sG = minreal(sG);

Kv = dcgain(sG);                 % Velocity error coefficient
ess_ramp = 1/Kv


% Parabolic input (Acceleration error constant)
nums2g = conv([1 0 0], numg);    % multiply G(s) by s^2
s2G = tf(nums2g, deng);
s2G = minreal(s2G);

Ka = dcgain(s2G);                % Acceleration error coefficient
ess_parabolic = 1/Ka
