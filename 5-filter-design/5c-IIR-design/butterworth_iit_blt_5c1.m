%% L5c: IIR Butterworth Filter Design
clear; clc; close all;

%% Specifications
Fs = 8000;                  % Sampling frequency in Hz
fp = 1000;                  % Passband frequency in Hz
fsb = 1500;                 % Stopband frequency in Hz
Rp = 0.5;                   % Passband ripple in dB
Rs = 30;                    % Stopband attenuation in dB

%% 1. Bilinear Transformation (BLT)

% Normalized digital frequencies (0 to 1 corresponds to 0 to Fs/2)
wp = fp / (Fs/2);           % Normalized passband freq
ws = fsb / (Fs/2);          % Normalized stopband freq

% Determine Butterworth order
[Nb1, wn_b1] = buttord(wp, ws, Rp, Rs);

% Digital Butterworth filter coefficients
[num_but1, den_but1] = butter(Nb1, wn_b1);

%% 2. Impulse Invariant Transformation (IIT)

% Analog frequencies in rad/sec
wpa = 2 * pi * fp;          % passband angular freq
wsa = 2 * pi * fsb;         % stopband angular freq

% Analog Butterworth filter
[Nb2, wn_b2] = buttord(wpa, wsa, Rp, Rs, 's');
[num_but2a, den_but2a] = butter(Nb2, wn_b2, 's');

% Impulse invariant transformation to discrete-time
[num_but2, den_but2] = impinvar(num_but2a, den_but2a, Fs);

%% 3. Frequency response

f = 0:10:Fs/2;  % Frequency vector

% Frequency response of BLT filter
[hb1, w1] = freqz(num_but1, den_but1, f, Fs);

% Frequency response of IIT filter
[hb2, w2] = freqz(num_but2, den_but2, f, Fs);

%% 4. Plot magnitude responses in dB
figure;
plot(f, 20*log10(abs(hb1)), 'b', f, 20*log10(abs(hb2)), 'r','LineWidth',1.2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Butterworth Filter: BLT (blue) vs IIT (red)');
legend('Bilinear Transformation','Impulse Invariant Transformation');
axis([0 Fs/2 -60 5]);

%% 5. Plot magnitude responses (linear scale)
figure;
plot(f, abs(hb1), 'b', f, abs(hb2), 'r','LineWidth',1.2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Butterworth Filter (Linear Scale)');
legend('Bilinear Transformation','Impulse Invariant Transformation');
axis([0 Fs/2 0 1.2]);
