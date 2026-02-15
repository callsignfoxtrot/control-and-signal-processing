%% Exercise 2: FIR Lowpass Filter using Rectangular Window

% Filter specifications
N = 7;                % Number of samples (window length)
wc = 0.2 * pi;        % Cutoff frequency in rad/sample

% Compute the ideal impulse response (sinc function)
n = 0:N-1;            % sample indices
alpha = (N-1)/2;
hd = sin(wc*(n - alpha)) ./ (pi*(n - alpha));  % ideal low-pass response
hd(alpha+1) = wc/pi;   % handle division by zero at n = alpha

% Apply rectangular window (which is just all ones)
w = ones(1, N);
h = hd .* w;

% Plot impulse response
figure;
subplot(2,1,1);
stem(n, h, 'filled');
xlabel('n'); ylabel('h(n)');
title('Impulse Response of FIR Lowpass Filter (Rectangular Window)');
grid on;

% Compute frequency response using FFT
H = fft(h, 512);        % zero-padded FFT for smooth plot
f = linspace(0, pi, 512);
subplot(2,1,2);
plot(f/pi, abs(H), 'LineWidth',1.2);
xlabel('Normalized Frequency (\times \pi rad/sample)');
ylabel('|H(e^{j\omega})|');
title('Magnitude Frequency Response');
grid on;
