%Magnitude and Phase

%{
Exercise 1: Magnitude and Phase of a Transfer Function

Objective:
Using MATLAB commands, find the magnitude and phase angle of the system with 
the transfer function:

             G(s) = 5/s + 3

at s = 3 rad/s.

Tasks:
1. Define the transfer function G(s).
2. Evaluate the complex value of G(s) at s = j*3.
3. Calculate the magnitude and phase angle (in degrees).
%}


% Matlab code
GNUM = [5];
GDEN = [1 2];

s = 3j;   % s = j3

Gj3 = polyval(GNUM, s) / polyval(GDEN, s)   % complex value at s = j3

magGj3 = abs(Gj3)                            % magnitude
phaseGj3 = angle(Gj3) * 180/pi               % phase in degree