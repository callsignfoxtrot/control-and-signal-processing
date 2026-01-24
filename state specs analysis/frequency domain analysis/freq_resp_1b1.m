%Frequency response

%{
Problem 1: Frequency Response and Frequency Domain Specifications

Aim:
To determine the frequency response of a second-order system and evaluate the 
frequency-domain specifications.

Given:
Open-loop transfer function of a unity negative feedback system:

             G(s) = ω
                   -------
                   s(s + 2)

Consider a second-order system of the form:

             C(s)/R(s) = ω
                         s(s + ω)

Tasks:
1. Choose appropriate values of ω and damping ratio ζ (ζ < 0.707).
2. Obtain the closed-loop transfer function.
3. Analyze the frequency response of the system.
4. Evaluate frequency-domain specifications such as:
   - Gain crossover frequency
   - Phase crossover frequency
   - Gain margin
   - Phase margin
%}


clc;
clear;

% Define parameters
omega_n = 10;           % Natural frequency (example value)
zeta = 0.5;             % Damping ratio (<0.707)

% Open-loop transfer function
num = [omega_n^2];      
den = [1 2*zeta*omega_n omega_n^2];
sys = tf(num, den);

% Bode plot and frequency response analysis
figure(1)
bode(sys)
grid on
title('Frequency Response of the Second-Order System')

% Gain margin, phase margin, and crossover frequencies
[Gm, Pm, Wcg, Wcp] = margin(sys);
fprintf('Gain Margin: %.2f dB\nPhase Margin: %.2f deg\n', 20*log10(Gm), Pm);
fprintf('Gain Crossover Frequency: %.2f rad/s\nPhase Crossover Frequency: %.2f rad/s\n', Wcg, Wcp);




clear all
close all
clc

% Inputs
wn = input('enter the natural frequency of oscillation wn = ');
zeta = input('enter the damping ratio zeta = ');   % zeta < 0.707

% Closed-loop second order system
n = wn^2;
d = [1 2*zeta*wn wn^2];
sys = tf(n, d);

% Frequency range
w = logspace(-2, 3, 100);   % 0.01 to 1000 rad/s

% Frequency response
h = freqresp(sys, w);      % complex frequency response
h = squeeze(h);            % remove singleton dimensions

% Real and imaginary parts
reh = real(h);
imh = imag(h);

% Magnitude
magh = sqrt(reh.^2 + imh.^2);

% Alternative magnitude check
mh = abs(h);
maga = mh(:);              % column vector

% Magnitude in dB
magdb = 20*log10(magh);

% Phase (radians and degrees)
phh = atan2(imh, reh);     % radians
phd = phh * 180/pi;        % degrees

% Display numeric table
C = [w(:), magdb(:), phd(:)];
disp('  w(rad/s)      |Mag|(dB)     Phase(deg)')
disp(C)

% Plots
figure
subplot(2,1,1)
semilogx(w, magdb, 'LineWidth', 1.5)
grid on
xlabel('Frequency (rad/s)')
ylabel('Magnitude (dB)')
title('Magnitude Response')

subplot(2,1,2)
semilogx(w, phd, 'LineWidth', 1.5)
grid on
xlabel('Frequency (rad/s)')
ylabel('Phase (deg)')
title('Phase Response')


