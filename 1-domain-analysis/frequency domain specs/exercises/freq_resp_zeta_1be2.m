
%{
Exercise 2: Frequency Response of a Second Order System

Consider the standard second order transfer function:

                M(s) = ω_n^2
                       ----------------
                       s^2 + 2ζω_n s + ω_n^2

Define the normalized natural frequency ω_n = 5 rad/s.

Objective:
Plot the frequency response (magnitude and phase) of the system for different
values of damping ratio ζ given by:

ζ = 0.25, 0.5, 0.707, and 1

Tasks:
1. Form the transfer function for each value of ζ.
2. Plot the frequency response using Bode plots.
3. Compare the effect of damping ratio on frequency response characteristics.
%}







clc; clear; close all;

% Frequency vector
wv = linspace(0, 3, 500);     % 0 to 3 rad/s
z = [0.25 0.5 0.707 1];       % damping ratios

for k = 1:4
    mmag = 1 ./ sqrt((1 - wv.^2).^2 + (2*z(k)*wv).^2);  % magnitude formula
    plot(wv, mmag, 'LineWidth', 1.5)
    hold on
end

gtext('\zeta=0.25') 
gtext('\zeta=0.5')
gtext('\zeta=0.707')
gtext('\zeta=1')

title('Frequency response of M(s)')
xlabel('\omega (rad/s)')
ylabel('|M(j\omega)|')
grid on
