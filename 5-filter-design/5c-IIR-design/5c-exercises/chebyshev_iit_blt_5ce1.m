%% Chebyshev I Filter Design

clear; clc; close all;

%% Specifications (same as Butterworth example)
Fs = 8000;          % Sampling frequency in Hz
fp = 1000;          % Passband frequency in Hz
fsb = 1500;         % Stopband frequency in Hz
Rp = 0.5;           % Passband ripple in dB
Rs = 30;            % Stopband attenuation in dB

% Normalized digital frequencies for BLT
wp = fp / (Fs/2);   
ws = fsb / (Fs/2);

% Analog frequencies in rad/sec for IIT
wpa = 2*pi*fp;      
wsa = 2*pi*fsb;

f = 0:10:Fs/2;      % Frequency vector

%% --- Chebyshev Type I ---

% 1. Bilinear Transformation
[Nc11, wn_c11] = cheb1ord(wp, ws, Rp, Rs);
[num_c11, den_c11] = cheby1(Nc11, Rp, wn_c11);

% 2. Impulse Invariant Transformation
[Nc12, wn_c12] = cheb1ord(wpa, wsa, Rp, Rs, 's');
[num_c12a, den_c12a] = cheby1(Nc12, Rp, wn_c12, 's');
[num_c12, den_c12] = impinvar(num_c12a, den_c12a, Fs);

% Frequency responses
hc11 = freqz(num_c11, den_c11, f, Fs);
hc12 = freqz(num_c12, den_c12, f, Fs);

% Plot magnitude in dB
figure;
plot(f, 20*log10(abs(hc11)), 'b', f, 20*log10(abs(hc12)), 'r', 'LineWidth', 1.2);
grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
title('Chebyshev I Filter: BLT (blue) vs IIT (red)');
legend('Bilinear Transformation','Impulse Invariant Transformation');
axis([0 Fs/2 -60 5]);

% Plot linear magnitude
figure;
plot(f, abs(hc11), 'b', f, abs(hc12), 'r', 'LineWidth', 1.2);
grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude');
title('Chebyshev I Filter (Linear Scale)');
legend('Bilinear Transformation','Impulse Invariant Transformation');

%% --- Chebyshev Type II ---

% 1. Bilinear Transformation
[Nc21, wn_c21] = cheb2ord(wp, ws, Rp, Rs);
[num_c21, den_c21] = cheby2(Nc21, Rs, wn_c21);

% 2. Impulse Invariant Transformation
[Nc22, wn_c22] = cheb2ord(wpa, wsa, Rp, Rs, 's');
[num_c22a, den_c22a] = cheby2(Nc22, Rs, wn_c22, 's');
[num_c22, den_c22] = impinvar(num_c22a, den_c22a, Fs);

% Frequency responses
hc21 = freqz(num_c21, den_c21, f, Fs);
hc22 = freqz(num_c22, den_c22, f, Fs);

% Plot magnitude in dB
figure;
plot(f, 20*log10(abs(hc21)), 'b', f, 20*log10(abs(hc22)), 'r', 'LineWidth', 1.2);
grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude (dB)');
title('Chebyshev II Filter: BLT (blue) vs IIT (red)');
legend('Bilinear Transformation','Impulse Invariant Transformation');
axis([0 Fs/2 -60 5]);

% Plot linear magnitude
figure;
plot(f, abs(hc21), 'b', f, abs(hc22), 'r', 'LineWidth', 1.2);
grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude');
title('Chebyshev II Filter (Linear Scale)');
legend('Bilinear Transformation','Impulse Invariant Transformation');
